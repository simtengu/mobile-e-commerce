import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/horizontal_spacing.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title, imgUrl, price;
  final bool isGridView;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imgUrl,
    this.isGridView = true,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.27;

    return isGridView
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2)
                .copyWith(top: 8),
            decoration: BoxDecoration(
              color: Pallete.primaryLight.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    "${AppConstants.imgPath}$imgUrl",
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Pallete.secondary, fontSize: 18),
                ),
                caption("gucci",
                    customStyle:
                        TextStyle(color: Pallete.primary.withOpacity(0.7))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    body2("\$ $price",
                        customStyle: TextStyle(
                            color: Pallete.secondary,
                            fontWeight: FontWeight.bold)),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      color: Pallete.secondary,
                      icon: const Icon(Icons.favorite_outline),
                    ),
                    IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                          foregroundColor: Pallete.secondary.withOpacity(0.7),
                          backgroundColor: Pallete.primary.withOpacity(0.3)),
                      icon: const Icon(Icons.shopping_cart_outlined),
                    ),
                  ],
                ),
                // const Spacer(),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Pallete.primaryLight.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    "${AppConstants.imgPath}$imgUrl",
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                  ),
                ),
                hSpacing(11),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Pallete.secondary, fontSize: 18),
                    ),
                    caption("gucci",
                        customStyle:
                            TextStyle(color: Pallete.primary.withOpacity(0.8))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        body2("\$ $price",
                            customStyle: TextStyle(
                                color: Pallete.secondary,
                                fontWeight: FontWeight.bold)),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          color: Pallete.primaryDark,
                          icon: const Icon(Icons.favorite_outline),
                        ),
                        IconButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(
                            foregroundColor: Pallete.primaryDark,
                          ),
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),
          );
  }
}
