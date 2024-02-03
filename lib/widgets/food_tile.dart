import 'package:flutter/material.dart';
import 'package:kuebalok/models/food_model.dart';
import 'package:kuebalok/pages/detail_food_page.dart';
import 'package:kuebalok/theme.dart';

class FoodTile extends StatelessWidget {
  // final String name;
  // final int price;
  // final String url;
  final FoodModel food;

  const FoodTile({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailFoodPage(
              food: food,
            ),
          ),
        );
      },
      child: Container(
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
                  image: NetworkImage(food.photo.toString()),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name.toString(),
                  style: blackTextStyle,
                ),
                Text(
                  food.price.toString(),
                  style: greyTextStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
