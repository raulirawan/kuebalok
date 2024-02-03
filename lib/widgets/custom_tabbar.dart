import 'package:flutter/material.dart';
import 'package:kuebalok/theme.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;
  const CustomTabBar({
    Key? key,
    this.selectedIndex = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            height: 1,
            color: Color(0xFFF2F2F2),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  onTap(0);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: defaultMargin),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "On Progress",
                        style: (selectedIndex == 0)
                            ? blackTextStyle
                            : greyTextStyle,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 96,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.2),
                          color: (selectedIndex == 0)
                              ? blackColor
                              : Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onTap(1);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: defaultMargin),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Order Selesai",
                        style: (selectedIndex == 1)
                            ? blackTextStyle
                            : greyTextStyle,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 96,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.2),
                          color: (selectedIndex == 1)
                              ? blackColor
                              : Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
