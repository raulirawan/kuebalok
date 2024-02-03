import 'package:flutter/material.dart';
import 'package:kuebalok/models/cart_model.dart';
import 'package:kuebalok/theme.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;

  const CheckoutCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.only(
              right: 12,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                  cart.food!.photo!.toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${cart.food!.name}",
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${cart.food!.price}",
                  style: greyTextStyle,
                ),
              ],
            ),
          ),
          Text(
            "${cart.quantity} items",
            style: greyTextStyle.copyWith(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
