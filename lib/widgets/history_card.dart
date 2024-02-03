import 'package:flutter/material.dart';
import 'package:kuebalok/models/food_model.dart';
import 'package:kuebalok/models/transaction_model.dart';
import 'package:kuebalok/pages/detail_food_page.dart';
import 'package:kuebalok/theme.dart';

class HistoryCard extends StatelessWidget {
  final TransactionModel transaction;
  const HistoryCard({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 65,
            height: 65,
            margin: EdgeInsets.only(
              right: 10,
              bottom: 24,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ic-history.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${transaction.invoice}',
                  style: blackTextStyle,
                ),
                Text(
                  '${transaction.totalPrice}',
                  style: greyTextStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: defaultMargin,
            ),
            child: Text(
              "${transaction.status}",
              style: yellowTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
