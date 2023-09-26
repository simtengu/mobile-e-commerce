import 'package:e_commerce_app/config/theme.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart Items",
          style: TextStyle(
            color: Pallete.primaryDark,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15).copyWith(top: 2),
                child: SizedBox(
                  height: _size.height * 0.6,
                  child: ListView.builder(
                    itemCount: dummyShoesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return const CartItem();
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Pallete.primaryLight.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  body1(
                    'Confirm and Checkout',
                    customStyle: TextStyle(
                        color: Pallete.secondary, fontWeight: FontWeight.bold),
                  ),
                  vSpacing(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      body1(
                        'Total Payment',
                        customStyle: TextStyle(
                          color: Pallete.secondary,
                        ),
                      ),
                      body1(
                        '\$300',
                        customStyle: TextStyle(
                          color: Pallete.primaryDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  vSpacing(12),
                  ElevatedButton(
                    child: const Text(
                      'Checkout',
                      style: TextStyle(fontSize: 17),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
