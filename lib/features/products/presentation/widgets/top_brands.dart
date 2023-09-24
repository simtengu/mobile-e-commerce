import 'package:e_commerce_app/features/products/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';

class TopBrandsSection extends StatelessWidget {
  const TopBrandsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double cardHeight = MediaQuery.of(context).size.height * .12;
    return Container(
      margin: const EdgeInsets.only(top: 4, left: 20),
      child: SizedBox(
        height: cardHeight,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            CategoryCard(
                title: 'High heels: ',
                count: '23',
                imgUrl: 'highheel.png',
                cardHeight: cardHeight),
            CategoryCard(
                title: 'Sneakers: ',
                count: '9',
                imgUrl: 'sneakers.png',
                cardHeight: cardHeight),
            CategoryCard(
                title: 'Sandals: ',
                count: '19',
                imgUrl: 'sandals.png',
                cardHeight: cardHeight),
            CategoryCard(
                title: 'Sneakers: ',
                count: '9',
                imgUrl: 'sneakers.png',
                cardHeight: cardHeight),
            CategoryCard(
                title: 'High heels: ',
                count: '23',
                imgUrl: 'highheel.png',
                cardHeight: cardHeight),
          ],
        ),
      ),
    );
  }
}
