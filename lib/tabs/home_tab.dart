import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/category.dart';
import '../models/post.dart';
import '../widgets/doctor_card.dart';
import '../widgets/category_cart.dart';
import '../widgets/post_cart.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  static const String _username = 'Dr. Anar';

  Future<List<Doctor>> fetchDoctors() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/33ba52ce-a103-4cd7-b056-56d2ba31e22f'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((doctor) => Doctor.fromJson(doctor)).toList();
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  final List<Category> _categories = [
    Category(
        title: 'Həkimlər', imageUrl: 'https://biturbo.az/flutter/doctor.png'),
    Category(
        title: 'Təqvim', imageUrl: 'https://biturbo.az/flutter/calendar.png'),
    Category(
        title: 'Suallar',
        imageUrl: 'https://biturbo.az/flutter/question-mark.png'),
    Category(
        title: 'Məhsullar', imageUrl: 'https://biturbo.az/flutter/drugs.png')
  ];

  final List<Post> _posts = [
    Post(
      title: 'Allergik rinitin nədir və əlamətləri hansılardır?',
      authors: 'MBBS, BCS',
      views: 1250,
      imageUrl:
          'https://static.vecteezy.com/system/resources/thumbnails/028/287/555/small_2x/an-indian-young-female-doctor-isolated-on-green-ai-generated-photo.jpg',
    ),
    Post(
      title: 'Qida allergiyasının ən effektiv müalicəsi',
      authors: 'MBBS, BCS',
      views: 1250,
      imageUrl:
          'https://static.vecteezy.com/system/resources/thumbnails/028/287/555/small_2x/an-indian-young-female-doctor-isolated-on-green-ai-generated-photo.jpg',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {},
        ),
        title: const Text('${HomeTabStrings.welcome} $_username'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: HomeTabStrings.searchKeyHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 98,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) => Container(
                    constraints: const BoxConstraints(minWidth: 94),
                    child: CategoryCard(
                        imageUrl: _categories[index].imageUrl,
                        label: _categories[index].title),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                HomeTabStrings.peadiatrs,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 185,
              child: FutureBuilder<List<Doctor>>(
                future: fetchDoctors(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data!.map((doctor) {
                        return DoctorCard(
                          name: doctor.name,
                          hospital: doctor.hospital,
                          imageUrl: doctor.imageUrl,
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                HomeTabStrings.newPosts,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                height: 270,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _posts.length,
                    itemBuilder: (context, index) => SizedBox(
                          width: 240,
                          child: PostCard(
                            imageUrl: _posts[index].imageUrl,
                            title: _posts[index].title,
                            authors: _posts[index].authors,
                            views: _posts[index].views,
                          ),
                        ))),
          ],
        ),
      ),
    );
  }
}

class HomeTabStrings {
  static const String welcome = 'Xoş gəlmisiniz, ';
  static const String searchKeyHint = 'Axtarış üçün açar sözü daxil edin..';
  static const String peadiatrs = 'Pediatrlar';
  static const String newPosts = 'Yeni paylaşımlar';
}
