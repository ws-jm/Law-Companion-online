import 'package:flutter/material.dart';
import 'package:ftv2/controller/notification_controller.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:get/get.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText('Notification', 20, Colors.white),
        backgroundColor: appBarColor,
      ),
      body: Container(
        decoration: gradientColor(),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context,int index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: appBarColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        normalText('Title', 15, Colors.white),
                        const SizedBox(height: 10,),
                        normalText('descripation descripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripationdescripation',
                            15, Colors.white),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
