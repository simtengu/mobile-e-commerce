import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/horizontal_spacing.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/price_range_slider.dart';
import 'package:flutter/material.dart';

class ProductsFilterModal extends StatefulWidget {
  const ProductsFilterModal({
    super.key,
  });

  @override
  State<ProductsFilterModal> createState() => _ProductsFilterModalState();
}

class _ProductsFilterModalState extends State<ProductsFilterModal> {
  String selectedOption = 'Newest First';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(14),
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height / 1.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 5,
                child: hSpacing(54),
              ),
            ),
            vSpacing(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.filter_alt_outlined,
                      size: 30,
                    ),
                    hSpacing(4),
                    heading3(
                      'Product Filters',
                      customStyle: TextStyle(color: Pallete.primaryDark),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: Pallete.primary,
                  ),
                ),
              ],
            ),
            vSpacing(14),
            body1(
              'For Men or Women',
              customStyle: TextStyle(
                  color: Pallete.secondary, fontWeight: FontWeight.bold),
            ),
            vSpacing(10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Pallete.primaryLight.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: body1(
                      "All",
                      customStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                hSpacing(20),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Pallete.primaryLight.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: body1(
                    "Men",
                    customStyle: const TextStyle(color: Colors.black),
                  ),
                )),
                hSpacing(20),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Pallete.primaryLight.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: body1(
                    "Women",
                    customStyle: const TextStyle(color: Colors.black),
                  ),
                )),
              ],
            ),
            vSpacing(14),
            Divider(
              color: Pallete.textPrimary.withOpacity(0.4),
            ),
            body1(
              'Select Categories',
              customStyle: TextStyle(
                  color: Pallete.secondary, fontWeight: FontWeight.bold),
            ),
            vSpacing(6),
            Wrap(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Pallete.primaryLight.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Text('trending'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Pallete.primaryLight.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: body2(
                    'Fashion',
                    customStyle: const TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            vSpacing(14),
            Divider(
              color: Pallete.textPrimary.withOpacity(0.4),
            ),
            body1(
              'Select Brands',
              customStyle: TextStyle(
                  color: Pallete.secondary, fontWeight: FontWeight.bold),
            ),
            vSpacing(6),
            Wrap(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Pallete.primaryLight.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Text('nike'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Pallete.primaryLight.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: body2(
                    'puma',
                    customStyle: const TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            vSpacing(14),
            Divider(
              color: Pallete.textPrimary.withOpacity(0.4),
            ),
            body1(
              'Price Range',
              customStyle: TextStyle(
                  color: Pallete.secondary, fontWeight: FontWeight.bold),
            ),
            vSpacing(6),
            const PriceRangeSlider(),
            vSpacing(14),
            Divider(
              color: Pallete.textPrimary.withOpacity(0.4),
            ),
            body1(
              'Sort Products',
              customStyle: TextStyle(
                  color: Pallete.secondary, fontWeight: FontWeight.bold),
            ),
            vSpacing(6),
            Container(
              padding: const EdgeInsets.all(5),
              child: DropdownButton<String>(
                value: selectedOption,
                onChanged: (newValue) {
                  setState(() {
                    selectedOption = newValue!;
                  });
                },
                items: <String>[
                  'Newest First',
                  'Price: High to Low',
                  'Price: Low to High',
                  'Alphabetical',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            vSpacing(12),
            ElevatedButton(
              child: const Text(
                'Apply Filters',
                style: TextStyle(fontSize: 17),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
