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
                    <form action="{{ route('promo.edit', $promoData['id']) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="card-header">
                            <h4>Edit Data Promo</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label>Kode Promo</label>
                                <input type="text" class="form-control @error('idpromo') is-invalid @enderror"
                                    name="idpromo" value="{{ $promoData['kodepromo'] }}">
                                @error('idkasir')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Nama Promo</label>
                                <input type="text" class="form-control @error('namapromo') is-invalid @enderror"
                                    name="namapromo" value="{{ $promoData['namapromo'] }}">
                                @error('namapromo')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>potongan</label>
                                <input type="text" class="form-control @error('potongan') is-invalid @enderror"
                                    name="potongan" value="{{ $promoData['potongan'] }}">
                                @error('potongan')
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
