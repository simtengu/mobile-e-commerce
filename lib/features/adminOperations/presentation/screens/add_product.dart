import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/core/utils/dummy_data.dart';
import 'package:e_commerce_app/features/adminOperations/presentation/widgets/image_upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<String> imageUrls = [];

  void addImage(String imgUrl) {
    setState(() {
      imageUrls.insert(0, imgUrl);
    });
  }

  String selectedBrand = 'Nike';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
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
              if (imageUrls.length < 5) ImageUpload(addImage: addImage),
              vSpacing(10),
              if (imageUrls.isNotEmpty)
                SizedBox(
                  height: imageUrls.length > 3
                      ? MediaQuery.of(context).size.height * 0.32
                      : (MediaQuery.of(context).size.height * 0.32) / 2,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                              child: Image.network(
                                imageUrls[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          body2('delete',
                              customStyle: TextStyle(
                                  color: Colors.red.withOpacity(0.7))),
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
                  "Save Product",
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
