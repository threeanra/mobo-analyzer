import Navbar from "@/components/navbar/navbar"
import { Button } from "@/components/ui/button"
import { Link } from "react-router-dom"
import Image from "../assets/Motherboard.jpg"

export default function Home() {
  return (
    <>
      <Navbar/>
      <div className="min-h-screen lg:h-screen relative isolate overflow-hidden bg-gradient-to-br from-blue-50 via-white to-indigo-50">
        <svg
          aria-hidden="true"
          className="absolute inset-0 -z-10 size-full stroke-gray-200 [mask-image:radial-gradient(100%_100%_at_top_right,white,transparent)]"
        >
          <defs>
            <pattern
              x="50%"
              y={-1}
              id="0787a7c5-978c-4f66-83c7-11c213f99cb7"
              width={200}
              height={200}
              patternUnits="userSpaceOnUse"
            >
              <path d="M.5 200V.5H200" fill="none"/>
            </pattern>
          </defs>
          <rect fill="url(#0787a7c5-978c-4f66-83c7-11c213f99cb7)" width="100%" height="100%" strokeWidth={0}/>
        </svg>
        <div className="mx-auto max-w-7xl px-6 pb-10 pt-10 lg:flex lg:px-8 lg:py-40">
          <div className="mx-auto max-w-2xl lg:mx-0 lg:shrink-0 lg:pt-8">
            <div className="mt-24 sm:mt-32 lg:mt-16">
              <div className="inline-flex space-x-6">
              <span className="rounded-full bg-indigo-50 px-3 py-1 text-sm/6 font-semibold text-indigo-600 ring-1 ring-inset ring-indigo-600/20 italic">
                Forward Chaining
              </span>
                <span className="inline-flex items-center space-x-2 text-sm/6 font-medium text-gray-600">
                <span>v{import.meta.env.VITE_APP_VERSION}</span>
              </span>
              </div>
            </div>
            <h1 className="mt-10 text-pretty text-5xl font-semibold tracking-tight text-gray-900 sm:text-7xl">
              Mobo Analyzer
            </h1>
            <p className="mt-8 text-pretty text-lg font-medium text-gray-500 sm:text-xl/8">
              Membantu Anda menganalisa kerusakan pada motherboard secara detail, mulai dari mengidentifikasi gejala, menemukan penyebab utama, hingga memberikan rekomendasi solusi
              yang tepat untuk memperbaiki <span className="font-bold">Motherboard</span> anda
            </p>
            <div className="mt-10 flex items-center gap-x-6">
              <Button className="bg-blue-500 hover:bg-blue-600" asChild>
                <Link to={"/diagnose"}>
                  Diagnosa <span aria-hidden="true">→</span>
                </Link>
              </Button>
            </div>
            <div className="hidden lg:block absolute bottom-0 mb-8 text-sm font-light italic text-gray-600">
              ©{new Date().getFullYear()} Trian Radis Pengestu created with ❤.
            </div>
          </div>
          <div className="mx-auto mt-16 flex max-w-2xl sm:mt-24 lg:ml-10 lg:mr-0 lg:mt-0 lg:max-w-none lg:flex-none xl:ml-32 md:pb-0">
            <div className="max-w-3xl flex-none sm:max-w-5xl lg:max-w-none">
              <div className="-m-2 rounded-xl bg-indigo-900/5  p-2 ring-1 ring-inset ring-gray-900/10 lg:-m-4 lg:rounded-2xl lg:p-4">
                <img
                  alt="Motherboard"
                  src={Image}
                  width={2432}
                  height={1442}
                  className="w-[76rem] rounded-md bg-gray-50 shadow-xl ring-1 ring-gray-900/10"
                />
              </div>
            </div>
          </div>
        </div>
        <div className="lg:hidden text-center px-6 pb-8 text-sm font-light italic text-gray-600 bg-gray-50">
          ©{new Date().getFullYear()} Trian Radis Pengestu created with ❤.
        </div>
      </div>
    </>
  )
}