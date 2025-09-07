import { Button } from "@/components/ui/button"
import type { History } from "@/types/history"
import type { ColumnDef } from "@tanstack/react-table"
import { ArrowUpDown } from "lucide-react"
import { format } from "date-fns";

export const columns: ColumnDef<History>[] = [
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
    accessorKey: "user",
    header: "Pengguna",
    enableSorting: false,
  },
  {
    accessorKey: "diagnose",
    header: "Diagnosa",
    enableSorting: false,
  },
  {
    accessorKey: "date",
    header: "Tanggal",
    enableSorting: false,
    cell: ({ row }) => {
      const dateValue = row.getValue("date") as string;
      const formattedDate = format(new Date(dateValue), "dd/MM/yyyy");

      return (
        <div className="w-full break-words whitespace-normal md:max-w-[30rem]">
          {formattedDate}
        </div>
      )
    },
  },
]