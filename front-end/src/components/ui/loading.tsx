import { cn } from "@/lib/utils"

export const Loading = ({ show, className }: {
  show: boolean,
  className?: string | null,
}) => {

  if (!show) {
    return null
  }

  return (
    <div className={cn(
      "absolute left-0 top-0 flex h-full w-full items-center justify-center rounded-lg bg-background/80 z-[inherit]",
      className
    )}>
      <div>
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mb-4"></div>
      </div>
    </div>
  )
}
