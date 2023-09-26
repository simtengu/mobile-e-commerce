import 'package:e_commerce_app/config/theme.dart';
import 'package:flutter/material.dart';
class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return      Container(
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Pallete.secondaryLight.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: RichText(
                  text: TextSpan(
                      text: "albert simtengu: ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        color: Pallete.textPrimary,
                      ),
                      children: const [
                        TextSpan(
                          text:
                              "Elevate your style with these iconic Gucci shoes. Crafted with precision and adorned with the Gucci logo, they're the epitome of luxury and sophistication. Perfect for any occasion, these shoes combine comfort with timeless style",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal),
                        )
                      ]),
                ),
              )
            ;
  }
}