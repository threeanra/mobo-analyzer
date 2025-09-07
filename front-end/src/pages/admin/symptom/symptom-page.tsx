import { DataTable } from "@/components/datatable/datatable"
import { DialogAdd } from "@/components/dialog/dialog-add"
import { DialogDelete } from "@/components/dialog/dialog-delete"
import httpClient from "@/lib/axios-client"
import { getColumns } from "@/pages/admin/symptom/column"
import type { response } from "@/types/response"
import type { Symptom } from "@/types/symptom"
import { useQuery } from "@tanstack/react-query"
import { useState } from "react"

export default function SymptomPage() {
  const [formDialog, setFormDialog] = useState(false)
  const [formDialogDelete, setFormDialogDelete] = useState(false)
  const [select, setSelect] = useState("")

  const { data = [] } = useQuery({
    queryKey: ["symptoms"],
    queryFn: async () => {

      const response = await httpClient.get<response<Symptom[]>>(`/api/symptoms`)

      return response.data.result
    }
  })

  const handleAdd = (id: string = "create") => {
    setFormDialog(true)
    setSelect(id)
  }

  const handleDelete = (id: string) => {
    setSelect(id)
    setFormDialogDelete(true)
  }

  const columns = getColumns({
    onEdit: handleAdd,
    onDelete: handleDelete,
  })

  return (
    <>
      <div className="w-full overflow-x-auto px-5 py-4 mt-5">
        <div className="flex flex-col gap-2">
          <span className="text-3xl font-bold">Gejala</span>
          <span>List gejala yang tersedia</span>
        </div>
        <DataTable columns={columns}
                   data={data!}
                   filterColumn="name"
                   placeholder="Cari gejala..."
                   handleCreate={() => handleAdd()}
        />
      </div>
      <DialogAdd open={formDialog} setOpen={setFormDialog} title="Gejala" select={select}/>
      <DialogDelete open={formDialogDelete} setOpen={setFormDialogDelete} endpoint="symptoms" select={select} />
    </>
  )
}