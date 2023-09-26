import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/horizontal_spacing.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/product_card.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/product_review.dart';
import 'package:flutter/material.dart';

class DescriptionAndReview extends StatefulWidget {
  const DescriptionAndReview({super.key});

  @override
  State<DescriptionAndReview> createState() => _DescriptionAndReviewState();
}

class _DescriptionAndReviewState extends State<DescriptionAndReview> {
  final List<Map<String, String>> relatedProducts = [
    {
      'title': 'adidas',
      'price': '33',
      'imgUrl': 'adidas.png',
    },
    {
      'title': 'sandals',
      'price': '33',
      'imgUrl': 'sandals.png',
    },
    {
      'title': 'highheel',
      'price': '33',
      'imgUrl': 'highheel.png',
    },
  ];
  bool isDescriptionActive = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (!isDescriptionActive) {
                  setState(() {
                    isDescriptionActive = true;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: isDescriptionActive
                            ? Pallete.secondary
                            : Colors.white,
                        width: 2),
                  ),
                ),
                child: heading4('Description',
                    customStyle: TextStyle(color: Pallete.primaryDark)),
              ),
            ),
            hSpacing(8),
            Container(
              height: 18,
              width: 3,
              color: Pallete.primaryLight,
            ),
            hSpacing(8),
            InkWell(
              onTap: () {
                if (isDescriptionActive) {
                  setState(() {
                    isDescriptionActive = false;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: isDescriptionActive
                            ? Colors.white
                            : Pallete.secondary,
                        width: 2),
                  ),
                ),
                child: heading4('Reviews',
                    customStyle: TextStyle(color: Pallete.primaryDark)),
              ),
            ),
          ],
        ),
        vSpacing(6),
        SizedBox(
          width: double.infinity,
          child: isDescriptionActive
              ? body2(
                  "Elevate your style with these iconic Gucci shoes. Crafted with precision and adorned with the Gucci logo, they're the epitome of luxury and sophistication. Perfect for any occasion, these shoes combine comfort with timeless style.",
                  customStyle: const TextStyle(fontSize: 16),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(3),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              hintText: 'write your review here.....',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          color: Pallete.secondary,
                          onPressed: () {
                            // Add your send functionality here
                          },
                        ),
                      ],
                    ),
                    vSpacing(4),
                    heading4('reviews',
                        customStyle: const TextStyle(fontSize: 18)),
                    const ProductReview(),
                    const ProductReview(),
                  ],
                ),
        ),
        vSpacing(20),
        heading4(
          'Related Products',
          customStyle: TextStyle(color: Pallete.primaryDark),
        ),
        vSpacing(10),
        ...relatedProducts
            .map((product) => ProductCard(
                isGridView: false,
                title: product["title"]!,
                price: product["price"]!,
                imgUrl: product["imgUrl"]!))
            .toList(),
      ],
    );
  }
}
