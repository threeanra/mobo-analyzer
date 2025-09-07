import { Button } from "@/components/ui/button"
import type { User } from "@/types/user"
import type { ColumnDef } from "@tanstack/react-table"
import { ArrowUpDown, PencilIcon, Trash2Icon } from "lucide-react"

type ColumnProps = {
  onEdit: (item: string) => void
  onDelete: (item: string) => void
  canUpdate?: boolean
  canDestroy?: boolean
}
export const getColumns = ({
                             onEdit,
                             onDelete,
                             canUpdate = true,
                             canDestroy = true
                           }: ColumnProps): ColumnDef<User>[] => [
  {
    accessorFn: (_row, index) => index + 1,
    id: "Number",
    header: ({ column }) => (
      <Button
        variant="ghost"
        onClick={() => column.toggleSorting(column.getIsSorted() === "asc")}
      >
        No
        <ArrowUpDown className="ml-2 h-4 w-4"/>
      </Button>
    ),
    enableSorting: true,
  },
  {
    accessorKey: "name",
    header: "Nama",
    enableSorting: false,
  },
  {
    accessorKey: "type",
    header: "Tipe",
    enableSorting: false,
  },
  {
    accessorKey: "email",
    header: "Email",
    enableSorting: false,
  },
  {
    header: "",
    accessorKey: "actions",
    cell: ({ row }) => {
      const item = row.original.id

      return (
        <div className="flex gap-2 justify-end">
          <Button variant="outline"
                  className="h-7 w-7"
                  onClick={() => onEdit(item)}
                  disabled={!canUpdate}>
            <PencilIcon className="w-4 h-4"/>
          </Button>
          <Button variant="destructive"
                  className="h-7 w-7"
                  onClick={() => onDelete(item)}
                  disabled={!canDestroy}>
            <Trash2Icon className="w-4 h-4"/>
          </Button>
        </div>
      )
    },
  }
]
