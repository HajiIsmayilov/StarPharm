import 'package:flutter/material.dart';
// import 'package:star_pharm/models/category.dart';
import 'package:star_pharm/tabs/home_tab.dart';
import 'package:star_pharm/widgets/product_cart.dart';
import '../shared/shared_strings.dart';

class ProductsCategory extends StatelessWidget {
  ProductsCategory({super.key});

  // final _products = [
  //   Category(
  //       title: 'Ginekoloji',
  //       imageUrl: 'https://biturbo.az/flutter/gynecology.png'),
  //   Category(
  //       title: 'Mədə-bağırsaq',
  //       imageUrl: 'https://biturbo.az/flutter/gastroenterology.png'),
  //   Category(
  //       title: 'Uşaqlar',
  //       imageUrl: 'https://biturbo.az/flutter/pediatrics.png'),
  //   Category(
  //       title: 'Urologiya', imageUrl: 'https://biturbo.az/flutter/urology.png'),
  //   Category(
  //       title: 'Cinsi', imageUrl: 'https://biturbo.az/flutter/sexology.png'),
  //   Category(
  //       title: 'Ümumi', imageUrl: 'https://biturbo.az/flutter/general.png'),
  //   Category(
  //       title: 'Dermatoloji',
  //       imageUrl: 'https://biturbo.az/flutter/dermatology.png'),
  //   Category(
  //       title: 'Psixoloji',
  //       imageUrl: 'https://biturbo.az/flutter/psychology.png')
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FittedBox(
          child: Text(
            SharedStrings.products,
            style: Theme.of(context).primaryTextTheme.headlineLarge,
          ),
        ),
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
                  border: Theme.of(context).inputDecorationTheme.border,
                  focusedBorder: Theme.of(context).inputDecorationTheme.border,
                  prefixIcon: const Icon(Icons.search),
                  hintText: SharedStrings.searchProduct,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(8.0),
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: const Expanded(
                      child: ProductCart(
                        imageUrl: 'https://biturbo.az/flutter/gynecology.png',
                        label: 'Ginekoloji',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: const Expanded(
                      child: ProductCart(
                        imageUrl:
                            'https://biturbo.az/flutter/gastroenterology.png',
                        label: 'Mədə-bağırsaq',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: const Expanded(
                      child: ProductCart(
                        imageUrl: 'https://biturbo.az/flutter/pediatrics.png',
                        label: 'Uşaqlar',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: const Expanded(
                      child: ProductCart(
                        imageUrl: 'https://biturbo.az/flutter/urology.png',
                        label: 'Urologiya',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: const Expanded(
                      child: ProductCart(
                        imageUrl: 'https://biturbo.az/flutter/sexology.png',
                        label: 'Cinsi',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: const Expanded(
                      child: ProductCart(
                        imageUrl: 'https://biturbo.az/flutter/general.png',
                        label: 'Ümumi',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: const Expanded(
                      child: ProductCart(
                        imageUrl: 'https://biturbo.az/flutter/dermatology.png',
                        label: 'Dermatoloji',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: const Expanded(
                      child: ProductCart(
                        imageUrl: 'https://biturbo.az/flutter/psychology.png',
                        label: 'Psixoloji',
                      ),
                    ),
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
