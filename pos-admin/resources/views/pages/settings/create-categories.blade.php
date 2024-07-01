@extends('layouts.base')

@section('title', 'Tambah Kategori')

@push('style')
    <!-- CSS Libraries -->
@endpush

@section('content')
    <div class="main-content">
        <section class="section">
            <div class="section-body">
                <h2 class="section-title">Tambah Produk</h2>
                <div class="row">
                    <div class="col-12">
                        @include('layouts.alert')
                    </div>
                </div>

                <div class="card">
                    <form action="" enctype="multipart/form-data">
                        @csrf
                        <div class="card-header">
                            <h4>Input Data Kategori</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label>Kode Kategori</label>
                                <input type="text" class="form-control @error('kodekategori') is-invalid @enderror"
                                    name="kodekategori" value="{{ old('kodekategori') }}">
                                @error('kodekategori')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Nama Kategori</label>
                                <input type="text"  class="form-control @error('namakategori') is-invalid @enderror"
                                    name="namakategori">{{ old('namakategori') }}</textarea>
                                @error('namakategori')
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
