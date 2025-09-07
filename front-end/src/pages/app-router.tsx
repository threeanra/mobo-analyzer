import AuthLayout from "@/components/layout/admin-layout"
import SidebarLayout from "@/components/layout/sidebar-layout"
import Dashboard from "@/pages/admin/dashboard/dashboard-page"
import DiagnosePage from "@/pages/admin/diagnose/diagnose-page"
import HistoryPage from "@/pages/admin/history/history-page"
import RulePage from "@/pages/admin/rule/rule-page"
import SymptomPage from "@/pages/admin/symptom/symptom-page"
import AnalyzePage from "@/pages/analyze-page"
import LoginPage from "@/pages/auth/login-page"
import RegisterPage from "@/pages/auth/register-page"
import Home from "@/pages/home"
import Error404Page from "@/pages/404-page"
import { Route, Routes } from "react-router-dom"

export default function AppRouter() {
  return (
    <Routes>
      <Route path="/" element={<Home/>}/>
      <Route path="/auth/login" element={<LoginPage/>}/>
      <Route path="/auth/register" element={<RegisterPage/>}/>
      <Route element={<AuthLayout />}>
        <Route path="/diagnose" element={<AnalyzePage />} />
        <Route element={<SidebarLayout />}>
          <Route path="/admin/dashboard" element={<Dashboard />} />
          <Route path="/admin/symptom" element={<SymptomPage />} />
          <Route path="/admin/diagnose" element={<DiagnosePage />} />
          <Route path="/admin/rule" element={<RulePage />} />
          <Route path="/admin/history" element={<HistoryPage />} />
        </Route>
      </Route>

      <Route path="*" element={<Error404Page/>}/>
    </Routes>
  )
}