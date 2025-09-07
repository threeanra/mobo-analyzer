import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import Logo from "../../assets/Logo.png"
import { Button } from "@/components/ui/button"
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuLabel, DropdownMenuSeparator, DropdownMenuTrigger } from "@/components/ui/dropdown-menu"
import { useAuth } from "@/context/useAuth"
import httpClient from "@/lib/axios-client"
import type { response } from "@/types/response"
import { useMutation } from "@tanstack/react-query"
import { LayoutDashboard, LogOut } from "lucide-react"
import { Link } from "react-router-dom"
import { toast } from "sonner"

export default function Navbar() {
  const { user, setUser } = useAuth()

  const { mutate: logout } = useMutation({
    mutationFn: async () => {

      const responseLogout = await httpClient.post<response<null>>("/api/auth/logout")
      const responseLogoutData = responseLogout.data

      if (responseLogout.status != 200) {
        throw new Error(responseLogoutData.message)
      }

      setUser(null)
    },
    onError: (error) => {
      toast.error(error.message)
    }
  })

  const ProfileMenu = () => (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <Button variant="ghost" className="flex items-center gap-2 px-3 py-2 h-auto rounded-full">
          <Avatar className="h-8 w-8">
            <AvatarImage src={"/placeholder.svg"} alt={user?.name}/>
            <AvatarFallback>
              {user?.name
                   ?.split(" ")
                   .map((n) => n[0])
                   .join("")
                   .toUpperCase()}
            </AvatarFallback>
          </Avatar>
          <span className="text-sm font-medium">Halo, {user?.name}</span>
        </Button>
      </DropdownMenuTrigger>
      <DropdownMenuContent className="w-60 mt-2" align="end" forceMount>
        <DropdownMenuLabel className="font-normal">
          <div className="flex items-center space-x-2">
            <Avatar className="h-8 w-8">
              <AvatarImage src={"/placeholder.svg"} alt={user?.name}/>
              <AvatarFallback>
                {user?.name
                     .split(" ")
                     .map((n) => n[0])
                     .join("")
                     .toUpperCase()}
              </AvatarFallback>
            </Avatar>
            <div className="flex flex-col space-y-1">
              <p className="text-sm font-medium leading-none">{user?.name}</p>
              <p className="text-xs leading-none text-muted-foreground">{user?.email}</p>
            </div>
          </div>
        </DropdownMenuLabel>
        <DropdownMenuSeparator/>
        {user?.role === "admin" && (
          <DropdownMenuItem asChild>
            <Link to={"/admin/dashboard"}>
              <LayoutDashboard className="mr-2 h-4 w-4"/>
              Dashboard
            </Link>
          </DropdownMenuItem>
        )}
        <DropdownMenuItem onClick={() => logout()} className="text-red-500 focus:text-red-600">
          <LogOut className="mr-2 h-4 w-4 text-red-500"/>
          Logout
        </DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  )

  return (
    <header className="flex justify-center relative">
      <div className="container max-w-[25rem] md:max-w-[76rem] fixed rounded-xl bg-white top-8 z-50 flex h-16 items-center justify-between px-4 sm:px-6 md:px-8">
        <Link to="/" className="flex items-center space-x-2">
          <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-gradient-to-r from-blue-500 to-blue-600">
            <img
              src={Logo}
              alt="Logo"
              className="bg-transparent size-5"/>
          </div>
          <span className="text-xl font-bold">MoboAnalyzer</span>
        </Link>

        <div className="md:flex items-center space-x-4">
          {user ? (
            <ProfileMenu/>
          ) : (
            <Button asChild>
              <Link to="/auth/login">
                Login
              </Link>
            </Button>
          )}
        </div>
      </div>
    </header>
  )
}
