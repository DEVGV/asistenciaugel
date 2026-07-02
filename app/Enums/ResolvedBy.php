<?php

namespace App\Enums;

enum ResolvedBy: string
{
    case Director = 'D';
    case Ugel     = 'U';

    public function nombre(): string
    {
        return match ($this) {
            self::Director => 'Director',
            self::Ugel     => 'UGEL',
        };
    }
}
