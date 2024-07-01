<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\FirebaseController;
use Carbon\Factory;

class ProdukController extends Controller
{
    public function index(FirebaseController $firebaseController) {
        $produks = $firebaseController->getProduk();
        return view('pages.product.index', compact('produks'));
    }

    public function createProduk(Request $request, FirebaseController $firebaseController) {
        if ($request->isMethod('post')) {
            return $firebaseController->tambahProduk($request);
        }
        $kategoris = $firebaseController->getKategori();
        return view('pages.settings.create-product', compact('kategoris'));
    }

    public function editProduk($id, FirebaseController $firebaseController) {
        $produkData = $firebaseController->getProdukById($id);
        $kategoris = $firebaseController->getKategori();


        if ($produkData) {
            return view('pages.settings.edit-product', compact('produkData', 'kategoris'));
        } else {
            // Handle the case where the product doesn't exist
            return redirect()->back()->with('error', 'ProduK Tidak Ditemukan');
        }
    }



}
