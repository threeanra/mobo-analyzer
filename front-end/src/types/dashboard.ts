type User = {
  id: string,
  type: string,
  name: string,
  email: string
}

export type Dashboard = {
  users: User[],
  total_users: number,
  total_symptoms: number,
  total_diagnoses: number
  total_rules: number
}