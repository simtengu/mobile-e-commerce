import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductsWishlistScreen extends StatefulWidget {
  const ProductsWishlistScreen({super.key});

  @override
  State<ProductsWishlistScreen> createState() => _ProductsWishlistScreenState();
}

class _ProductsWishlistScreenState extends State<ProductsWishlistScreen> {
  bool isGridView = true;

  final List<Map<String, String>> productList = [
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
    {
      'title': 'gucci',
      'price': '33',
      'imgUrl': 'gucci.png',
    },
    {
      'title': 'nike',
      'price': '33',
      'imgUrl': 'nike.png',
    },
    {
      'title': 'yeezy',
      'price': '33',
      'imgUrl': 'yeezy.png',
    },
    {
      'title': 'puma',
      'price': '33',
      'imgUrl': 'puma.png',
    },
    {
      'title': 'gucci',
      'price': '33',
      'imgUrl': 'gucci.png',
    },
    {
      'title': 'nike',
      'price': '33',
      'imgUrl': 'nike.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          body1(
            'Wishlist Items',
            customStyle: TextStyle(
              color: Pallete.secondary,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          vSpacing(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "23 items found",
                style: TextStyle(
                  color: Pallete.primaryDark,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => setState(() {
                  isGridView = !isGridView;
                }),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Pallete.primaryLight.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Icon(
                    isGridView
                        ? Icons.view_list_outlined
                        : Icons.grid_view_outlined,
                    size: 32,
                    color: Pallete.primaryDark,
                  ),
                ),
              ),
            ],
          ),
          vSpacing(14),
          Expanded(
            child: isGridView
                ? GridView.count(
                    childAspectRatio: 0.77,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: productList
                        .map((product) => ProductCard(
                            isGridView: isGridView,
                            title: product["title"]!,
                            price: product["price"]!,
                            imgUrl: product["imgUrl"]!))
                        .toList(),
                  )
                : ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                          isGridView: isGridView,
                          title: productList[index]["title"]!,
                          price: productList[index]["price"]!,
                          imgUrl: productList[index]["imgUrl"]!);
                    },
                  ),
          )
        ],
      ),
    );
  }
}
