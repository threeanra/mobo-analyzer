import { StatsCard } from "@/components/card/stats-card"
import { DataTable } from "@/components/datatable/datatable"
import { DialogAddUser } from "@/components/dialog/dialog-add-user"
import { DialogDelete } from "@/components/dialog/dialog-delete"
import { DialogEditPassword } from "@/components/dialog/dialog-edit-password"
import httpClient from "@/lib/axios-client"
import { getColumns } from "@/pages/admin/dashboard/column"
import type { Dashboard } from "@/types/dashboard"
import type { response } from "@/types/response"
import type { User } from "@/types/user"
import { useQuery } from "@tanstack/react-query"
import { ClipboardCheck, GitFork, ListCheck, UserIcon } from "lucide-react"
import { useState } from "react"

export default function DashboardPage() {
  const [formDialog, setFormDialog] = useState(false)
  const [formDialogEdit, setFormDialogEdit] = useState(false)
  const [formDialogDelete, setFormDialogDelete] = useState(false)
  const [select, setSelect] = useState("")

  const { data: dashboard } = useQuery({
    queryKey: ["dashboard"],
    queryFn: async () => {

      const response = await httpClient.get<response<Dashboard>>(`/api/dashboard`)

      return response.data.result
    }
  })

  const { data: users = [] } = useQuery({
    queryKey: ["auth/users"],
    queryFn: async () => {

      const response = await httpClient.get<response<User[]>>(`/api/auth/users`)

      return response.data.result
    }
  })

  const statsConfig = [
    {
      title: "Pengguna",
      value: dashboard?.total_users || 0,
      icon: UserIcon
    },
    {
      title: "Gejala",
      value: dashboard?.total_symptoms || 0,
      icon: GitFork
    },
    {
      title: "Diagnosa",
      value: dashboard?.total_diagnoses || 0,
      icon: ListCheck
    },
    {
      title: "Aturan",
      value: dashboard?.total_rules || 0,
      icon: ClipboardCheck
    }
  ]

  const handleAdd = () => {
    setFormDialog(true)
  }

  const handleEdit = (id: string) => {
    setSelect(id)
    setFormDialogEdit(true)
  }

  const handleDelete = (id: string) => {
    setSelect(id)
    setFormDialogDelete(true)
  }

  const columns = getColumns({
    onEdit: handleEdit,
    onDelete: handleDelete,
  })

  return (
    <>
      <div className="w-full overflow-x-auto px-5 py-4 mt-5">
        <div className="grid grid-cols-2 gap-4 md:grid-cols-4">
          {statsConfig.map((item, index) => (
            <StatsCard key={index}
                       title={item.title}
                       value={item.value}
                       icon={item.icon}
            />
          ))}
        </div>
        <div className="flex flex-col gap-2 mt-5">
          <span className="text-3xl font-bold">Pengguna</span>
          <span>List pengguna yang terdaftar</span>
        </div>
        <DataTable columns={columns}
                   data={users!}
                   filterColumn="name"
                   placeholder="Cari pengguna..."
                   handleCreate={() => handleAdd()}
        />
      </div>
      <DialogAddUser open={formDialog} setOpen={setFormDialog} />
      <DialogEditPassword open={formDialogEdit} setOpen={setFormDialogEdit} select={select} />
      <DialogDelete open={formDialogDelete} setOpen={setFormDialogDelete} endpoint="auth/users" select={select} />
    </>
  )
}