<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Kreait\Firebase\Factory;
use Illuminate\Support\Facades\Validator;
use Kreait\Firebase\ServiceAccount;

class FirebaseController extends Controller
{
    // GET PRODUK
    public function getProduk() {
        $firebase = (new Factory())
            ->withServiceAccount(__DIR__.'/FirebaseKey.json');

        $firestore = $firebase->createFirestore();
        $produkCollection = $firestore->database()->collection('produk');
        $documents = $produkCollection->documents();


        $produks = [];
        foreach ($documents as $document) {
            if ($document->exists()) {
                $data = $document->data();
                $data['id'] = $document->id(); // Include the document ID
                $produks[] = $data;
            }
        }


        $kategoriCollection = $firestore->database()->collection('kategori');
        $kategoriDocuments = $kategoriCollection->documents();

        $kategoriMap = [];
        foreach ($kategoriDocuments as $document) {
            if ($document->exists()) {
                $data = $document->data();
                $kategoriMap[$document->id()] = $data['namakategori']; // Map kategori ID to kategori name
            }
        }

        error_log(print_r($produks, true));
        error_log(print_r($kategoriMap, true));
        foreach ($produks as &$produk) {
            if (isset($produk['idkategori']) && isset($kategoriMap[$produk['idkategori']])) {
                $produk['namakategori'] = $kategoriMap[$produk['idkategori']];
                unset($produk['idkategori']); // Remove idkategori after replacing it with namakategori
            } else {
                $produk['namakategori'] = 'Unknown'; // Fallback if kategori ID not found
            }
        }

        error_log(print_r($produks, true));

        return $produks;
    }

    public function tambahProduk(Request $request) {
        $firebase = (new Factory())->withServiceAccount(__DIR__.'/FirebaseKey.json');
        $firestore = $firebase->createFirestore();

        // Validasi input
        $validator = Validator::make($request->all(), [
            'kodeproduk' => 'required|string|max:255',
            'namaproduk' => 'required|string|max:255',
            'kategori' => 'required|string|max:255',
            'jumlah' => 'required|integer',
            'harga' => 'required|integer',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                            ->withErrors($validator)
                            ->withInput();
        }

        // Simpan file gambar ke folder public/images
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('public/images');
            $imageName = basename($imagePath); // Dapatkan nama file untuk disimpan di database
        } else {
            $imageName = null;
        }

        $produkCollection = $firestore->database()->collection('produk');
        $produkData = [
            'kodeproduk' => $request->input('kodeproduk'),
            'namaproduk' => $request->input('namaproduk'),
            'idkategori' => $request->input('kategori'), // Ensure category ID is saved
            'jumlah' => intval($request->input('jumlah')),
            'harga' => intval($request->input('harga')),
            'image' => $imageName, // Hanya menyimpan nama file gambar di database
        ];

        $produkCollection->add($produkData);

        return redirect()->route('produk')->with('success', 'Produk berhasil ditambahkan!');
    }



    public function getProdukById($id) {
        $firebase = (new Factory())
            ->withServiceAccount(__DIR__.'/FirebaseKey.json');

        $firestore = $firebase->createFirestore();
        $produkCollection = $firestore->database()->collection('produk');
        $produkDoc = $produkCollection->document($id)->snapshot();

        if ($produkDoc->exists()) {
            $data = $produkDoc->data();
            $data['id'] = $id; // Ensure the id is part of the data

            // Fetch category name
            $kategoriCollection = $firestore->database()->collection('kategori');
            $kategoriDoc = $kategoriCollection->document($data['idkategori'])->snapshot();

            if ($kategoriDoc->exists()) {
                $data['namakategori'] = $kategoriDoc->data()['namakategori'];
            } else {
                $data['namakategori'] = 'Unknown Category'; // Handle case where category is not found
            }

            return $data;
        } else {
            return null; // Or handle accordingly if the product doesn't exist
        }
    }

