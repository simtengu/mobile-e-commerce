import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/description_and_review.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Product Details",
          style: TextStyle(
            color: Pallete.primaryDark,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Pallete.primaryLight.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Image.asset(
                              "${AppConstants.imgPath}nike.png",
                              width: _size * 0.85,
                              height: _size * 0.85,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Pallete.primaryLight,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.favorite_outline),
                                  ),
                                  vSpacing(10),
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Pallete.primaryLight,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                        Icons.shopping_cart_outlined),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      vSpacing(10),
                      Wrap(
                        alignment: WrapAlignment.end,
                        children: [
                          ProductDetailsBottomImage(size: _size),
                          ProductDetailsBottomImage(size: _size),
                          ProductDetailsBottomImage(size: _size),
                          ProductDetailsBottomImage(size: _size),
                          ProductDetailsBottomImage(size: _size),
                        ],
                      ),
                      vSpacing(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          body1(
                            'Nike Sneakers',
                            customStyle: TextStyle(
                                color: Pallete.primaryDark, fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Pallete.primary.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: body1('\$200',
                                customStyle:
                                    TextStyle(color: Pallete.primaryDark)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                vSpacing(20),
                const DescriptionAndReview(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetailsBottomImage extends StatelessWidget {
  const ProductDetailsBottomImage({
    super.key,
    required double size,
  }) : _size = size;

  final double _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(3)),
      child: Image.asset(
        "${AppConstants.imgPath}nike.png",
        width: _size * 0.12,
        height: _size * 0.12,
        fit: BoxFit.cover,
      ),
    );
  }
}
