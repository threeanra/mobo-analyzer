<?php

if (!function_exists('generate_custom_id')) {
    function generate_custom_id(string $modelClass, string $prefix, int $length = 4): string
    {
        $latestId = $modelClass::where('id', 'like', $prefix . '%')
            ->orderByDesc('id')
            ->value('id');

        $nextNumber = 1;
        if ($latestId) {
            $number = (int) substr($latestId, strlen($prefix));
            $nextNumber = $number + 1;
        }

        return $prefix . str_pad($nextNumber, $length, '0', STR_PAD_LEFT);
    }
}
