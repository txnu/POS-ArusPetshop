<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TransaksiController extends Controller
{
    public function index(FirebaseController $firebaseController) {
        $transaksis = $firebaseController->getTransaksi();
        return view('pages.transaction.index', compact('transaksis'));
    }
}
