import { clearAuthUser } from "@/context/useAuth"
import axios from "axios"

const httpClient = axios.create({
  baseURL: import.meta.env.VITE_BACK_END_URL,
  headers: {
    "accept": "application/json",
  },
  withCredentials: true,
  withXSRFToken: true,
  validateStatus: (status) => ![404, 408, 429, 500, 502, 503, 504].includes(status)
})

httpClient.interceptors.request.use(
  (config) => {

    if (config.url) {
      config.url = config.url.replace(/\/+$/, "")
    }

    return config
  }
)

httpClient.interceptors.response.use(
  (response) => {

    if (response.status === 207) {

      window.dispatchEvent(
        new CustomEvent("redirect", {
          detail: {
            target: response.data.result,
            message: response.data.message,
          }
        })
      )

      return Promise.reject(new Error("Redirect"))
    }

    if (
      response.status === 400
    ) {
      return Promise.reject(new Error(response.data.message))
    }

    if (
      response.status === 401
    ) {
      clearAuthUser();
      return Promise.reject(new Error("Akun dikeluarkan oleh sistem"))
    }

    if (
      response.status === 403
    ) {
      return Promise.reject(new Error(response.data.message))
    }

    if (
      response.status === 422
    ) {
      const error = new Error(response.data.message);(error as any).response = response
      return Promise.reject(error)
    }
    return response
  },
  (data) => {

    if (data.code === "ERR_NETWORK") {

      return Promise.reject(new ErrorConnection(
        "Gagal terhubung, Pastikan internet / perangkat utama aktif"
      ))
    }

    if (data.code === "ECONNABORTED") {

      return Promise.reject(new ErrorConnection(
        "Jaringan tidak stabil, proses ini memerlukan jaringan internet stabil"
      ))
    }

    return Promise.reject(data)
  }
)

export class ErrorConnection extends Error {
}

export class ErrorAuthorization extends Error {
}

export default httpClient
