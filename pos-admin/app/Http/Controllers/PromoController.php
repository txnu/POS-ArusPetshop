<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PromoController extends Controller
{
    public function index(FirebaseController $firebaseController) {
        $promos = $firebaseController->getPromo();

        return view('pages.promo.index', compact('promos'));
    }

    public function createPromo(FirebaseController $firebaseController) {
        $promos = $firebaseController->getKategori();
        return view('pages.settings.create-promo', compact('promos'));
    }

    public function editPromo($id, FirebaseController $firebaseController) {
        $promoData = $firebaseController->getPromoById($id);
        $promos = $firebaseController->getPromo();

        if ($promoData) {
            return view('pages.settings.edit-promo', compact('promoData', 'promos'));
        } else {
            // Handle the case where the product doesn't exist
            return redirect()->back()->with('error', 'ProduK Tidak Ditemukan');
        }
    }

}
