"use client"

import Navbar from "@/components/navbar/navbar"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Card } from "@/components/ui/card"
import { Loading } from "@/components/ui/loading"
import httpClient from "@/lib/axios-client"
import type { response } from "@/types/response"
import type { Symptom } from "@/types/symptom"
import { useMutation, useQuery } from "@tanstack/react-query"
import { Activity, AlertCircle, ArrowLeft, CheckCircle, CircleQuestionMark, XCircle } from "lucide-react"
import { useState } from "react"

interface AnalyzeResult {
  diagnose: string
  solution: string
  matched: number
  total: number
  percentage: number
}

export default function AnalyzePage() {
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0)
  const [selectedSymptomIds, setSelectedSymptomIds] = useState<string[]>([])
  const [selectedSymptoms, setSelectedSymptoms] = useState<Symptom[]>([])
  const [isDiagnosing, setIsDiagnosing] = useState(false)
  const [diagnosisResult, setDiagnosisResult] = useState<AnalyzeResult[] | null>(null)

  const { data: symptoms, isFetching } = useQuery({
    queryKey: ["questions"],
    queryFn: async () => {
      const response = await httpClient.get<response<Symptom[]>>(`/api/symptoms`)
      return response.data.result
    },
  })

  const { mutate } = useMutation({
    mutationFn: async (symptomIds: string[]) => {
      const response = await httpClient.post(`/api/analyze`, {
        symptoms: symptomIds,
      })
      return response.data
    },
    onSuccess: (data) => {
      setDiagnosisResult(data.result)
      setIsDiagnosing(false)
    },
    onError: (error) => {
      console.error("Diagnosis error:", error)
      setDiagnosisResult([])
      setIsDiagnosing(false)
    },
  })

  const startDiagnosis = (finalSymptomIds: string[]) => {
    setIsDiagnosing(true)
    mutate(finalSymptomIds)
  }

  const handleYes = () => {
    const currentSymptom = symptoms?.[currentQuestionIndex]
    if (!currentSymptom) return

    const updatedSymptomIds = [...selectedSymptomIds, currentSymptom.id]
    const updatedSymptoms = [...selectedSymptoms, currentSymptom]

    if (symptoms && currentQuestionIndex === symptoms.length - 1) {
      setSelectedSymptomIds(updatedSymptomIds)
      setSelectedSymptoms(updatedSymptoms)
      startDiagnosis(updatedSymptomIds)
    } else {
      setSelectedSymptomIds(updatedSymptomIds)
      setSelectedSymptoms(updatedSymptoms)
      setCurrentQuestionIndex((prev) => prev + 1)
    }
  }

  const handleNo = () => {
    if (symptoms && currentQuestionIndex === symptoms.length - 1) {
      startDiagnosis(selectedSymptomIds)
    } else {
      setCurrentQuestionIndex((prev) => prev + 1)
    }
  }

  const handleBack = () => {
    if (currentQuestionIndex > 0) {
      const previousSymptom = symptoms?.[currentQuestionIndex - 1]
      if (previousSymptom) {
        setSelectedSymptomIds((prev) => prev.filter((id) => id !== previousSymptom.id))
        setSelectedSymptoms((prev) => prev.filter((symptom) => symptom.id !== previousSymptom.id))
      }
      setCurrentQuestionIndex((prev) => prev - 1)
    }
  }

  const resetDiagnosis = () => {
    setCurrentQuestionIndex(0)
    setSelectedSymptomIds([])
    setSelectedSymptoms([])
    setIsDiagnosing(false)
    setDiagnosisResult(null)
  }

  const currentSymptom = symptoms?.[currentQuestionIndex]
  const progress = ((currentQuestionIndex + 1) / (symptoms?.length || 1)) * 100
  const isQuestionMode = !isDiagnosing && diagnosisResult === null

  return (
    <>
      <Navbar/>
      <div
        className={`min-h-dvh relative flex justify-center items-center bg-gradient-to-br from-blue-50 via-white to-indigo-50 ${
          isQuestionMode && isDiagnosing ? "flex items-center" : "py-32"
        }`}
      >
        <div className="mx-auto">
          <Loading show={isFetching}/>

          {!isDiagnosing && diagnosisResult === null && symptoms && currentSymptom && (
            <Card className="w-[25rem] md:w-[76rem] px-8 py-12 shadow-none border-none">
              <div className="mb-8">
                <div className="flex justify-between items-center mb-3">
                    <span className="text-sm font-medium text-gray-600">
                      Pertanyaan {currentQuestionIndex + 1} dari {symptoms.length}
                    </span>
                  <span className="text-sm font-medium text-blue-600">{Math.round(progress)}% selesai</span>
                </div>
                <div className="w-full bg-gray-200 rounded-full h-3">
                  <div
                    className="bg-gradient-to-r from-blue-500 to-blue-600 h-3 rounded-full transition-all duration-500 ease-out"
                    style={{ width: `${progress}%` }}
                  ></div>
                </div>
              </div>

              <div className="text-center mb-8">
                <div className="inline-flex items-center justify-center w-12 h-12 bg-blue-100 rounded-full mb-4">
                  <CircleQuestionMark  className="w-6 h-6 text-blue-600"/>
                </div>
                <h2 className="text-2xl font-bold text-gray-900 mb-4 leading-relaxed">{currentSymptom.question}</h2>
              </div>

              <div className="flex flex-col sm:flex-row gap-4 justify-center mb-8">
                <Button
                  onClick={handleYes}
                  className="bg-gradient-to-r from-green-500 to-green-600 hover:from-green-600 hover:to-green-700 text-white px-8 py-4 text-lg font-medium transition-all duration-200 flex items-center justify-center gap-2 min-w-[140px]"
                  disabled={isDiagnosing}
                >
                  <CheckCircle className="w-5 h-5"/>
                  Ya
                </Button>
                <Button
                  onClick={handleNo}
                  className="bg-gradient-to-r from-red-500 to-red-600 hover:from-red-600 hover:to-red-700 text-white px-8 py-4 text-lg font-medium transition-all duration-200 flex items-center justify-center gap-2 min-w-[140px]"
                  disabled={isDiagnosing}
                >
                  <XCircle className="w-5 h-5"/>
                  Tidak
                </Button>
              </div>

              {currentQuestionIndex > 0 && (
                <div className="flex justify-center mb-6">
                  <Button
                    onClick={handleBack}
                    variant="outline"
                    className="border-gray-300 text-gray-600 hover:bg-gray-50 px-6 py-2 rounded-lg flex items-center gap-2 bg-transparent"
                    disabled={isDiagnosing}
                  >
                    <ArrowLeft className="w-4 h-4"/>
                    Kembali
                  </Button>
                </div>
              )}

              <div className="text-center">
                <div className="inline-flex items-center gap-2 px-4 py-2 bg-blue-50 rounded-full">
                  <div className="w-2 h-2 bg-blue-500 rounded-full"></div>
                  <span className="text-sm font-medium text-blue-700">
                      {selectedSymptomIds.length} gejala dipilih
                    </span>
                </div>
              </div>
            </Card>
          )}

          {isDiagnosing && diagnosisResult === null && (
            <Card className="w-[25rem] mx-auto md:w-[76rem] px-8 py-12 shadow-none border-none">
              <div className="flex flex-col items-center space-y-6">
                <div className="relative">
                  <div className="animate-spin rounded-full h-16 w-16 border-4 border-blue-200 border-t-blue-600"></div>
                  <Activity className="absolute inset-0 m-auto w-6 h-6 text-blue-600"/>
                </div>
                <div>
                  <h2 className="text-2xl font-semibold text-blue-600 mb-2">Tunggu...</h2>
                </div>
              </div>
            </Card>
          )}

          {diagnosisResult && !isDiagnosing && (
            <div className="space-y-6">
              <Card className="w-[25rem] mx-auto md:w-[76rem] px-8 py-12 shadow-none border-none">
                <div className="text-center mt-5 mb-8">
                  <div className="inline-flex items-center justify-center w-16 h-16 bg-green-100 rounded-full mb-4">
                    <CheckCircle className="w-8 h-8 text-green-600"/>
                  </div>
                  <h2 className="text-3xl font-bold text-gray-900 mb-2">Hasil Diagnosis</h2>
                  <p className="text-gray-600">Berikut adalah hasil diagnosis berdasarkan gejala yang dipilih</p>
                </div>

                {/* Selected Symptoms */}
                <div className="mb-8">
                  <h3 className="text-lg font-semibold text-gray-900 mb-4">Gejala yang Dipilih:</h3>
                  <div className="flex flex-wrap gap-2">
                    {selectedSymptoms.length > 0 ? (
                      selectedSymptoms.map((symptom) => (
                        <Badge key={symptom.id} variant="secondary" className="bg-blue-100 text-blue-800 px-3 py-1">
                          {symptom.name}
                        </Badge>
                      ))
                    ) : (
                      <p className="text-gray-500 italic">Tidak ada gejala yang dipilih</p>
                    )}
                  </div>
                </div>

                <div className="space-y-4 mb-8">
                  <h3 className="text-lg font-semibold text-gray-900">Kemungkinan Diagnosis:</h3>
                  {diagnosisResult.length > 0 ? (
                    diagnosisResult.map((result, index) => (
                      <div
                        key={index}
                        className="p-6 border border-gray-200 rounded-xl bg-gradient-to-r from-gray-50 to-white"
                      >
                        <div className="flex items-start justify-between mb-3">
                          <h4 className="text-xl font-semibold text-gray-900 w-52 md:w-full">{result.diagnose}</h4>
                          <Badge
                            variant={
                              result.percentage >= 70 ? "default" : result.percentage >= 50 ? "secondary" : "outline"
                            }
                            className={`${
                              result.percentage >= 70
                                ? "bg-green-100 text-green-800"
                                : result.percentage >= 50
                                  ? "bg-yellow-100 text-yellow-800"
                                  : "bg-red-100 text-red-800"
                            }`}
                          >
                            {result.percentage}% cocok
                          </Badge>
                        </div>
                        <p className="text-gray-700 mb-3 leading-relaxed">{result.solution}</p>
                        <div className="flex items-center gap-4 text-sm text-gray-600">
                            <span>
                              Kecocokan: {result.matched}/{result.total} gejala
                            </span>
                          <div className="flex-1 bg-gray-200 rounded-full h-2">
                            <div
                              className={`h-2 rounded-full ${
                                result.percentage >= 70
                                  ? "bg-green-500"
                                  : result.percentage >= 50
                                    ? "bg-yellow-500"
                                    : "bg-red-500"
                              }`}
                              style={{ width: `${result.percentage}%` }}
                            ></div>
                          </div>
                        </div>
                      </div>
                    ))
                  ) : (
                    <div className="text-center py-8">
                      <AlertCircle className="w-12 h-12 text-gray-400 mx-auto mb-4"/>
                      <p className="text-gray-600">Tidak ada hasil diagnosis yang ditemukan</p>
                    </div>
                  )}
                </div>

                <div className="text-center">
                  <Button
                    onClick={resetDiagnosis}
                    className="text-white px-8 py-3"
                  >
                    Mulai Diagnosis Baru
                  </Button>
                </div>
              </Card>

              {diagnosisResult.length > 0 && (
                <Card className="p-6 w-[25rem] mx-auto md:w-[76rem]  border-yellow-200 shadow-none">
                  <div className="flex items-start gap-3">
                    <AlertCircle className="w-5 h-5 text-yellow-600 mt-0.5 flex-shrink-0"/>
                    <div>
                      <h4 className="font-semibold text-yellow-800 mb-1">Penting untuk diketahui</h4>
                      <p className="text-sm text-yellow-700">
                        Hasil diagnosis ini hanya sebagai referensi awal. Untuk diagnosis yang akurat silahkan konsultasi dengan teknisi
                      </p>
                    </div>
                  </div>
                </Card>
              )}
            </div>
          )}
        </div>

        <div className="absolute text-center px-6 pb-8 text-sm font-light italic text-gray-600 bg-gray-50 bottom-0">
          ©{new Date().getFullYear()} Trian Radis Pengestu created with ❤
        </div>
      </div>
    </>
  )
}
