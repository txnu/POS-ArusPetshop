@extends('layouts.base')

@section('title', 'Tambah Promo')

@push('style')
    <!-- CSS Libraries -->
@endpush

@section('content')
    <div class="main-content">
        <section class="section">
            <div class="section-body">
                <h2 class="section-title">Tambah Promo</h2>
                <div class="row">
                    <div class="col-12">
                        @include('layouts.alert')
                    </div>
                </div>

                <div class="card">
                    <form action="" enctype="multipart/form-data">
                        @csrf
                        <div class="card-header">
                            <h4>Input Data Promo</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label>Kode Promo</label>
                                <input type="text" class="form-control @error('kodepromo') is-invalid @enderror"
                                    name="kodepromo" value="{{ old('kodepromo') }}">
                                @error('kodepromo')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Nama Promo</label>
                                <input type="text"  class="form-control @error('namapromo') is-invalid @enderror"
                                    name="namapromo">{{ old('namapromo') }}</textarea>
                                @error('namapromo')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Potongan</label>
                                <input type="number"  class="form-control @error('potongan') is-invalid @enderror"
                                    name="potongan">{{ old('potongan') }}</textarea>
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
    <!-- JS Libraries -->

@endpush
