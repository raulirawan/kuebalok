import 'package:flutter/material.dart';
import 'package:kuebalok/providers/food_provider.dart';
import 'package:kuebalok/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    foodInit();
  }

  foodInit() async {
    await Provider.of<FoodProvider>(context, listen: false).getFoods();
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
      (route) => false,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 200,
        ),
      ),
    );
  }
}
