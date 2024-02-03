import 'package:flutter/material.dart';
import 'package:kuebalok/pages/cart_page.dart';
import 'package:kuebalok/pages/checkout_page.dart';
import 'package:kuebalok/pages/driver/detail_order_page.dart';
import 'package:kuebalok/pages/driver/main_page_driver.dart';
import 'package:kuebalok/pages/edit_profile_page.dart';
import 'package:kuebalok/pages/login_page.dart';
import 'package:kuebalok/pages/main_page.dart';
import 'package:kuebalok/pages/order_history_page.dart';
import 'package:kuebalok/pages/profile_page.dart';
import 'package:kuebalok/pages/register_page.dart';
import 'package:kuebalok/pages/splash_page.dart';
import 'package:kuebalok/pages/success_order_page.dart';
import 'package:kuebalok/providers/auth_provider.dart';
import 'package:kuebalok/providers/cart_provider.dart';
import 'package:kuebalok/providers/food_provider.dart';
import 'package:kuebalok/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/main-page': (context) => MainPage(),
          '/checkout-page': (context) => CheckoutPage(),
          '/cart-page': (context) => CartPage(),
          '/profile-page': (context) => ProfilePage(),
          '/edit-profile-page': (context) => EditProfilePage(),
          '/success-order-page': (context) => SuccessOrderPage(),
          '/order-history-page': (context) => OrderHistoryPage(),
          // DRIVER
          '/main-page-driver': (context) => MainPageDriver(),
        },
      ),
    );
  }
}
