@extends('layouts.base')
@section('title', 'Transaksi')
@section('content')
<h1 class="h3 mb-4 text-gray-800">Riwayat Transaksi</h1>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Data Transaksi</h6>
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Kode Transaksi</th>
                        <th>Item</th>
                        <th>Total Transaksi</th>
                        <th>Waktu</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($transaksis as $transaksi)
                    <tr>
                        <td>{{$transaksi['kodetransaksi']}}</td>
                        <td>{{$transaksi['item']}}</td>
                        <td>{{$transaksi['totaltransaksi']}}</td>
                        <td>{{$transaksi['waktu']}}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
