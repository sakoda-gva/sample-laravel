<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class YourController extends Controller
{
    public function yourMethod()
    {
        return response()->json(['Hello' => 'World']);
    }
}
