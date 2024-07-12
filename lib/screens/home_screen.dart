import 'package:flutter/material.dart';
import '../tabs/home_tab.dart';
import '../tabs/search_tab.dart';
import '../tabs/products/products_category.dart';
import '../tabs/qa_tab.dart';
import '../tabs/account_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    const SearchTab(),
    const ProductsCategory(),
    QATab(),
    AccountTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: _bottomNavigationBar(),
        ),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Əsas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Axtarış',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Məhsullar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer),
          label: 'Sual-Cavab',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Hesab',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(color: Colors.blue),
      unselectedLabelStyle: const TextStyle(color: Colors.black),
    );
  }
}
