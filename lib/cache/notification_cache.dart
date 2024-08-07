import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/notification.dart';

class NotificationCache {
  final String name = 'notification';
  static late Box<dynamic>? hive;

  void init() async {
    await Hive.initFlutter();
    await Hive.openBox(name);
    hive = Hive.box(name);
  }

  void add(NotificationModel notification) {
    hive!.put(notification.uuid, notification.toRawJson());
  }

  ValueListenable<Box<dynamic>> listener() {
    return Hive.box(name).listenable();
  }

  List getData() {
    return hive!.values.toList();
  }

  void remove(String uuid) {
    hive!.delete(uuid);
  }

  void removeAll() {
    hive!.clear();
  }

  void close() {
    hive!.close();
  }
}
