import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle
} from "@/components/ui/alert-dialog"
import httpClient from "@/lib/axios-client"
import type { response } from "@/types/response"
import { useMutation, useQueryClient } from "@tanstack/react-query"
import { LoaderCircleIcon } from "lucide-react"
import { toast } from "sonner"

export const DialogDelete = ({ open, setOpen, endpoint, select }: {
  open: boolean,
  setOpen: (value: boolean) => void,
  endpoint: string,
  select: string,
}) => {
  const queryClient = useQueryClient()

  const { mutate, isPending } = useMutation({
    mutationFn: async () => {
      const response = await httpClient.delete<response<null>>(`/api/${endpoint}/${select}`)
      const responseData = response.data

      if (response.status != 200) {
        return
      }

      void toast.success(responseData.message)
      void queryClient.invalidateQueries({ queryKey: [`${endpoint}`] })
      void queryClient.invalidateQueries({ queryKey: ["dashboard"] })

      setOpen(false)
    },
    onError: (error: any) => {
      toast.error("Terjadi kesalahan", {
        description: error.response?.data.message,
      })
    }
  })

  const onSubmit = () => {
    mutate()
  }

  return (
    <AlertDialog open={open}>
      <AlertDialogContent className="w-xs">
        <AlertDialogHeader>
          <AlertDialogTitle>Hapus</AlertDialogTitle>
          <AlertDialogDescription>
            Konfirmasi hapus data dipilih
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
            onClick={onSubmit}
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
