import 'package:hive/hive.dart';
part 'notifModel.g.dart';

@HiveType(typeId: 33)
class NotificationModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String message;

  NotificationModel({this.title, this.message});
}
