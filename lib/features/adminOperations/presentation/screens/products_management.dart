import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/horizontal_spacing.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/utils/dummy_data.dart';
import 'package:e_commerce_app/features/adminOperations/presentation/screens/add_product.dart';
import 'package:e_commerce_app/features/adminOperations/presentation/screens/edit_product_details.dart';
import 'package:flutter/material.dart';

class ProductsManagementScreen extends StatefulWidget {
  const ProductsManagementScreen({super.key});

  @override
  State<ProductsManagementScreen> createState() =>
      _ProductsManagementScreenState();
}

class _ProductsManagementScreenState extends State<ProductsManagementScreen> {
  String orderBy = "Order by Expensive First";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Management"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.secondary,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddProductScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 20,
        ).copyWith(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Pallete.primaryLight,
                borderRadius: BorderRadius.circular(19),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          child: const Text("Fetch All"),
                        ),
                      ),
                      hSpacing(5),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("Fetch By Filters"),
                        ),
                      ),
                    ],
                  ),
                  vSpacing(10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Pallete.secondary,
                      border: Border.all(color: Pallete.secondary),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: DropdownButton(
                      iconEnabledColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      underline: const SizedBox(),
                      isExpanded: true,
                      dropdownColor: Pallete.secondary,
                      value: orderBy,
                      onChanged: (value) {
                        setState(() {
                          orderBy = value!;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          alignment: Alignment.center,
                          value: "Order by Expensive First",
                          child: Text(
                            'Order by Expensive first',
                          ),
                        ),
                        DropdownMenuItem(
                          alignment: Alignment.center,
                          value: "Order by Cheap First",
                          child: Text('Order by Cheap First'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            vSpacing(26),
            body1(
              '20 Found Products',
              customStyle: TextStyle(color: Pallete.primaryDark),
            ),
            vSpacing(1),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(
                        label: body1('Title',
                            customStyle: TextStyle(color: Pallete.secondary))),
                    DataColumn(
                        label: body1('Picture',
                            customStyle: TextStyle(color: Pallete.secondary))),
                    DataColumn(
                        label: body1('Price',
                            customStyle: TextStyle(color: Pallete.secondary))),
                    DataColumn(
                        label: body1('Category',
                            customStyle: TextStyle(color: Pallete.secondary))),
                    DataColumn(
                        label: body1('Brand',
                            customStyle: TextStyle(color: Pallete.secondary))),
                    DataColumn(
                        label: body1('Date Created',
                            customStyle: TextStyle(color: Pallete.secondary))),
                    DataColumn(
                        label: body1(
                      '',
                    )),
                  ],
                  rows: dummyProducts.map((product) {
                    return DataRow(cells: [
                      DataCell(Text(product.title)),
                      DataCell(
                        Image.asset(
                          "${AppConstants.imgPath}${product.pictureUrl}",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      DataCell(Text('\$${product.price.toStringAsFixed(2)}')),
                      DataCell(Text(product.category)),
                      DataCell(Text(product.brand)),
                      DataCell(Text(product.dateCreated)),
                      DataCell(onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const EditProductDetailsScreen(),
                          ),
                        );
                      },
                          Icon(
                            Icons.border_color_outlined,
                            color: Pallete.secondary,
                          )),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Product> dummyProducts = [
  Product(
    title: 'Product 1',
    pictureUrl: 'nike.png',
    price: 19.99,
    category: 'Electronics',
    brand: 'Brand A',
    dateCreated: '2023-09-28',
  ),
  Product(
    title: 'Product 2',
    pictureUrl: 'gucci.png',
    price: 29.99,
    category: 'Clothing',
    brand: 'Brand B',
    dateCreated: '2023-09-27',
  ),
  Product(
    title: 'Product 1',
    pictureUrl: 'nike.png',
    price: 19.99,
    category: 'Electronics',
    brand: 'Brand A',
    dateCreated: '2023-09-28',
  ),
  Product(
    title: 'Product 2',
    pictureUrl: 'gucci.png',
    price: 29.99,
    category: 'Clothing',
    brand: 'Brand B',
    dateCreated: '2023-09-27',
  ),
];
