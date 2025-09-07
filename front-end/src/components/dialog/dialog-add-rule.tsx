import { Button } from "@/components/ui/button"
import { Command, CommandEmpty, CommandGroup, CommandInput, CommandItem, CommandList } from "@/components/ui/command"
import { Dialog, DialogContent, DialogHeader, DialogTitle } from "@/components/ui/dialog.tsx"
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form.tsx"
import { Input } from "@/components/ui/input.tsx"
import { Loading } from "@/components/ui/loading"
import { PopoverContent, PopoverTrigger } from "@/components/ui/popover"
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table"
import httpClient from "@/lib/axios-client.ts"
import type { Relation } from "@/types/relation"
import type { response } from "@/types/response"
import type { Rule } from "@/types/rule"
import { Popover, PopoverClose } from "@radix-ui/react-popover"
import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query"
import { ChevronDownIcon, LoaderCircleIcon, PlusIcon, Trash2Icon, XIcon } from "lucide-react"
import { useState } from "react"
import { useForm, useWatch } from "react-hook-form"
import { toast } from "sonner"
import { z } from "zod/v4"

const FormSchema = z.object({
  _method: z.string().default(""),
  code: z.string().default(""),
  diagnose_id: z.string().default(""),
  diagnose_name: z.string().default(""),
  symptom_name: z.string().default(""),
  symptoms: z.array(z.any()).default([]),
})

type FormData = z.infer<typeof FormSchema>

