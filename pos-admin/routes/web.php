<?php

use App\Http\Controllers\AboutController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\KasirController;
use App\Http\Controllers\KategoriController;
use App\Http\Controllers\ProdukController;
use App\Http\Controllers\PromoController;
use App\Http\Controllers\TransaksiController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/',[AuthController::class,'login']);


Route::get('/dashboard',[DashboardController::class,'index'])->name('dashboard');
Route::get('/produk',[ProdukController::class,'index'])->name('produk');
Route::get('/kategori',[KategoriController::class,'index'])->name('kategori');
Route::get('/promo',[PromoController::class,'index'])->name('promo');
Route::get('/transaksi',[TransaksiController::class,'index'])->name('transaksi');
Route::get('/kasir',[KasirController::class,'index'])->name('kasir');


Route::match(['get', 'post'], '/settings/create-product', [ProdukController::class, 'createProduk'])->name('produk.create');
Route::get('/settings/edit-product/{id}', [ProdukController::class, 'editProduk'])->name('produk.edit');
Route::get('/settings/create-categories', [KategoriController::class, 'createKategori'])->name('kategori.create');
Route::get('/settings/edit-categories/{id}', [KategoriController::class, 'editKategori'])->name('kategori.edit');
Route::get('/settings/create-cashier', [KasirController::class, 'createKasir'])->name('kasir.create');
Route::get('/settings/edit-cashier/{id}', [KasirController::class, 'editKasir'])->name('kasir.edit');
Route::get('/settings/create-promo', [PromoController::class, 'createPromo'])->name('promo.create');
Route::get('/settings/edit-promo/{id}', [PromoController::class, 'editPromo'])->name('promo.edit');



