import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle
} from "@/components/ui/alert-dialog.tsx"
import { useAuth } from "@/context/useAuth.tsx"
import httpClient from "@/lib/axios-client.ts"
import type { response } from "@/types/response.ts"
import { useMutation } from "@tanstack/react-query"
import { LoaderCircleIcon } from "lucide-react"
import { toast } from "sonner"


export const DialogLogout = ({ open, setOpen }: {
  open: boolean,
  setOpen: (value: boolean) => void
}) => {
  const { setUser } = useAuth()

  const { mutate: authLogout, isPending } = useMutation({
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

  return (
    <AlertDialog open={open}>
      <AlertDialogContent className="w-80">
        <AlertDialogHeader>
          <AlertDialogTitle>Keluar Aplikasi</AlertDialogTitle>
          <AlertDialogDescription>
            Konfirmasi keluar dari aplikasi
          </AlertDialogDescription>
        </AlertDialogHeader>
        <AlertDialogFooter>
          <AlertDialogCancel
            className="cursor-pointer"
            onClick={() => setOpen(false)}
            disabled={isPending}>
            Batal
          </AlertDialogCancel>
          <AlertDialogAction
            className="relative group flex items-center justify-center bg-red-600 hover:bg-red-700 text-white disabled:opacity-50 px-3 rounded-md"
            onClick={() => authLogout()}
            data-loading={isPending}
            disabled={isPending}>
            <span className="group-data-[loading=true]:invisible">
              Keluar
            </span>
            <LoaderCircleIcon
              className="absolute animate-spin invisible group-data-[loading=true]:visible h-4 w-4"
            />
          </AlertDialogAction>
        </AlertDialogFooter>
      </AlertDialogContent>
    </AlertDialog>
  )
}
