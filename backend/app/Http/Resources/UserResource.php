<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'mfa' => $this->mfa,
            // Include only non-sensitive attributes
            'balance' => $this->balance,
            'levels' => LevelResource::collection($this->levels),
            'banks' => BankResource::collection($this->banks),
            // You can include other related resources as needed
        ];
    }
}
