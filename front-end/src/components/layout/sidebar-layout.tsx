import { AppSidebar } from "@/components/sidebar/sidebar.tsx"
import { Separator } from "@/components/ui/separator"
import { SidebarProvider, SidebarTrigger } from "@/components/ui/sidebar"
import { useAuth } from "@/context/useAuth"
import { Navigate, Outlet } from "react-router-dom"

export default function SidebarLayout() {
  const { user } = useAuth()

  if (user?.role !== "admin") return <Navigate to="/" replace/>

  return (
    <SidebarProvider>
      <AppSidebar/>
      <main className="w-full overflow-x-auto">
        <header className="sticky top-0 left-0 z-10 flex h-12 w-full shrink-0 items-center justify-between border-b bg-background px-3 shadow-xs">
          <div className="flex items-center gap-3">
            <SidebarTrigger/>
            <Separator orientation="vertical" className="mr-2 h-4"/>
            <span className="text-sm font-medium">Halo, {user?.name}!</span>
          </div>
        </header>
        <Outlet/>
      </main>
    </SidebarProvider>
  )
}