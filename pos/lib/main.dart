import 'package:flutter/material.dart';
import 'package:pos/Screens/DashboardPage.dart';
import 'package:pos/Screens/HistoryPage.dart';
import 'package:pos/Screens/LoginPage.dart';
import 'package:pos/Screens/ProductPage.dart';
import 'package:pos/Screens/PromoPage.dart';

void main() async {
  runApp(MaterialApp(
    title: 'POINT OF SALES',
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => LoginPages(),
      "Dashboard": (context) => DashboardPages(),
      "Produk": (context) => ProductPage(),
      "Riwayat": (context) => HistoryPage(),
      "Promo": (context) => PromoPage(),
    },
  ));
}
