import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Separator } from "@/components/ui/separator"
import { useAuth } from "@/context/useAuth"
import type { User } from "@/types/user"
import httpClient from "@/lib/axios-client"
import type { response } from "@/types/response"
import { useMutation, useQueryClient } from "@tanstack/react-query"
import { LoaderCircleIcon } from "lucide-react"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form"
import { useEffect } from "react"
import { useNavigate } from "react-router-dom"
import { useForm } from "react-hook-form"

import { toast } from "sonner"
import { z } from "zod/v4"


const FormSchema = z.object({
  email: z.string().default(""),
  password: z.string().default(""),
})
type FormData = z.infer<typeof FormSchema>

export default function LoginPage() {
  const { setUser, user } = useAuth()
  const navigate = useNavigate()
  const queryClient = useQueryClient()

  const form = useForm<FormData>({
    shouldUnregister: true,
    defaultValues: FormSchema.parse({})
  })

  const { mutate, isPending } = useMutation({
    mutationFn: async (data: FormData) => {

      const responseAuth = await httpClient.post<response<User>>("/api/auth/login", data)
      const responseAuthData = responseAuth.data!

      if (responseAuth.status !== 200) return

      const user = responseAuthData.result!

      if (!user) return

      setUser(
        {
          id: user.id,
          name: user.name,
          role: user.role,
          email: user.email
        }
      )

      if (user.role === "admin") {
        navigate("/admin/dashboard", { replace: true })
      } else {
        navigate("/", { replace: true })
      }

      queryClient.invalidateQueries({ queryKey: ["user"] })
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

  useEffect(() => {
    if (user) {
      if (user.role === "admin") {
        navigate("/admin/dashboard", { replace: true })
      } else {
        navigate("/", { replace: true })
      }
    }
  }, [user, navigate])

  return (
    <>
      <div className="relative flex h-screen w-full flex-col items-center justify-center bg-gradient-to-br from-blue-50 via-white to-indigo-50">
        <div className="text-center w-[340px]">
          <Form {...form}>
            <form action="#"
                  onSubmit={form.handleSubmit(onSubmit)}
                  autoComplete="off">
              <Card className="text-start border-none shadow-none md:border md:border-solid md:!shadow">
                <CardHeader className="pt-2 md:pt-6">
                  <CardTitle className="text-2xl">
                    Login
                  </CardTitle>
                  <CardDescription>
                    Isi form berikut untuk masuk kedalam aplikasi
                  </CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="grid gap-3">
                    <FormField
                      name="email"
                      render={({ field }) => (
                        <FormItem>
                          <FormLabel className="text-sm font-medium">Email</FormLabel>
                          <FormControl>
                            <Input type="text"
                                   autoCapitalize="off"
                                   {...field} />
                          </FormControl>
                          <FormMessage/>
                        </FormItem>
                      )}
                    />
                    <FormField
                      name="password"
                      render={({ field }) => (
                        <FormItem>
                          <div className="flex">
                            <FormLabel className="text-sm font-medium">Password</FormLabel>
                          </div>
                          <FormControl>
                            <Input type="password"
                                   autoComplete="on"
                                   {...field} />
                          </FormControl>
                          <FormMessage/>
                        </FormItem>
                      )}
                    />
                    <Separator/>
                    <div className="space-y-2">
                      <Button type="submit"
                              className="w-full group"
                              data-loading={isPending}
                              disabled={isPending}>
                        <span className="group-data-[loading=true]:invisible">Login</span>
                        <LoaderCircleIcon
                          className="group-data-[loading=true]:visible invisible absolute animate-spin"/>
                      </Button>
                    </div>
                    <Separator/>
                    <div className="space-y-2 mb-2">
                      <Button type="button"
                              className="w-full"
                              variant="outline"
                              disabled={isPending}
                              onClick={() => navigate("/auth/register")}>
                        <span className="group-data-[loading=true]:invisible">Buat akun</span>
                      </Button>
                    </div>
                  </div>
                </CardContent>
              </Card>
            </form>
          </Form>
        </div>
        <div className="absolute bottom-0 mb-6 text-center text-sm font-light italic text-gray-600 md:mt-6">
          ©{new Date().getFullYear()} Trian Radis Pengestu created with ❤.
        </div>
      </div>
    </>
  )
}