    // UPDATE PRODUK
    public function updateProduk($id, Request $request) {
        $firebase = (new Factory())->withServiceAccount(__DIR__.'/FirebaseKey.json');
        $firestore = $firebase->createFirestore();

        $produkCollection = $firestore->database()->collection('produk');
        $produkDoc = $produkCollection->document($id);
        $produkData = [
            'namapaket' => $request->input('namapaket'),
            'idkategori' => $request->input('kategori'), // Ensure category ID is saved
            'harga' => $request->input('harga'),
        ];

        $produkDoc->set($produkData);
        return redirect()->route('produk.index');
    }

    // GET KATEGORI
    public function getKategori() {
        $firebase = (new Factory())
            ->withServiceAccount(__DIR__.'/FirebaseKey.json');

        $firestore = $firebase->createFirestore();
        $kategoriCollection = $firestore->database()->collection('kategori');
        $documents = $kategoriCollection->documents();

        $kategoris = [];
        foreach ($documents as $document) {
            if ($document->exists()) {
                $data = $document->data();
                $data['id'] = $document->id(); // Include the document ID
                $kategoris[] = $data;
            }
        }
        return $kategoris;
    }




    public function getKategoriById($id) {
        $firebase = (new Factory())
            ->withServiceAccount(__DIR__.'/FirebaseKey.json');

        $firestore = $firebase->createFirestore();
        $kategoriCollection = $firestore->database()->collection('kategori');
        $kategoriDoc = $kategoriCollection->document($id);

        $snapshot = $kategoriDoc->snapshot();
        if ($snapshot->exists()) {
            $data = $snapshot->data();
            $data['id'] = $id;
            return $data;
        } else {
            return null;
        }
    }

    //GET KASIR
    public function getKasir() {
        $firebase = (new Factory())
            ->withServiceAccount(__DIR__.'/FirebaseKey.json');

        $firestore = $firebase->createFirestore();
        $kasirCollection = $firestore->database()->collection('admin');
        $documents = $kasirCollection->documents();

        $kasirs = [];
        foreach ($documents as $document) {
            if ($document->exists()) {
                $data = $document->data();
                $data['id'] = $document->id(); // Include the document ID
                $kasirs[] = $data;
            }
        }
        return $kasirs;
    }

    public function getKasirbyId($id) {
        $firebase = (new Factory())
            ->withServiceAccount(__DIR__.'/FirebaseKey.json');

        $firestore = $firebase->createFirestore();
        $kasirCollection = $firestore->database()->collection('admin');
        $kasirDoc = $kasirCollection->document($id);

        $snapshot = $kasirDoc->snapshot();
        if ($snapshot->exists()) {
            $data = $snapshot->data();
            $data['id'] = $id;
            return $data;
        } else {
            return null;
        }
    }

    //GET TRANSAKSI
    public function getTransaksi() {
        $firebase = (new Factory())
            ->withServiceAccount(__DIR__.'/FirebaseKey.json');

        $firestore = $firebase->createFirestore();
        $transaksiCollection = $firestore->database()->collection('riwayat_pembelian');
        $documents = $transaksiCollection->documents();

        $transaksis = [];
        foreach ($documents as $document) {
            if ($document->exists()) {
                $data = $document->data();
                $data['id'] = $document->id(); // Include the document ID
                $transaksis[] = $data;
            }
        }
        return $transaksis;
    }


    //GET PROMO

    public function getPromo() {
        $firebase = (new Factory())
            ->withServiceAccount(__DIR__.'/FirebaseKey.json');

        $firestore = $firebase->createFirestore();
        $promoCollection = $firestore->database()->collection('promo');
        $documents = $promoCollection->documents();

        $promos = [];
        foreach ($documents as $document) {
            if ($document->exists()) {
                $data = $document->data();
                $data['id'] = $document->id(); // Include the document ID
                $promos[] = $data;
            }
        }
        return $promos;
    }

    public function getPromoById($id) {
        $firebase = (new Factory())
            ->withServiceAccount(__DIR__.'/FirebaseKey.json');

        $firestore = $firebase->createFirestore();
        $promoCollection = $firestore->database()->collection('promo');
        $promoDoc = $promoCollection->document($id);

        $snapshot = $promoDoc->snapshot();
        if ($snapshot->exists()) {
            $data = $snapshot->data();
            $data['id'] = $id;
            return $data;
        } else {
            return null;
        }
    }
}
