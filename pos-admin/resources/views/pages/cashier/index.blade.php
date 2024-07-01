@extends('layouts.base')
@section('title','Kasir')
@section('content')
<h1 class="h3 mb-4 text-gray-800">Daftar Kasir</h1>

<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Data Kasir</h6>
        <a href="{{ route('kasir.create') }}" class="btn btn-primary float-right">
            <i class="fa-solid fa-plus"></i>
            Tambah Kasir
        </a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID Kasir</th>
                        <th>Nama</th>
                        <th>No. Handphone</th>
                        <th>Alamat</th>
                        <th>Status</th>
                        <th>Manage</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($kasirs as $kasir)
                    <tr>
                        <td>{{$kasir['idkasir']}}</td>
                        <td>{{$kasir['namalengkap']}}</td>
                        <td>{{$kasir['telepon']}}</td>
                        <td>{{$kasir['alamat']}}</td>
                        <td>Offline</td>
                        <td>
                            <div class="d-flex justify-content-center">
                                <a href='{{ route('kasir.edit', $kasir['id']) }}'
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
