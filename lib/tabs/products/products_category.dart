import 'package:flutter/material.dart';
import '../../widgets/products/products_category.dart';
import '../../tabs/home_tab.dart';

class ProductsCategory extends StatelessWidget {
  const ProductsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Məhsullar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Məhsul axtar',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: CategoryCard(
                      imageUrl: 'https://biturbo.az/flutter/gynecology.png',
                      label: 'Ginekoloji',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: CategoryCard(
                      imageUrl:
                          'https://biturbo.az/flutter/gastroenterology.png',
                      label: 'Mədə-bağırsaq',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: CategoryCard(
                      imageUrl: 'https://biturbo.az/flutter/pediatrics.png',
                      label: 'Uşaqlar',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: CategoryCard(
                      imageUrl: 'https://biturbo.az/flutter/urology.png',
                      label: 'Urologiya',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: CategoryCard(
                      imageUrl: 'https://biturbo.az/flutter/sexology.png',
                      label: 'Cinsi',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: CategoryCard(
                      imageUrl: 'https://biturbo.az/flutter/general.png',
                      label: 'Ümumi',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: CategoryCard(
                      imageUrl: 'https://biturbo.az/flutter/dermatology.png',
                      label: 'Dermatoloji',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTab()),
                      );
                    },
                    child: CategoryCard(
                      imageUrl: 'https://biturbo.az/flutter/psychology.png',
                      label: 'Psixoloji',
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
