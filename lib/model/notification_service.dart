import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi{

  final _notification =  FlutterLocalNotificationsPlugin();

  //  AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('@mipmap/ic_launcher');

  //    InitializationSettings initializationSettings =
  //       InitializationSettings(
  //     android: initializationSettingsAndroid,
  //   );

  //   await flutterLocalNotificationsPlugin.initialize(
  //     initializationSettings,
  //   );

Future notificationDetails(bigpicturepath)async{
final styleInformation = BigPictureStyleInformation(FilePathAndroidBitmap(bigpicturepath),

);


  return  NotificationDetails(
    android: AndroidNotificationDetails(
      
      "channelId",
       "channelName",
       channelDescription:"channelDescription"  ,
       importance: Importance.max,
       styleInformation: styleInformation,
       ),
    iOS: const IOSNotificationDetails()
  );

}




   Future showNofication({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    String? image,
  })async=>
  _notification.show(
    
    id,
     title,
      body,
      await notificationDetails(image),
      payload: payload,
      );




}





// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//   void notification(String? title, String? body,String url) async {
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//     );

//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//         'high_channel', 'High Importance Notification',
//         description: "This channel is for important notification",
//         importance: Importance.max);
// final styleInformation = BigPictureStyleInformation(
//     const DrawableResourceAndroidBitmap('notification'),
//     // largeIcon:  DrawableResourceAndroidBitmap(url),
//     contentTitle: title,
//     summaryText: body,
//   );
//     flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(channel.id, channel.name,
//             channelDescription: channel.description,largeIcon: FilePathAndroidBitmap(url)),
//       ),
      
//     );
//     flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(channel.id, channel.name,styleInformation:styleInformation,
//             channelDescription: channel.description, ),
//       ),
//     );
    
//   }

//  Future<void> cancelNotification() async {
//    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//     await flutterLocalNotificationsPlugin.cancel(0);
//   }