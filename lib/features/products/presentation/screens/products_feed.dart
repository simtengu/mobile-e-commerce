import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/horizontal_spacing.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/products/presentation/screens/product_search.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/product_card.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/top_brands.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/top_categories.dart';
import 'package:flutter/material.dart';

class ProductsFeedScreen extends StatefulWidget {
  
  const ProductsFeedScreen({Key? key}) : super(key: key);

  @override
  State<ProductsFeedScreen> createState() => _ProductsFeedScreenState();
}

class _ProductsFeedScreenState extends State<ProductsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
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
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const TopBar(),
              const SearchInput(),
              const PromoCard(),
              const Headline(
                title: "Top Categories",
                subtitle: "browse some of our best shoes",
              ),
              const TopCategoriesSection(),
              const Headline(
                title: "Top Brands",
                subtitle: "get shoes from the best brands",
              ),
              const TopBrandsSection(),
              vSpacing(17),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: body1(
                  "New Arrival",
                  customStyle: TextStyle(
                      color: Pallete.primaryDark, fontWeight: FontWeight.bold),
                ),
              ),
              vSpacing(15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.77,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: productList
                      .map((product) => ProductCard(
                          title: product["title"]!,
                          price: product["price"]!,
                          imgUrl: product["imgUrl"]!))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(
        "Find your\nfavorite shoes",
        style: TextStyle(
            color: Pallete.secondary,
            fontSize: 33,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, left: 25.0, right: 25.0, bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProductSearchScreen(),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Pallete.primaryLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: body1('Search....',
                      customStyle: TextStyle(color: Pallete.secondary)),
                ),
              ),
            ),
          ),
          hSpacing(7),
          Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Pallete.primaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.tune,
              color: Pallete.secondary,
            ),
          )
        ],
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              Pallete.primary.withOpacity(.6),
              Pallete.primaryDark.withOpacity(.8)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Stack(
          children: [
            Opacity(
              opacity: .5,
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/BACKGROUND%202.png?alt=media&token=0d003860-ba2f-4782-a5ee-5d5684cdc244",
                  fit: BoxFit.cover),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0).copyWith(left: 17),
                child: Image.asset(
                  "${AppConstants.imgPath}shoes.png",
                  width: MediaQuery.of(context).size.width * .3,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0).copyWith(right: 32),
                child: const Text(
                  "Your Offer\n40% Off",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  final String title, subtitle;
  const Headline({super.key, required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          body1(
            title,
            customStyle: TextStyle(
                color: Pallete.primaryDark, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                color: Pallete.secondary,
              ))
        ],
      ),
    );
  }
}