export const DialogAddRule = ({ open, setOpen, select, title }: {
  open: boolean,
  setOpen: (value: boolean) => void,
  select: string,
  title: string
}) => {
  const queryClient = useQueryClient()

  const form = useForm<FormData>({
    shouldUnregister: true,
    defaultValues: FormSchema.parse({}),
  })

  const formWatch = useWatch({ control: form.control })

  const diagnoses = useQuery({
    enabled: open,
    queryKey: [`/api/rules/diagnoses`],
    placeholderData: (prev) => prev,
    queryFn: async () => {
      const response = await httpClient.get<response<Relation[]>>(`/api/rules/diagnoses`)
      return response.data.result!
    },
  })

  const { isFetching } = useQuery({
    enabled: open,
    queryKey: ["form-rules"],
    queryFn: async () => {

      const response = await httpClient.get<response<Rule>>(`/api/rules/${select}`)
      const responseData = response.data.result!

      form.setValue("code", responseData.id)
      form.setValue("diagnose_id", responseData.diagnose.id)
      form.setValue("diagnose_name", responseData.diagnose.name)

      const symptoms = responseData.symptoms.map(item => {
        return {
          id: item.id,
          name: item.name
        }
      })
      form.setValue("symptoms", symptoms)
      setSymptoms(symptoms)

      return responseData
    }
  })

  const [symptom, setSymptom] = useState<Relation | null>({ id: "", name: "" })
  const [symptoms, setSymptoms] = useState<Relation[]>([])
  const symptomsData = useQuery({
    enabled: open,
    queryKey: ["/api/rules/symptoms"],
    queryFn: async () => {
      const response = await httpClient.get<response<Relation[]>>(`/api/rules/symptoms`)
      return response.data.result!
    }
  })

  const { mutate, isPending } = useMutation({
    mutationFn: async (data: FormData) => {
      const method = select == "create" ? "" : select

      return await httpClient.post<response<null>>(
        `/api/rules/${method}`,
        {
          ...data,
          symptoms: symptoms.map(item => item.id),
          _method: method === "" ? "POST" : "PATCH",
        }
      )
    },
    onSuccess: (response) => {
      const responseData = response.data

      form.reset()
      toast.success(responseData.message)
      queryClient.invalidateQueries({ queryKey: ["rules"] })
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

  const handleAddSymptom = () => {
    if (
      symptom &&
      !symptoms.some(item => item.id === symptom.id)
    ) {
      const newSkill = {
        id: symptom.id,
        name: symptom.name,
      }

      const updatedSymptoms = [...symptoms, newSkill]
      setSymptoms(updatedSymptoms)
      form.setValue("symptoms", updatedSymptoms)
      setSymptom(null)
      form.setValue("symptom_name", "")
    }
  }

  const handleRemoveSymptom = (itemToRemove: string) => {
    const updated = symptoms.filter((item) => item.name !== itemToRemove)
    setSymptoms(updated)
    form.setValue("symptoms", updated)
  }

  return (
    <>
      <Dialog open={open}>
        <DialogContent
          className="max-w-lg"
          onOpenAutoFocus={(e) => e.preventDefault()}>
          <DialogHeader>
            <DialogTitle>{select === "create" ? "Tambah" : "Ubah"} {title}</DialogTitle>
          </DialogHeader>
          <Button type="button"
                  variant="ghost"
                  className="absolute top-4 rounded-full end-4 size-9"
                  onClick={() => setOpen(false)}>
            <XIcon/>
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
                  name="code"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel className="text-sm font-medium">
                        Kode
                      </FormLabel>
                      <FormControl>
                        <Input
                          type="text"
                          autoCapitalize="off"
                          readOnly
                          {...field}
                        />
                      </FormControl>
                      <FormMessage/>
                    </FormItem>
                  )}
                />
                <FormField
                  name="diagnose_id"
                  render={() => (
                    <FormItem>
                      <FormLabel>Diagnosa</FormLabel>
                      <Popover>
                        <PopoverTrigger asChild>
                          <Button variant="outline"
                                  disabled={select !== "create"}
                                  className="min-w-full justify-between">
                            <div className="w-[calc(100%-3rem)] overflow-hidden text-left truncate">
                              {formWatch.diagnose_name || "Pilih Diagnosa"}
                            </div>
                            <ChevronDownIcon className="opacity-50"/>
                          </Button>
                        </PopoverTrigger>
                        <PopoverContent>
                          <Command shouldFilter={true}>
                            <CommandInput
                              placeholder="Cari..."/>
                            <CommandList className="min-h-20">
                              <CommandEmpty>Tidak ada data</CommandEmpty>
                              <PopoverClose asChild>
                                <CommandGroup>
                                  {diagnoses
                                    .data?.map((diagnose) => (
                                      <CommandItem key={diagnose.id}
                                                   value={diagnose.name}
                                                   onSelect={() => {
                                                     form.setValue("diagnose_id", diagnose.id)
                                                     form.setValue("diagnose_name", diagnose.name)
                                                   }}>
                                        {diagnose.name}
                                      </CommandItem>
                                    ))
                                  }
                                </CommandGroup>
                              </PopoverClose>
                            </CommandList>
                          </Command>
                        </PopoverContent>
                      </Popover>
                      <FormMessage/>
                    </FormItem>
                  )}
                />
                <FormField
                  control={form.control}
                  name="symptoms"
                  render={() => (
                    <FormItem className="w-full mt-10">
                      <div className="flex gap-4">
                        <div className="w-full overflow-hidden">
                          <Popover>
                            <PopoverTrigger asChild>
                              <Button variant="outline"
                                      className="w-[21rem] md:w-[25rem] justify-between">
                                <div className="w-[calc(100%-3rem)] overflow-hidden text-left truncate">
                                  {formWatch.symptom_name || "Pilih Gejala"}
                                </div>
                                <ChevronDownIcon className="opacity-50"/>
                              </Button>
                            </PopoverTrigger>
                            <PopoverContent>
                              <Command shouldFilter={true}>
                                <CommandInput
                                  placeholder="Cari..."/>
                                <CommandList className="min-h-20">
                                  <CommandEmpty>Tidak ada data</CommandEmpty>
                                  <PopoverClose asChild>
                                    <CommandGroup>
                                      {symptomsData
                                        .data
                                        ?.map((symptom) => (
                                          <CommandItem
                                            key={symptom.id}
                                            value={symptom.name}
                                            onSelect={() => {
                                              form.setValue("symptom_name", symptom.name)
                                              setSymptom({ id: symptom.id, name: symptom.name })
                                            }}>
                                            {symptom.name}
                                          </CommandItem>
                                        ))
                                      }
                                    </CommandGroup>
                                  </PopoverClose>
                                </CommandList>
                              </Command>
                            </PopoverContent>
                          </Popover>
                        </div>
                        <Button variant="outline" type="button" onClick={handleAddSymptom}>
                          <PlusIcon className="size-4"/>
                        </Button>
                      </div>
                      <div className="rounded-sm border">
                        <Table className="w-full">
                          <TableHeader className="select-none">
                            <TableRow className="bg-background hover:bg-background">
                              <TableHead className="text-start">
                                Gejala
                              </TableHead>
                              <TableHead className="text-end w-16"></TableHead>
                            </TableRow>
                          </TableHeader>
                          <TableBody>
                            {symptoms.length > 0 ? (
                              symptoms.map((item, index) => (
                                <TableRow key={index}>
                                  <TableCell className="text-start break-words">
                                    <div className="whitespace-normal leading-relaxed">
                                      {item.name}
                                    </div>
                                  </TableCell>
                                  <TableCell className="text-end w-16">
                                    <Button
                                      variant="destructive"
                                      className="size-6 md:size-8 flex-shrink-0"
                                      onClick={() => handleRemoveSymptom(item.name)}>
                                      <Trash2Icon className="size-3 md:size-4"/>
                                    </Button>
                                  </TableCell>
                                </TableRow>
                              ))
                            ) : (
                              <TableRow>
                                <TableCell colSpan={2} className="text-center text-muted-foreground">
                                  Tidak ada data.
                                </TableCell>
                              </TableRow>
                            )}
                          </TableBody>
                        </Table>
                      </div>
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
                  <LoaderCircleIcon className="group-data-[loading=true]:visible invisible absolute animate-spin"/>
                </Button>
              </div>
            </form>
          </Form>
        </DialogContent>
      </Dialog>
    </>
  )
}
