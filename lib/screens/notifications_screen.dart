import 'package:flutter/material.dart';
import 'package:star_pharm/cache/notification_cache.dart';
import 'package:star_pharm/models/notification.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                deleteAll();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: get(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return Card(
                        child: ListTile(
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(snapshot.data![index].text),
                        ),
                      );
                    }
                  });
            }),
      ),
    );
  }

  Future<List<NotificationModel>> get() async {
    NotificationCache cache = NotificationCache();
    var result = await cache.getData();
    return result.map((n) => NotificationModel.fromRawJson(n)).toList();
  }

  void deleteAll() async {
    NotificationCache cache = NotificationCache();
    cache.removeAll();
  }
}
