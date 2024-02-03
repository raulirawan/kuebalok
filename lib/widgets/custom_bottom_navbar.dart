import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;
  const CustomBottomNavbar({
    Key? key,
    this.selectedIndex = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              onTap(0);
            },
            child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        ((selectedIndex == 0)
                            ? 'assets/ic-home-color.png'
                            : 'assets/ic-home-grey.png'),
                      ),
                      fit: BoxFit.contain),
                )),
          ),
          GestureDetector(
            onTap: () {
              onTap(1);
            },
            child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        ((selectedIndex == 1)
                            ? 'assets/ic-cart-color.png'
                            : 'assets/ic-cart-grey.png'),
                      ),
                      fit: BoxFit.contain),
                )),
          ),
          GestureDetector(
            onTap: () {
              onTap(2);
            },
            child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        ((selectedIndex == 2)
                            ? 'assets/ic-order-color.png'
                            : 'assets/ic-order-grey.png'),
                      ),
                      fit: BoxFit.contain),
                )),
          ),
          GestureDetector(
            onTap: () {
              onTap(3);
            },
            child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        ((selectedIndex == 3)
                            ? 'assets/ic-profile-color.png'
                            : 'assets/ic-profile-grey.png'),
                      ),
                      fit: BoxFit.contain),
                )),
          ),
        ],
      ),
    );
  }
}
