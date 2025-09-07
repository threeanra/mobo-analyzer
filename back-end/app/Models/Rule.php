<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUlids;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Support\Carbon;

/**
 * @property string id
 * @property string diagnose_id
 * @property string symptom_id
 * @property Carbon created_by
 * @property Carbon updated_by
 * @property Carbon created_at
 * @property Carbon updated_at
 **/

class Rule extends Model
{
    protected $primaryKey = "id";
    public $incrementing = false;
    protected $keyType = "string";

    protected $guarded = [
        "id"
    ];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (!$model->id) {
                $model->id = generate_custom_id(self::class, "KR");
            }
        });
    }

    public function symptoms(): HasOne
    {
        return $this->hasOne(Symptom::class, "id", "symptom_id");
    }

    public function diagnoses(): HasOne
    {
        return $this->hasOne(Diagnose::class, "id", "diagnose_id");
    }
}
