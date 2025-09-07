import type { Relation } from "@/types/relation"

export type Rule = {
  id: string
  diagnose: Relation
  symptoms: Relation[]
}