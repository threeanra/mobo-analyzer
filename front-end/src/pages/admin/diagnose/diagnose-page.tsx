import { DataTable } from "@/components/datatable/datatable"
import { DialogAddDiagnose } from "@/components/dialog/dialog-add-diagnose"
import { DialogDelete } from "@/components/dialog/dialog-delete"
import httpClient from "@/lib/axios-client"
import { getColumns } from "@/pages/admin/diagnose/column"
import type { Diagnose } from "@/types/diagnose"
import type { response } from "@/types/response"
import { useQuery } from "@tanstack/react-query"
import { useState } from "react"

export default function DiagnosePage() {
  const [formDialog, setFormDialog] = useState(false)
  const [formDialogDelete, setFormDialogDelete] = useState(false)
  const [select, setSelect] = useState("")

  const { data = [] } = useQuery({
    queryKey: ["diagnoses"],
    queryFn: async () => {

      const response = await httpClient.get<response<Diagnose[]>>(`/api/diagnoses`)

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
          <span className="text-3xl font-bold">Diagnosa</span>
          <span>List diagnosa yang tersedia</span>
        </div>
        <DataTable columns={columns}
                   data={data!}
                   filterColumn="name"
                   placeholder="Cari diagnosa..."
                   handleCreate={() => handleAdd()}
        />
      </div>
      <DialogAddDiagnose open={formDialog} setOpen={setFormDialog} title="Diagnosa" select={select} />
      <DialogDelete open={formDialogDelete} setOpen={setFormDialogDelete} endpoint="diagnoses" select={select} />
    </>
  )
}