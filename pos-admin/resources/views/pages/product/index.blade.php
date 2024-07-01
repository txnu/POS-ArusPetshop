@extends('layouts.base')
@section('title', 'Produk')
@section('content')
<h1 class="h3 mb-4 text-gray-800">Daftar Produk</h1>

<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Data Transaksi</h6>
        <a href="{{ route('produk.create') }}" class="btn btn-primary float-right">
            <i class="fa-solid fa-plus"></i>
            Tambah Produk
        </a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Kode Produk</th>
                        <th>Nama Produk</th>
                        <th>Kategori</th>
                        <th>Jumlah</th>
                        <th>Harga</th>
                        <th>Gambar</th>
                        <th>Manage</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($produks as $produk)
                    <tr>
                        <td>{{ $produk['kodeproduk'] }}</td>
                        <td>{{ $produk['namaproduk'] }}</td>
                        <td>{{ $produk['namakategori'] }}</td>
                        <td>{{ $produk['jumlah'] }}</td>
                        <td>Rp{{ $produk['harga'] }}</td>
                        <td>{{ \App\Helpers\StringHelper::truncate($produk['image']) }}</td>
                        <td>
                            <div class="d-flex justify-content-center">
                                <a href='{{ route('produk.edit', $produk['id']) }}'
                                    class="btn btn-sm btn-info btn-icon">
                                    <i class="fas fa-edit"></i>
                                    Edit
                                </a>

                                <form action="#" method="POST" class="ml-2">
                                    {{-- <input type="hidden" name="_method" value="DELETE" />
                                    <input type="hidden" name="_token" --}}
                                        {{-- value="{{ csrf_token() }}" /> --}}
                                    <button class="btn btn-sm btn-danger btn-icon confirm-delete">
                                        <i class="fas fa-times"></i> Delete
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

@endsection
