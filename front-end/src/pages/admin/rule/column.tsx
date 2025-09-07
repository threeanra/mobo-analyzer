import { Button } from "@/components/ui/button"
import type { Rule } from "@/types/rule"
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
                           }: ColumnProps): ColumnDef<Rule>[] => [
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
  },
  {
    id: "diagnoseName",
    header: "Diagnosa",
    accessorFn: (row) => row.diagnose?.name,
    enableSorting: false,
    cell: ({ getValue }) => {
      const diagnoseName = getValue() as string;

      return (
        <div className="w-full break-words whitespace-normal md:max-w-[30rem]">
          {diagnoseName}
        </div>
      );
    }
  },
  {
    accessorKey: "symptoms",
    header: "Gejala",
    enableSorting: false,
    cell: ({ row }) => {
      const symptoms = row.getValue("symptoms") as { id: string }[];

      return (
        <div className="w-full md:whitespace-normal md:break-words">
          {symptoms.map(s => s.id).join(", ")}
        </div>
      )
    }
  },
  {
    header: "",
    accessorKey: "actions",
    cell: ({ row }) => {
      const item = row.original.diagnose.id

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
