import 'package:flutter/material.dart';
import 'package:kuebalok/pages/main_page.dart';
import 'package:kuebalok/theme.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({Key? key}) : super(key: key);

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
              "Keranjang Kosong",
              style: blackTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              "Yuk Pilih Menu Yang Cocok\nBuat Kamu",
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(
                          initialPage: 0,
                        ),
                      ),
                      (route) => false);
                },
                child: Text(
                  "Cari Menu",
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
          ],
        ),
      ),
    );
  }
}
