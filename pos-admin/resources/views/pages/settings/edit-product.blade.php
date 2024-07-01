@extends('layouts.base')

@section('title', 'Edit Produk')

@push('style')
    <!-- CSS Libraries -->
@endpush

@section('content')
    <div class="main-content">
        <section class="section">
            <div class="section-body">
                <div class="card">
                    <form action="{{ route('produk.edit', $produkData['id']) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="card-header">
                            <h4>Edit Data Produk</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label>Kode Produk</label>
                                <input type="text" class="form-control @error('kodeproduk') is-invalid @enderror"
                                    name="kodeproduk" value="{{ $produkData['kodeproduk'] }}">
                                @error('kodeproduk')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Nama Produk</label>
                                <input type="text" class="form-control @error('namaproduk') is-invalid @enderror"
                                    name="namaproduk" value="{{ $produkData['namaproduk'] }}">
                                @error('namaproduk')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Kategori</label>
                                <select class="form-control @error('kategori') is-invalid @enderror" name="kategori">
                                    @foreach($kategoris as $kategori)
                                        <option value="{{ $kategori['id'] }}"
                                            {{ $produkData['idkategori'] == $kategori['id'] ? 'selected' : '' }}>
                                            {{ $kategori['namakategori'] }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('kategori')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Jumlah</label>
                                <input type="number" class="form-control @error('jumlah') is-invalid @enderror"
                                    name="jumlah" value="{{ $produkData['jumlah'] }}">
                                @error('jumlah')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Harga</label>
                                <input type="number" class="form-control @error('harga') is-invalid @enderror"
                                    name="harga" value="{{ $produkData['harga'] }}">
                                @error('harga')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Gambar Produk Saat Ini</label>
                                @if($produkData['image'])
                                    <div>
                                        <img src="{{ asset('/storage/images/' . $produkData['image']) }}" alt="Current Image" style="max-width: 200px;">
                                    </div>
                                @endif
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
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>

            </div>
        </section>
    </div>
@endsection

@push('scripts')
    <!-- JS Libraies -->

    <!-- Page Specific JS File -->
@endpush
