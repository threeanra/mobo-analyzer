import { Button } from "@/components/ui/button"
import { ArrowLeft } from "lucide-react"
import { useNavigate } from "react-router-dom"

export default function Error404Page() {
  const navigate = useNavigate()
  const handleBack = () => {
    navigate("/", { replace: true })
  }

  return (
    <div className="h-screen flex flex-col justify-center items-center gap-4">
      <h1 className="text-4xl font-bold">Halaman tidak ditemukan</h1>
      <Button className="mt-4" onClick={handleBack}>
        <ArrowLeft/>
        Kembali ke halaman utama
      </Button>
    </div>
  )
}