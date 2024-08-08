import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:star_pharm/cache/notification_cache.dart';
import 'package:star_pharm/models/notification.dart';
import 'package:star_pharm/widgets/slidable_card.dart';

import '../shared/shared_strings.dart';

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
        title: Text(
          SharedStrings.notifications,
          style: Theme.of(context).primaryTextTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              deleteAll();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: NotificationCache().listener(),
        builder: (context, value, child) {
          var list = getList(value);
          return Padding(
            padding: EdgeInsets.all(12),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(
                    list.length, (index) => _buildCard(list, index)),
              ),
            ),
          );
        },
      )),
    );
  }

  Widget _buildCard(List<NotificationModel> list, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: SlidableCard(
          card: Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              title: Text(list[index].title),
              subtitle: Text(list[index].text),
            ),
          ),
          icon: const Icon(
            Icons.delete_sweep,
            size: 32,
            color: Colors.red,
          ),
          onSlided: () {
            delete(list[index]);
          }),
    );
  }

  List<NotificationModel> getList(Box<dynamic> box) {
    List list = box.values.toList();
    return list.map((n) => NotificationModel.fromRawJson(n)).toList();
  }

  void delete(NotificationModel notification) {
    NotificationCache().remove(notification);
  }

  void deleteAll() {
    NotificationCache().removeAll();
  }
}
