import { ThemeProvider } from "@/components/provider/theme-provider.tsx"
import { AuthProvider } from "@/context/useAuth"
import AppRouter from "@/pages/app-router"
import { QueryClient, QueryClientProvider } from "@tanstack/react-query"
import { createRoot } from "react-dom/client"
import "./index.css"
import { BrowserRouter } from "react-router-dom"
import { Toaster } from "sonner"

const queryClient = new QueryClient()

createRoot(document.getElementById("root")!).render(
  <QueryClientProvider client={queryClient}>
    <ThemeProvider defaultTheme="light" storageKey="vite-ui-theme">
      <BrowserRouter>
        <AuthProvider>
          <AppRouter/>
        </AuthProvider>
        <Toaster richColors={true}/>
      </BrowserRouter>
    </ThemeProvider>
  </QueryClientProvider>,
)
