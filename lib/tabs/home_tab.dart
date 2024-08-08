import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_pharm/services/post_service.dart';
import 'dart:convert';

import '../models/post.dart';
import '../routes/route.dart';
import '../shared/shared_strings.dart';
import '../widgets/doctor_card.dart';
import '../widgets/category_cart.dart';
import '../widgets/post_cart.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  static const String _username = 'Dr. Anar';
  final BoxConstraints _constraint = const BoxConstraints(minWidth: 96);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {},
        ),
        title: Text(
          '${SharedStrings.welcome} $_username',
          style: Theme.of(context).primaryTextTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).pushNamed(RoutePath.notification);
            },
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
                  border: Theme.of(context).inputDecorationTheme.border,
                  focusedBorder: Theme.of(context).inputDecorationTheme.border,
                  prefixIcon: const Icon(Icons.search),
                  hintText: SharedStrings.searchKeyHint,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          constraints: _constraint,
                          child: const CategoryCard(
                              imageUrl: 'https://biturbo.az/flutter/doctor.png',
                              label: 'Həkimlər')),
                      // Container(
                      //     constraints: _constraint,
                      //     child: const CategoryCard(
                      //         imageUrl:
                      //             'https://biturbo.az/flutter/calendar.png',
                      //         label: 'Təqvim')),
                      Container(
                          constraints: _constraint,
                          child: const CategoryCard(
                              imageUrl:
                                  'https://biturbo.az/flutter/question-mark.png',
                              label: 'Suallar')),
                      Container(
                          constraints: _constraint,
                          child: const CategoryCard(
                              imageUrl: 'https://biturbo.az/flutter/drugs.png',
                              label: 'Məhsullar')),
                    ],
                  ),
                )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                SharedStrings.peadiatrs,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3448,
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
                SharedStrings.newPosts,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 294,
              child: FutureBuilder<List<Post>?>(
                future: PostService().fetchPostAsync(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView(
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data!
                            .map((post) => SizedBox(
                                  width: 240,
                                  child: PostCard(post: post),
                                ))
                            .toList());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
