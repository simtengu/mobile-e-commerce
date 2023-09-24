import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/horizontal_spacing.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/product_card.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/products_filter_modal.dart';
import 'package:flutter/material.dart';

class ProductsFilterScreen extends StatefulWidget {
  const ProductsFilterScreen({super.key});

  @override
  State<ProductsFilterScreen> createState() => _ProductsFilterScreenState();
}

class _ProductsFilterScreenState extends State<ProductsFilterScreen> {
  bool isGridView = true;
  final List<Map<String, String>> productList = [
    {
      'title': 'gucci',
      'price': '33',
      'imgUrl': 'gucci.png',
    },
    {
      'title': 'gucci',
      'price': '33',
      'imgUrl': 'gucci.png',
    },
    {
      'title': 'gucci',
      'price': '33',
      'imgUrl': 'gucci.png',
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
      'title': 'gucci',
      'price': '33',
      'imgUrl': 'gucci.png',
    },
    {
      'title': 'gucci',
      'price': '33',
      'imgUrl': 'gucci.png',
    },
  ];

  void _showFilterModal(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return
         const ProductsFilterModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          body1('23 items found',
              customStyle: TextStyle(color: Pallete.primary)),
          vSpacing(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  color: Pallete.primaryLight.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: PopupMenuButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      body1(
                        'New First',
                        customStyle:
                            TextStyle(color: Pallete.secondary, fontSize: 20),
                      ),
                      Icon(
                        Icons.unfold_more,
                        color: Pallete.primaryDark,
                        size: 27,
                      ),
                    ],
                  ),
                  itemBuilder: (BuildContext context) {
                    return const [
                      PopupMenuItem(
                        value: 'action',
                        child: Text('Action'),
                      ),
                      PopupMenuItem(
                        value: 'another_action',
                        child: Text('Another action'),
                      ),
                      PopupMenuItem(
                        value: 'something_else',
                        child: Text('Something else here'),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    // Handle the selected item here
                    print('Selected: $value');
                  },
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
              hSpacing(8),
              InkWell(
                onTap: () => _showFilterModal(context),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Pallete.primaryLight.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.filter_alt_outlined,
                        size: 32,
                        color: Pallete.primaryDark,
                      ),
                      hSpacing(2),
                      body1(
                        'Filter',
                        customStyle: TextStyle(color: Pallete.secondary),
                      ),
                    ],
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

