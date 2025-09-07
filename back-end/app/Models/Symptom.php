<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUlids;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Carbon;

/**
 * @property string id
 * @property string name
 * @property string question
 * @property Carbon created_by
 * @property Carbon updated_by
 * @property Carbon created_at
 * @property Carbon updated_at
 **/

class Symptom extends Model
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
                $model->id = generate_custom_id(self::class, "KG");
            }
        });
    }

    public function rules(): HasMany
    {
        return $this->hasMany(Rule::class, "symptom_id", "id");
    }

}
