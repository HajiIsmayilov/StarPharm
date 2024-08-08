import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:star_pharm/cache/notification_cache.dart';
import 'package:star_pharm/models/notification.dart';
import 'package:star_pharm/widgets/slidable_card.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                deleteAll();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: NotificationCache().listener(),
        builder: (context, value, child) {
          var list = getList(value);
          return Column(
            children: List.generate(
              list.length,
              (index) => SlidableCard(
                  card: Card(
                    child: ListTile(
                      title: Text(list[index].title),
                      subtitle: Text(list[index].text),
                    ),
                  ),
                  icon: const Icon(
                    Icons.delete_sweep,
                    size: 32,
                    color: Colors.white,
                  ),
                  onSlided: () {
                    print('Slided');
                  }),
            ),
          );
        },
      )),
    );
  }

  List<NotificationModel> getList(Box<dynamic> box) {
    List list = box.values.toList();
    return list.map((n) => NotificationModel.fromRawJson(n)).toList();
  }

  void deleteAll() async {
    NotificationCache cache = NotificationCache();
    cache.removeAll();
  }
}
