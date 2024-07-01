import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Transaksi {
  String kodetransaksi;
  String item;
  int totaltransaksi;
  Timestamp waktu;

  Transaksi({
    required this.kodetransaksi,
    required this.item,
    required this.totaltransaksi,
    required this.waktu,
  });

  Map<String, dynamic> toJson() {
    return {
      "kodetransaksi": kodetransaksi,
      "item": item,
      "totaltransaksi": totaltransaksi,
      "waktu": waktu,
    };
  }

  factory Transaksi.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return Transaksi(
      kodetransaksi: json['kodetransaksi'],
      item: json['item'],
      totaltransaksi: json['totaltransaksi'] as int,
      waktu: json['waktu'] as Timestamp,
    );
  }

  String get formattedWaktu {
    final DateFormat formatter = DateFormat('yyyy-MM-dd | HH:mm');

    final DateTime dateTime = waktu.toDate(); 
    return formatter.format(dateTime);
  }
  
  String get formattedTotalTransaksi {
    final NumberFormat formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

    return formatter.format(totaltransaksi);
  }
}
