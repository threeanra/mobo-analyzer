<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines contain the default error messages used by
    | the validator class. Some of these rules have multiple versions such
    | as the size rules. Feel free to tweak each of these messages here.
    |
    */

    'accepted' => 'Tidak diterima.',
    'accepted_if' => 'Tidak diterima jika :other adalah :value.',
    'active_url' => 'URL tidak valid.',
    'after' => 'Tanggal setelah :date.',
    'after_or_equal' => 'Tanggal setelah atau sama dengan :date.',
    'alpha' => 'Hanya boleh berisi huruf.',
    'alpha_dash' => 'Hanya boleh huruf, angka, tanda hubung, dan garis bawah.',
    'alpha_num' => 'Hanya boleh huruf dan angka.',
    'array' => 'Harus berupa array.',
    'before' => 'Harus tanggal sebelum :date.',
    'before_or_equal' => 'Harus tanggal sebelum atau sama dengan :date.',
    'between' => [
        'numeric' => 'Harus diantara :min - :max.',
        'file' => 'Harus diantara :min - :max KB.',
        'string' => 'Harus diantara :min - :max karakter.',
        'array' => 'Harus memiliki :min - :max item.',
    ],
    'boolean' => 'Hanya benar atau salah.',
    'confirmed' => 'Konfirmasi tidak cocok.',
    'current_password' => 'Kata sandi salah.',
    'date' => 'tanggal tidak valid.',
    'date_equals' => 'Tanggal sama dengan :date.',
    'date_format' => 'Hanya menerima format :format.',
    'different' => 'Harus berbeda dari :other.',
    'digits' => 'Harus :digits digit.',
    'digits_between' => 'Harus diantara :min - :max digit.',
    'email' => 'Email tidak valid.',
    'exists' => 'Pilihan tidak valid.',
    'file' => 'Harus berupa file.',
    'image' => 'Harus berupa gambar.',
    'in' => 'Pilihan tidak valid.',
    'integer' => 'Harus berupa angka.',
    'ip' => 'IP tidak valid.',
    'json' => 'JSON tidak valid.',
    'max' => [
        'numeric' => 'Tidak boleh lebih dari :max.',
        'file' => 'Tidak boleh lebih dari :max KB.',
        'string' => 'Tidak boleh lebih dari :max karakter.',
        'array' => 'Tidak boleh lebih dari :max item.',
    ],
    'mimes' => 'Harus berupa file dengan tipe: :values.',
    'min' => [
        'numeric' => 'Minimal :min.',
        'file' => 'Minimal :min KB.',
        'string' => 'Minimal :min karakter.',
        'array' => 'Minimal :min item.',
    ],
    'not_in' => 'Tidak valid.',
    'numeric' => 'Harus berupa angka.',
    'password' => [
        'letters' => 'Harus mengandung minimal satu huruf.',
        'mixed' => 'Harus mengandung huruf besar dan kecil.',
        'numbers' => 'Harus mengandung minimal satu angka.',
        'symbols' => 'Harus mengandung minimal satu simbol.',
        'uncompromised' => 'Kata sandi ini sudah pernah bocor. Gunakan yang lain.',
    ],
    'regex' => 'Format tidak valid.',
    'required' => 'Harus diisi.',
    'same' => 'Harus sama dengan :other.',
    'size' => [
        'numeric' => 'Harus :size.',
        'file' => 'Harus :size KB.',
        'string' => 'Harus :size karakter.',
        'array' => 'Harus memiliki :size item.',
    ],
    'string' => 'Harus berupa teks.',
    'timezone' => 'Harus zona waktu yang valid.',
    'unique' => 'Sudah digunakan.',
    'uploaded' => 'Gagal mengunggah.',
    'url' => 'Harus URL yang valid.',
    'ulid' => 'Format harus ULID.',
    'uuid' => 'Format harus UUID.',
    'starts_with' => 'Harus dimulai dengan :values',

    'required_unless' => 'Harus diisi karena kondisi tertentu',

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom validation messages for attributes using the
    | convention "attribute.rule" to name the lines. This makes it quick to
    | specify a specific custom language line for a given attribute rule.
    |
    */

    'custom' => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | The following language lines are used to swap our attribute placeholder
    | with something more reader friendly such as "E-Mail Address" instead
    | of "email". This simply helps us make our message more expressive.
    |
    */

    'attributes' => [],

];
