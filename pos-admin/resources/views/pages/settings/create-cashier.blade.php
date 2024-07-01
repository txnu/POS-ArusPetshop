@extends('layouts.base')

@section('title', 'Tambah Kasir')

@push('style')
    <!-- CSS Libraries -->
@endpush

@section('content')
    <div class="main-content">
        <section class="section">
            <div class="section-body">
                <h2 class="section-title">Tambah Kasir</h2>
                <div class="row">
                    <div class="col-12">
                        @include('layouts.alert')
                    </div>
                </div>

                <div class="card">
                    <form action="" enctype="multipart/form-data">
                        @csrf
                        <div class="card-header">
                            <h4>Input Data Kasir</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label>ID Kasir</label>
                                <input type="text" class="form-control @error('idKasir') is-invalid @enderror"
                                    name="idKasir" value="{{ old('idKasir') }}">
                                @error('idKasir')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Nama Lengkap</label>
                                <input type="text"  class="form-control @error('nama') is-invalid @enderror"
                                    name="nama">{{ old('nama') }}</textarea>
                                @error('nama')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Telepon</label>
                                <input type="text"  class="form-control @error('telepon') is-invalid @enderror"
                                    name="telepon">{{ old('telepon') }}</textarea>
                                @error('telepon')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Alamat</label>
                                <input type="text"  class="form-control @error('alamat') is-invalid @enderror"
                                    name="alamat">{{ old('alamat') }}</textarea>
                                @error('alamat')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="file" class="form-control-file @error('image') is-invalid @enderror"
                                    name="image">
                                @error('image')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                        </div>
                        <div class="card-footer text-right">
                            <button class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>

            </div>
        </section>
    </div>
@endsection

@push('scripts')
    <!-- JS Libraries -->

@endpush
