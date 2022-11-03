import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controller/login_controller.dart';
import '../../resource/image.dart';
import '../../route/route.dart';
import '../widget/all_widget.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: backgroundColor,
        body:Container(
          decoration: gradientColor(),
          child: Stack(
            children: [
              ClipRRect(
                  child: Image.asset(login_back,   fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    normalText("FUNMI QUADRI (SAN) & CO.",16,Colors.white),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: (){
                        controller.loginApi();
                        // Get.toNamed(AppRoute.home);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(30.0),
                        padding: const EdgeInsets.all(15.0),
                        decoration:BoxDecoration(border: Border.all(color:Colors.white),  borderRadius: const BorderRadius.all(
                            Radius.circular(8.0)
                        ),),
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 18.0,color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            normalText("Don't have an Account?",16,Colors.white),
                            const SizedBox(height: 15),
                            InkWell(
                                onTap: (){
                                  Get.toNamed(AppRoute.register);
                                },
                                child: boldText('REGISTER NOW',16,Colors.white)),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
