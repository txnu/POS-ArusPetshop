@extends('layouts.base')
@section('title','Kategori')
@section('content')
<h1 class="h3 mb-4 text-gray-800">Daftar Kategori</h1>

<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Data Kasir</h6>
        <a href="#" class="btn btn-primary float-right">
            <i class="fa-solid fa-plus"></i>
            Tambah Kategori
        </a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID Kategori</th>
                        <th>Nama Kategori</th>
                        <th>Nama Kategori</th>
                        <th>Manage</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($kategoris as $kategori)
                    <tr>
                        <td>{{$kategori['kodekategori']}}</td>
                        <td>{{$kategori['namakategori']}}</td>
                        <td>/asset/uuuuu</td>
                        <td>
                            <div class="d-flex justify-content-center">
                                <a href='{{ route('kategori.edit', $kategori['id']) }}'
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
