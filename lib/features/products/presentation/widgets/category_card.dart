import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imgUrl, title, count;
  final double cardHeight;
  const CategoryCard(
      {super.key,
      required this.title,
      required this.count,
      required this.imgUrl,
      required this.cardHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Pallete.secondaryLight,
                Pallete.primaryLight,
              ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
            ),
            child: CircleAvatar(
              radius: (cardHeight * 0.7) / 2.1,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                "${AppConstants.imgPath}$imgUrl",
              ),
            ),
          ),
          body2(title,
              customStyle: TextStyle(
                color: Pallete.secondary,
              )),
        ],
      ),
    );
  }
}
