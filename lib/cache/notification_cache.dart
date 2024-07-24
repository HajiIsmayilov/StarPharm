import 'package:hive_flutter/hive_flutter.dart';

import '../models/notification.dart';

class NotificationCache {
  final String name = 'notification';
  void add(NotificationModel notification) async {
    await Hive.initFlutter();
    await Hive.openBox(name);
    var hive = Hive.box(name);

    hive.put(notification.uuid, notification.toRawJson());
    hive.close();
  }

  Future<List> getData() async {
    await Hive.initFlutter();
    await Hive.openBox(name);

    var hive = Hive.box(name);
    var result = hive.values.toList();

    return result;
  }

  Future<void> remove(String uuid) async {
    await Hive.initFlutter();
    await Hive.openBox(name);

    var hive = Hive.box(name);

    hive.delete(uuid);
  }

  Future<void> removeAll() async {
    await Hive.initFlutter();
    await Hive.openBox(name);

    var hive = Hive.box(name);

    hive.clear();
  }

}
