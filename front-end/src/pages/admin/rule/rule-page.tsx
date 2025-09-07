import { DataTable } from "@/components/datatable/datatable"
import { DialogAddRule } from "@/components/dialog/dialog-add-rule"
import { DialogDelete } from "@/components/dialog/dialog-delete"
import httpClient from "@/lib/axios-client"
import { getColumns } from "@/pages/admin/rule/column"
import type { response } from "@/types/response"
import type { Rule } from "@/types/rule"
import { useQuery } from "@tanstack/react-query"
import { useState } from "react"

export default function RulePage() {
  const [formDialog, setFormDialog] = useState(false)
  const [formDialogDelete, setFormDialogDelete] = useState(false)
  const [select, setSelect] = useState("")

  const { data = [] } = useQuery({
    queryKey: ["rules"],
    queryFn: async () => {

      const response = await httpClient.get<response<Rule[]>>(`/api/rules`)

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
          <span className="text-3xl font-bold">Aturan</span>
          <span>List aturan yang tersedia</span>
        </div>
        <DataTable columns={columns}
                   data={data!}
                   filterColumn="diagnose"
                   placeholder="Cari aturan..."
                   handleCreate={() => handleAdd()}
        />
      </div>
      <DialogAddRule open={formDialog} setOpen={setFormDialog} title="Aturan" select={select}/>
      <DialogDelete open={formDialogDelete} setOpen={setFormDialogDelete} endpoint="rules" select={select} />
    </>
  )
}