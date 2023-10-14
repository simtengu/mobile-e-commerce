import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/network_data_state.dart';
import 'package:e_commerce_app/core/services/injection_container.dart';
import 'package:e_commerce_app/core/utils/commonMethods/loader.dart';
import 'package:e_commerce_app/core/utils/commonMethods/show_snackbar.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/features/adminOperations/domain/entities/brand_entity.dart';
import 'package:e_commerce_app/features/adminOperations/domain/entities/category_entity.dart';
import 'package:e_commerce_app/features/adminOperations/domain/usecases/create_product.dart';
import 'package:e_commerce_app/features/adminOperations/domain/usecases/delete_image.dart';
import 'package:e_commerce_app/features/adminOperations/domain/usecases/fetch_brands.dart';
import 'package:e_commerce_app/features/adminOperations/domain/usecases/fetch_categories.dart';
import 'package:e_commerce_app/features/adminOperations/presentation/widgets/image_upload.dart';
import 'package:e_commerce_app/features/products/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/skeleton_loader.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  bool isFetchingBrandsAndCategories = true;

  String selectedCategory = 'no category';
  String selectedBrand = 'no brand';
  List<String> imageUrls = [];

  List<String> categoriesList = ['no category'];
  List<String> brandsList = ['no brand'];

  //fetch brands and categories method.............................
  void fetchBrandsAndCategories() async {
    final rsList =
        await Future.wait([sl<FetchBrands>()(), sl<FetchCategories>()()]);

    final brandsRs = rsList[0];
    final categoriesRs = rsList[1];

    if (categoriesRs is DataSuccess) {
      List<CategoryEntity> categoryEntityList = categoriesRs.data;
      List<String> fetchedCategories = [];
      for (var element in categoryEntityList) {
        fetchedCategories.add(element.name);
      }
      setState(() {
        categoriesList = fetchedCategories;
      });
    }

    if (brandsRs is DataSuccess) {
      List<BrandEntity> brandEntityList = brandsRs.data;
      List<String> fetchedBrands = [];
      for (var element in brandEntityList) {
        fetchedBrands.add(element.name);
      }
      setState(() {
        brandsList = fetchedBrands;
      });
    }

    setState(() {
      isFetchingBrandsAndCategories = false;
    });
  }

  void addImage(String imgUrl) {
    setState(() {
      imageUrls.add(imgUrl);
    });
  }

//deleting uploaded image.........................................................
  void deleteUploadedImage(String url, BuildContext context) async {
    final Loader loader = Loader(context);
    //function for displaying success message when the request is successful.........................
    void showSuccessMessage(String msg) {
      showCustomSnackbar(context, content: msg, bgColor: Colors.green);
    }

    //function for displaying error message when the request is not successful.........................
    void showErrorMessage(String msg) {
      showCustomSnackbar(context, content: msg, bgColor: Colors.red.shade700);
    }

    loader.startLoading();
    final rs = await sl<DeleteProductImage>()(url);
    loader.stopLoading();
    if (rs is DataSuccess) {
      showSuccessMessage(rs.data as String);
      //removing the image from product images list.........
      imageUrls.removeWhere((element) => element == url);
      setState(() {
        imageUrls = imageUrls;
      });
      return;
    }

    showErrorMessage((rs as DataError).failure.message);
  }

//saving product to the database..................................................
  void saveProductToDatabase(BuildContext context) async {
    //loader class.........................
    final Loader loader = Loader(context);
    //function for displaying success message when the request is successful.........................
    void showSuccessMessage(String msg) {
      showCustomSnackbar(context, content: msg, bgColor: Colors.green);
    }

    //function for displaying error message when the request is not successful.........................
    void showErrorMessage(String msg) {
      showCustomSnackbar(context, content: msg, bgColor: Colors.red.shade700);
    }

    //last but not least...validation logic...............
    if (imageUrls.length < 3) {
      showCustomSnackbar(context,
          content: "You need to upload atleast 3 images of the product",
          bgColor: Colors.red.shade700);
      return;
    }

    //everything is alright ...............time to save the product to db
    final ProductEntity productEntity = ProductEntity(
        id: 'id_tobechangedbeforeuploading',
        title: _titleController.text,
        description: _descriptionController.text,
        pictures: imageUrls,
        price: double.parse(_priceController.text),
        category: selectedCategory,
        brand: selectedBrand,
        createdAt: DateTime.now().toString());

    loader.startLoading();
    final DataState rs = await sl<CreateProduct>()(productEntity);
    loader.stopLoading();
    if (rs is DataSuccess) {
      showSuccessMessage(rs.data as String);
      setState(() {
        //reset everything to leave a room for a new product...........
        _formKey.currentState!.reset();
        imageUrls = [];
      });
      return;
    }

    showErrorMessage((rs as DataError).failure.message);
  }

  @override
  void initState() {
    super.initState();
    fetchBrandsAndCategories();
  }

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
                          InkWell(
                            onTap: () =>
                                deleteUploadedImage(imageUrls[index], context),
                            child: body2('delete',
                                customStyle: TextStyle(
                                    color: Colors.red.withOpacity(0.7))),
                          ),
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
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      body1(
                        ' Title',
                        customStyle: TextStyle(color: Pallete.primary),
                      ),
                      vSpacing(10),
                      TextFormField(
                        controller: _titleController,
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter a title';
                          }

                          if (value.length < 4) {
                            return 'The title should be atleast 4 characters long.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Pallete.textPrimary)),
                          labelText: 'title....',
                        ),
                      ),
                      vSpacing(13),
                      body1(
                        'Price',
                        customStyle: TextStyle(color: Pallete.primary),
                      ),
                      vSpacing(10),
                      TextFormField(
                        controller: _priceController,
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter a price';
                          }

                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid price';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Pallete.textPrimary)),
                          labelText: 'Price.........',
                        ),
                      ),
                      vSpacing(13),
                      body1(
                        'Brief Description',
                        customStyle: TextStyle(color: Pallete.primary),
                      ),
                      vSpacing(10),
                      TextFormField(
                        controller: _descriptionController,
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter a description';
                          }

                          if (value.length < 150) {
                            return 'Too short, make it atleast 150 characters long';
                          }
                          return null;
                        },
                        maxLength: 300,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Pallete.textPrimary)),
                        ),
                      ),
                      vSpacing(13),
                      body1(
                        'Brand',
                        customStyle: TextStyle(color: Pallete.primary),
                      ),
                      vSpacing(5),
                      if (isFetchingBrandsAndCategories)
                        const SkeletonLoader(
                          width: double.infinity,
                          height: 50,
                        ),
                      if (!isFetchingBrandsAndCategories)
                        DropdownButton<String>(
                          isExpanded: true,
                          value: selectedBrand,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedBrand = newValue!;
                            });
                          },
                          items: brandsList
                              .map<DropdownMenuItem<String>>((String brand) {
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
                      if (isFetchingBrandsAndCategories)
                        const SkeletonLoader(
                          width: double.infinity,
                          height: 50,
                        ),
                      if (!isFetchingBrandsAndCategories)
                        DropdownButton<String>(
                          isExpanded: true,
                          value: selectedCategory,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue!;
                            });
                          },
                          items: categoriesList
                              .map<DropdownMenuItem<String>>((String category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          hint: const Text('Select a shoe category'),
                        ),
                      vSpacing(29),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            saveProductToDatabase(context);
                          }
                        },
                        child: const Text(
                          "Save Product",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  )),
              vSpacing(24),
            ],
          ),
        ),
      )),
    );
  }
}
