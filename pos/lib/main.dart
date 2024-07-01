import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pos/Components/DashboardPage.dart';
import 'package:pos/Screens/HistoryPage.dart';
import 'package:pos/Screens/LoginPage.dart';
import 'package:pos/Screens/ProductPage.dart';
import 'package:pos/Screens/PromoPage.dart';
import 'package:pos/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(
    title: 'POINT OF SALES',
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => const LoginPages(),
      "Dashboard": (context) => const DashboardPages(),
      "Produk": (context) =>  ProductPage(),
      "Riwayat": (context) => const HistoryPage(),
      "Promo": (context) => const PromoPage(),
    },
  ));
}
