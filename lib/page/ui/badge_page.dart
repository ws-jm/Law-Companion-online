import 'package:ftv2/controller/badge_controller.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../resource/image.dart';
import '../../shared/common/state_status.dart';

class BadgePage extends GetView<BadgeController> {
  const BadgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText('Badge', 20, Colors.white),
        backgroundColor: appBarColor,
      ),
      body: Container(
        decoration: gradientColor(),
        child:Obx ( () =>controller.stateStatus == StateStatus.LOADING ?  const Center(
    child: CircularProgressIndicator(
    strokeWidth: 1),
    )
        :  GridView.builder(
          itemCount: controller.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 10,
              childAspectRatio: 1.8/3
            ),
            itemBuilder: (BuildContext context, int index){
            var point =  (int.parse(controller.data[index].packagePoint!.toString()) - int.parse(controller.data[index].userPoint!.toString())).toString();
              return InkWell(
                onTap: (){
                  Get.snackbar('${point.toString()} Point Required','');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    color: appBarColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(facebookImage,height: 50,width: 50),
                          const SizedBox(height: 10),
                          normalText(controller.data[index].userPoint!.toString(), 15, Colors.white),
                          const SizedBox(height: 5),
                          Text(
                            controller.data[index].name!,textAlign: TextAlign.center,
                            style: TextStyle(
                                color:  Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
