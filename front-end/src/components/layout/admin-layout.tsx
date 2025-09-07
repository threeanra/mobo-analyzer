import { Loading } from "@/components/ui/loading"
import { useAuth } from "@/context/useAuth"
import { useEffect, useState } from "react"
import { Navigate, Outlet } from "react-router-dom"

export default function AuthLayout() {
  const { user, isInitialized } = useAuth()
  const [ready, setReady] = useState(false)

  useEffect(() => {
    if (isInitialized) {
      const timeout = setTimeout(() => setReady(true), 500)
      return () => clearTimeout(timeout)
    }
  }, [isInitialized])

  if (!ready) return <Loading show={true} />

  if (!user) {
    return <Navigate to="/auth/login" replace />
  }

  if (user.role === "admin") {
    <Navigate to="/admin/dashboard" replace />
  }

  if (user.role === "user") {
    <Navigate to="/" replace />
  }

  return <Outlet />
}
