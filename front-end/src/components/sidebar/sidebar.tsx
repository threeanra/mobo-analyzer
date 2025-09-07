import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger } from "@/components/ui/dropdown-menu"
import { Sidebar, SidebarContent, SidebarFooter, SidebarGroup, SidebarGroupContent, SidebarHeader, SidebarMenu, SidebarMenuButton, SidebarMenuItem, } from "@/components/ui/sidebar"
import { useAuth } from "@/context/useAuth"
import { DialogLogout } from "@/components/dialog/dialog-logout"
import { ChevronUp, ClipboardCheck, GitFork, HistoryIcon, Home, ListCheck, User2 } from "lucide-react"
import { useState } from "react"
import { Link } from "react-router-dom"
import Logo from "../../assets/Logo.png";

const items = [
  {
    title: "Dashboard",
    url: "/admin/dashboard",
    icon: Home,
  },
  {
    title: "Gejala",
    url: "/admin/symptom",
    icon: GitFork,
  },
  {
    title: "Diagnosa & Solusi",
    url: "/admin/diagnose",
    icon: ListCheck,
  },
  {
    title: "Aturan",
    url: "/admin/rule",
    icon: ClipboardCheck,
  },
  {
    title: "Riwayat Diagnosa",
    url: "/admin/history",
    icon: HistoryIcon,
  },
]

export function AppSidebar() {
  const { user } = useAuth()
  const [formDialogLogout, setFormDialogLogout] = useState(false)

  return (
    <>
      <Sidebar>
        <SidebarHeader>
          <Link to={"/"} replace={true}>
            <div className="flex flex-row items-center gap-3 mt-3 hover:cursor-pointer hover:bg-gray-100 py-2 px-1 rounded-lg">
              <div className="flex ml-2 bg-gradient-to-r from-blue-500 to-blue-600 rounded-xl w-max p-2">
                <img
                  src={Logo}
                  alt="Logo"
                  className="bg-transparent size-10"/>
              </div>
              <div className="flex flex-col gap-1">
                <span className="text-md font-semibold">MoboAnalyzer</span>
                <span className="text-xs font-light">v{import.meta.env.VITE_APP_VERSION}</span>
              </div>
            </div>
          </Link>
        </SidebarHeader>
        <SidebarContent>
          <SidebarGroup>
            <SidebarGroupContent>
              <SidebarMenu>
                {items.map((item) => (
                  <SidebarMenuItem key={item.title}>
                    <SidebarMenuButton asChild className="py-5">
                      <Link to={item.url}>
                        <item.icon/>
                        <span>{item.title}</span>
                      </Link>
                    </SidebarMenuButton>
                  </SidebarMenuItem>
                ))}
              </SidebarMenu>
            </SidebarGroupContent>
          </SidebarGroup>
        </SidebarContent>
        <SidebarFooter className="pt-2 border-t">
          <SidebarMenu>
            <SidebarMenuItem>
              <DropdownMenu>
                <DropdownMenuTrigger asChild>
                  <SidebarMenuButton className="w-full justify-start cursor-pointer">
                    <User2/> {user?.name}
                    <ChevronUp className="ml-auto"/>
                  </SidebarMenuButton>
                </DropdownMenuTrigger>
                <DropdownMenuContent
                  side="top"
                  className="w-[var(--radix-popper-anchor-width)] mb-2"
                >
                  <DropdownMenuItem onClick={() => setFormDialogLogout(true)}>
                    <span className="text-red-600">Sign out</span>
                  </DropdownMenuItem>
                </DropdownMenuContent>
              </DropdownMenu>
            </SidebarMenuItem>
          </SidebarMenu>
        </SidebarFooter>
      </Sidebar>
      <DialogLogout open={formDialogLogout} setOpen={setFormDialogLogout}/>
    </>
  )
}