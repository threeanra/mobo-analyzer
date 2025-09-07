import { Button } from "@/components/ui/button"
import type { Diagnose } from "@/types/diagnose"
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
                           }: ColumnProps): ColumnDef<Diagnose>[] => [
  {
    accessorKey: "id",
    header: ({ column }) => (
      <Button
        variant="ghost"
        onClick={() => column.toggleSorting(column.getIsSorted() === "asc")}
      >
        Kode
        <ArrowUpDown className="ml-2 h-4 w-4"/>
      </Button>
    ),
    enableSorting: true,
  },
  {
    accessorKey: "name",
    header: "Diagnosa",
    enableSorting: false,
  },
  {
    accessorKey: "description",
    header: "Solusi",
    enableSorting: false,
    cell: ({ row }) => (
      <div className="w-full md:max-w-[50rem] md:whitespace-normal md:break-words">
        {row.getValue("description")}
      </div>
    ),
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
