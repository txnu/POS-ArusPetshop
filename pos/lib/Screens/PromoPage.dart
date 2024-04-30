import 'package:flutter/material.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Text(
                  "Daftar Promo",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
