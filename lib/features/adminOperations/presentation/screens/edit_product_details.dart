import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/utils/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProductDetailsScreen extends StatefulWidget {
  const EditProductDetailsScreen({super.key});

  @override
  State<EditProductDetailsScreen> createState() =>
      _EditProductDetailsScreenState();
}

class _EditProductDetailsScreenState extends State<EditProductDetailsScreen> {
  final List<String> imageUrls = [
    'gucci.png',
    'nike.png',
    'puma.png',
    'adidas.png',
    'yeezy.png',
  ];

  String selectedBrand = 'Nike';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product Details'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.34,
                  height: MediaQuery.of(context).size.width * 0.34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Pallete.textPrimary.withOpacity(0.5),
                  ),
                  child: const Icon(
                    Icons.add_a_photo_outlined,
                    size: 44,
                  ),
                ),
              ),
              vSpacing(10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.32,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                  ),
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: FractionallySizedBox(
                            alignment: Alignment.center,
                            widthFactor: 0.8,
                            heightFactor: 0.8,
                            child: Image.asset(
                              "${AppConstants.imgPath}${imageUrls[index]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        body2('delete',
                            customStyle:
                                TextStyle(color: Colors.red.withOpacity(0.7))),
                      ],
                    );
                  },
                ),
              ),
              vSpacing(20),
              Divider(
                color: Pallete.textPrimary.withOpacity(0.5),
              ),
              vSpacing(13),
              body1(
                ' Title',
                customStyle: TextStyle(color: Pallete.primary),
              ),
              vSpacing(10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Pallete.textPrimary)),
                  labelText: 'title....',
                ),
              ),
              vSpacing(13),
              body1(
                'Price',
                customStyle: TextStyle(color: Pallete.primary),
              ),
              vSpacing(10),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Pallete.textPrimary)),
                  labelText: 'Price.........',
                ),
              ),
              vSpacing(13),
              body1(
                'Brief Description',
                customStyle: TextStyle(color: Pallete.primary),
              ),
              vSpacing(10),
              TextField(
                maxLength: 300,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Pallete.textPrimary)),
                ),
              ),
              vSpacing(13),
              body1(
                'Brand',
                customStyle: TextStyle(color: Pallete.primary),
              ),
              vSpacing(5),
              DropdownButton<String>(
                isExpanded: true,
                value: selectedBrand,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBrand = newValue!;
                  });
                },
                items: shoeBrands.map<DropdownMenuItem<String>>((String brand) {
                  return DropdownMenuItem<String>(
                    value: brand,
                    child: Text(brand),
                  );
                }).toList(),
                hint: const Text('Select a shoe brand'),
              ),
              vSpacing(13),
              body1(
                'Category',
                customStyle: TextStyle(color: Pallete.primary),
              ),
              vSpacing(5),
              DropdownButton<String>(
                isExpanded: true,
                value: selectedBrand,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBrand = newValue!;
                  });
                },
                items: shoeBrands.map<DropdownMenuItem<String>>((String brand) {
                  return DropdownMenuItem<String>(
                    value: brand,
                    child: Text(brand),
                  );
                }).toList(),
                hint: const Text('Select a shoe brand'),
              ),
              vSpacing(29),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Save Changes",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              vSpacing(24),
            ],
          ),
        ),
      )),
    );
  }
}
