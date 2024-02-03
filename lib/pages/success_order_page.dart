import 'package:flutter/material.dart';
import 'package:kuebalok/pages/main_page.dart';
import 'package:kuebalok/pages/order_history_page.dart';
import 'package:kuebalok/theme.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({Key? key}) : super(key: key);

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
              "Order Berhasil",
              style: blackTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              "Pesanan Anda Berhasil Di Buat\n Tunggu Ya!",
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
                  "Menu Lain",
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
            Container(
              width: 200,
              height: 45,
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(
                          initialPage: 2,
                        ),
                      ),
                      (route) => false);
                },
                child: Text(
                  "Lihar Order Saya",
                  style: whiteTextStyle,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: greyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
