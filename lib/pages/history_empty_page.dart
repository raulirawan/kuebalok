import 'package:flutter/material.dart';
import 'package:kuebalok/pages/main_page.dart';
import 'package:kuebalok/pages/order_history_page.dart';
import 'package:kuebalok/theme.dart';

class HistoryEmptyPage extends StatelessWidget {
  const HistoryEmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/bike.png',
              width: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Riwayat Kosong",
              style: blackTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              "Anda Belum Punya Transaksi\n Pesen Sekarang Yuk!",
              style: greyTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              height: 45,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main-page', (route) => false);
                },
                child: Text(
                  "Pilih Menu",
                  style: whiteTextStyle,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
