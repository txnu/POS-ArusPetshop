<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\FirebaseController;

class KategoriController extends Controller
{
    public function index(FirebaseController $firebaseController) {
        $kategoris = $firebaseController->getKategori();

        return view('pages.categori.index', compact('kategoris'));
    }

    public function createKategori(FirebaseController $firebaseController) {
        $kategoris = $firebaseController->getKategori();
        return view('pages.settings.create-categories', compact('kategoris'));
    }

    public function editKategori($id, FirebaseController $firebaseController) {
        $kategoriData = $firebaseController->getKategoriById($id);
        $kategoris = $firebaseController->getKategori();

        if ($kategoriData) {
            return view('pages.settings.edit-categories', compact('kategoriData', 'kategoris'));
        } else {
            // Handle the case where the product doesn't exist
            return redirect()->back()->with('error', 'Produk Tidak Ditemukan');
        }
    }

}
