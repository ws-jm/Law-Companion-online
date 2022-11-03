import 'package:ftv2/controller/payment_controller.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,width: Get.width,
        decoration: gradientColor(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: Get.height/10,),
              normalText('Your subscription has expired, to extend your subscription, kindly follow these instructions:', 16, Colors.white),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.launchWhatsApp();
                    },
                    child: Container(
                      height: 50,width: Get.width/2.5,
                      color: Colors.blueGrey,
                      child: Center(child: normalText('CLICK HERE FIRST', 16, Colors.white)),
                    ),
                  ),
                  // Container(
                  //   height: 50,width: Get.width/2.5,
                  //   color: Colors.blueGrey,
                  //   child: Center(child: normalText('GO TO OFFLINE', 16, Colors.white)),
                  // ),
                ],
              ),
              SizedBox(height: 20,),
              normalText('Then, pay the sum of N15,000 (Ten Thousand Naira) to Funmilayo A. Quadri &amp; Co', 15, Colors.white),
              SizedBox(height: 20,),
              normalText('012304749', 15, Colors.white),
              SizedBox(height: 20,),
              normalText('GTBank', 15, Colors.white),
              SizedBox(height: 20,),
              boldText('For more enquiries, call:', 15, Colors.white),
              SizedBox(height: 30,),
              normalText('08170000662', 15, Colors.white),
              SizedBox(height: 30,),
              normalText('info@funmiquadrionline.com', 15, Colors.white),

            ],
          ),
        ),
      ),
    );
  }
}
