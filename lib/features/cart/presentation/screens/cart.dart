import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final List<int> dummyShoesList = [1, 3, 4, 5, 6, 7, 7];
    return Padding(
      padding: const EdgeInsets.all(15).copyWith(top: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          heading3('Products In Cart', customStyle: TextStyle(fontSize: 26)),
          vSpacing(10),
          SizedBox(
            height: _size.height * 0.6,
            child: ListView.builder(
              itemCount: dummyShoesList.length,
              itemBuilder: (BuildContext context, int index) {
                return const CartItem();
              },
            ),
          ),
          const Spacer(),
          vSpacing(10),
        ],
      ),
    );
  }
}
