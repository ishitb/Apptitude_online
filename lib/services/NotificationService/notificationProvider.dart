import 'package:Apptitude_online/services/NotificationService/notifModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class NotificationProvider extends ChangeNotifier {
  static const _boxName = 'NotificationBox';
  List<NotificationModel> _notifModel = [];

  void getNotes() async {
    var box = await Hive.openBox<NotificationModel>(_boxName);
    _notifModel = box.values.toList();
    notifyListeners();
  }

  Future<List<NotificationModel>> getNotifList() async {
    var box = await Hive.openBox<NotificationModel>(_boxName);
    _notifModel = box.values.toList();
    return _notifModel;
  }

  NotificationModel getNote(index) {
    return _notifModel[index];
  }

  void addNotif(NotificationModel notif) async {
    var box = await Hive.openBox<NotificationModel>(_boxName);
    await box.add(notif);
    _notifModel = box.values.toList();
    notifyListeners();
  }

  void deleteNotif(key) async {
    var box = await Hive.openBox<NotificationModel>(_boxName);
    await box.delete(key);
    _notifModel = box.values.toList();
    notifyListeners();
  }

  int get notifCount {
    return _notifModel.length;
  }
}
