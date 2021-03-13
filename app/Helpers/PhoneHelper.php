<?php

namespace App\Helpers;

class PhoneHelper
{
    public static function phoneNumber($number)
    {
        if (substr($number, 0, 1) == "0") {
            $data = "+62" . substr($number, 1);
        } else {
            $data = $number;
        }


        if (preg_match('/(\d{3})(\d{4})(\d{4})$/', $data,  $matches)) {
            $result = $matches[1] . '-' . $matches[2] . '-' . $matches[3];
            $lastResult = "+62 " . $result;
            return $lastResult;
        }
    }
}
