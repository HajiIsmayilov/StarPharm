import 'package:flutter/material.dart';
import 'package:star_pharm/models/category.dart';
import '../shared/shared_strings.dart';
import '../widgets/category_cart.dart';

class ProductsCategory extends StatelessWidget {
  ProductsCategory({super.key});

  final _products = [
    Category(
        title: 'Ginekoloji',
        imageUrl: 'https://biturbo.az/flutter/gynecology.png'),
    Category(
        title: 'Mədə-bağırsaq',
        imageUrl: 'https://biturbo.az/flutter/gastroenterology.png'),
    Category(
        title: 'Uşaqlar',
        imageUrl: 'https://biturbo.az/flutter/pediatrics.png'),
    Category(
        title: 'Urologiya', imageUrl: 'https://biturbo.az/flutter/urology.png'),
    Category(
        title: 'Cinsi', imageUrl: 'https://biturbo.az/flutter/sexology.png'),
    Category(
        title: 'Ümumi', imageUrl: 'https://biturbo.az/flutter/general.png'),
    Category(
        title: 'Dermatoloji',
        imageUrl: 'https://biturbo.az/flutter/dermatology.png'),
    Category(
        title: 'Psixoloji',
        imageUrl: 'https://biturbo.az/flutter/psychology.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(SharedStrings.products),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: SharedStrings.searchProduct,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) =>
                      CategoryCard(
                        imageUrl: _products[index].imageUrl,
                        label: _products[index].title,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
