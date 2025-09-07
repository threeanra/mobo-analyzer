export type response<T> = {
  message: string
  result: T | null,
  errors: { [key: string]: string[] } | null
}