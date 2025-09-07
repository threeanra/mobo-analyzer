<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Support\Carbon;

/**
 * @property string id
 * @property string name
 * @property Carbon created_by
 * @property Carbon updated_by
 * @property Carbon created_at
 * @property Carbon updated_at
 **/
class Diagnose extends Model
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
                $model->id = generate_custom_id(self::class, "KD");
            }
        });
    }

    public function rules(): HasMany
    {
        return $this->hasMany(Rule::class, "diagnose_id", "id");
    }

    public function solutions(): HasOne
    {
        return $this->hasOne(Solution::class, "diagnose_id", "id");
    }

}
