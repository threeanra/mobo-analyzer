import { DataTable } from "@/components/datatable/datatable"
import httpClient from "@/lib/axios-client"
import { columns } from "@/pages/admin/history/column"
import type { History } from "@/types/history"
import type { response } from "@/types/response"
import { useQuery } from "@tanstack/react-query"

export default function HistoryPage() {

  const { data = [] } = useQuery({
    queryKey: ["histories"],
    queryFn: async () => {

      const response = await httpClient.get<response<History[]>>(`/api/histories`)

      return response.data.result
    }
  })

  return (
    <>
      <div className="w-full overflow-x-auto px-5 py-4 mt-5">
        <div className="flex flex-col gap-2">
          <span className="text-3xl font-bold">Riwayat Diagnosa</span>
          <span>List riwayat diagnosa</span>
        </div>
        <DataTable columns={columns}
                   data={data!}
                   filterColumn="user"
                   placeholder="Cari riwayat pengguna..."
        />
      </div>
    </>
  )
}