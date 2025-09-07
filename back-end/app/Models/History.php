<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUlids;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Support\Carbon;

/**
 * @property string id
 * @property string diagnose_id
 * @property Carbon created_by
 * @property Carbon updated_by
 * @property Carbon created_at
 * @property Carbon updated_at
 **/
class History extends Model
{
    use HasUlids;

    protected $guarded = [
        "id"
    ];

    public function user(): HasOne
    {
        return $this->hasOne(User::class, "id", "created_by");
    }

    public function diagnoses(): HasOne
    {
        return $this->hasOne(Diagnose::class, "id", "diagnose_id");
    }

}
