import { Button } from "@/components/ui/button"
import { Dialog, DialogContent, DialogHeader, DialogTitle } from "@/components/ui/dialog.tsx"
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form.tsx"
import { Input } from "@/components/ui/input.tsx"
import { Loading } from "@/components/ui/loading"
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group"
import httpClient from "@/lib/axios-client.ts"
import type { response } from "@/types/response"
import type { User } from "@/types/user"
import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query"
import { LoaderCircleIcon, XIcon } from "lucide-react"
import { useForm } from "react-hook-form"
import { toast } from "sonner"
import { z } from "zod/v4"

const FormSchema = z.object({
  _method: z.string().default(""),
  name: z.string().default(""),
  type: z.string().default(""),
  email: z.string().default(""),
  password: z.string().default(""),
})

type FormData = z.infer<typeof FormSchema>

export const DialogAddUser = ({ open, setOpen }: {
  open: boolean,
  setOpen: (value: boolean) => void,
}) => {
  const queryClient = useQueryClient()

  const form = useForm<FormData>({
    shouldUnregister: true,
    defaultValues: FormSchema.parse({}),
  })

  const RoleLabelList = [
    { value: "user", label: "User" },
    { value: "admin", label: "Admin" },
  ]

  const { isFetching } = useQuery({
    enabled: open,
    queryKey: ["form-users"],
    queryFn: async () => {

      const response = await httpClient.get<response<User>>(`/api/auth/users/create`)
      const responseData = response.data.result!

      form.setValue("type", responseData.role)

      return responseData
    }
  })

  const { mutate, isPending } = useMutation({
    mutationFn: async (data: FormData) => {

      const url = data.type === "admin" ? "/api/auth/register/admin" : "/api/auth/users"

      return await httpClient.post<response<null>>(
        url,
        {
          ...data,
        }
      )
    },
    onSuccess: (response) => {
      const responseData = response.data

      form.reset()
      toast.success(responseData.message)
      void queryClient.invalidateQueries({ queryKey: ["auth/users"] })
      void queryClient.invalidateQueries({ queryKey: ["dashboard"] })
      setOpen(false)
    },
    onError: (error: any) => {
      if (error.response?.status === 422) {
        const errors = error.response.data.errors
        Object.entries(errors).forEach(([key, value]) => {
          form.setError(key as keyof FormData, {
            message: value[0],
          })
        })
      } else {
        toast.error("Terjadi kesalahan", {
          description: error.response?.data.message,
        })
      }
    },
  })

  const onSubmit = (data: FormData) => {
    mutate(data)
  }

  return (
    <>
      <Dialog open={open}>
        <DialogContent
          className="w-sm"
          onOpenAutoFocus={(e) => e.preventDefault()}>
          <DialogHeader>
            <DialogTitle>Tambah Pengguna</DialogTitle>
          </DialogHeader>
          <Button type="button"
                  variant="ghost"
                  className="absolute top-4 rounded-full end-4 size-9"
                  onClick={() => setOpen(false)}>
            <XIcon />
          </Button>
          <Loading show={isFetching}/>
          <Form {...form}>
            <form action="#"
                  onSubmit={form.handleSubmit(onSubmit)}
                  autoComplete="off"
                  className="space-y-6">
              <div className="space-y-3">
                <FormField
                  control={form.control}
                  name="name"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel className="text-sm font-medium">
                        Nama
                      </FormLabel>
                      <FormControl>
                        <Input
                          type="text"
                          autoCapitalize="off"
                          {...field}
                        />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />
                <FormField
                  control={form.control}
                  name="email"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel className="text-sm font-medium">
                        Email
                      </FormLabel>
                      <FormControl>
                        <Input
                          type="email"
                          autoCapitalize="off"
                          {...field}
                        />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />
                <FormField
                  name="password"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel className="text-sm font-medium">Password</FormLabel>
                      <FormControl>
                        <Input
                          type="password"
                          autoCapitalize="off"
                          {...field}
                        />
                      </FormControl>
                      <FormMessage/>
                    </FormItem>
                  )}
                />
                <FormField
                  name="type"
                  render={({ field }) => (
                    <FormItem className="space-y-1">
                      <FormLabel className="text-sm font-medium">Tipe</FormLabel>
                      <FormControl>
                        <RadioGroup
                          className="flex flex-col space-y-1"
                          value={field.value}
                          onValueChange={field.onChange}>
                          {RoleLabelList.map(({ value, label }) => (
                            <FormItem
                              key={value}
                              className="flex items-center space-x-2 space-y-0 mt-1"
                            >
                              <FormControl>
                                <RadioGroupItem value={value}/>
                              </FormControl>
                              <FormLabel className="font-normal">
                                {label}
                              </FormLabel>
                            </FormItem>
                          ))}
                        </RadioGroup>
                      </FormControl>
                      <FormMessage/>
                    </FormItem>
                  )}
                />
              </div>
              <div className="flex justify-between space-x-2">
                <div className="flex-1"></div>
                <Button variant="outline"
                        type="button"
                        className="cursor-pointer"
                        disabled={isPending}
                        onClick={() => setOpen(false)}>
                  Batal
                </Button>
                <Button type="submit"
                        className="group cursor-pointer"
                        data-loading={isPending}
                        disabled={isPending}
                >
                  <span className="group-data-[loading=true]:invisible">Simpan</span>
                  <LoaderCircleIcon className="group-data-[loading=true]:visible invisible absolute animate-spin" />
                </Button>
              </div>
            </form>
          </Form>
        </DialogContent>
      </Dialog>
    </>
  )
}
