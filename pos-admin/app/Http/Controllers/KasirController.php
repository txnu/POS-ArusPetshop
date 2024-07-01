<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\FirebaseController;

class KasirController extends Controller
{
    public function index(FirebaseController $firebaseController) {
        $kasirs = $firebaseController->getKasir();
        return view('pages.cashier.index', compact('kasirs'));
    }

    public function createKasir(FirebaseController $firebaseController) {
        $kasirs = $firebaseController->getKasir();
        return view('pages.settings.create-cashier', compact('kasirs'));
    }

    public function editKasir($id, FirebaseController $firebaseController) {
        $kasirData = $firebaseController->getKasirById($id);
        $kasirs = $firebaseController->getKasir();
        return view('pages.settings.edit-cashier', compact('kasirData', 'kasirs'));
    }

}
