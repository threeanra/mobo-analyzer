import type { LucideIcon } from "lucide-react"
import { Card, CardContent, CardHeader } from '@/components/ui/card';
import { Label } from '@/components/ui/label';

type StatsCardProps =  {
  title: string;
  value: number;
  icon: LucideIcon;
}

export const StatsCard = ({ title, value, icon: Icon } : StatsCardProps) => {
  return (
    <Card className="shadow-none">
      <CardHeader className="flex flex-row items-center justify-between pb-2">
        <Label className="text-xl font-bold">
          {title}
        </Label>
        <Icon className="size-6 text-muted-foreground" />
      </CardHeader>
      <CardContent>
        <div className="text-xl font-medium text-desc">
          {value}
        </div>
      </CardContent>
    </Card>
  );
};

