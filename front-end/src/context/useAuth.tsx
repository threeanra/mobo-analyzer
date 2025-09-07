import httpClient from "@/lib/axios-client"
import type { response } from "@/types/response"
import type { User } from "@/types/user"
import { useQuery } from "@tanstack/react-query"
import { createContext, useContext, useState } from "react"

type AuthContextType = {
  user: User | null;
  setUser: (user: User | null) => void;
  isInitialized: boolean;
};

let globalSetUser: ((user: User | null) => void) | null = null;

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export const AuthProvider = ({ children }: { children: React.ReactNode }) => {
  const [user, setUser] = useState<User | null>(null);
  const [isInitialized, setIsInitialized] = useState(false);

  globalSetUser = setUser;

  useQuery({
    queryKey: ["user"],
    queryFn: async () => {
      try {
        const responseUser = await httpClient.post<response<User>>("/api/auth/data");
        setUser(responseUser.data.result);
      } catch (error) {
        setUser(null);
      }
      setIsInitialized(true);
      return "";
    }
  })

  return (
    <AuthContext.Provider value={{ user, setUser, isInitialized }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error("User not found");
  return ctx;
};

export const clearAuthUser = () => {
  if (globalSetUser) {
    globalSetUser(null);
  }
};
