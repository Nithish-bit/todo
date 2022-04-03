import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo/app/global_widgets/proceed_button.dart';
import 'package:todo/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:todo/app/modules/welcome/views/login_view.dart';
import 'package:todo/app/theme/color_theme.dart';
import 'package:todo/app/theme/text_theme.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding:
            EdgeInsets.only(top: size.height * 0.08, left: size.width * 0.06),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/taskly_logo.svg',
                  height: size.height * 0.05,
                ),
                SizedBox(width: size.width * 0.03),
                Text(
                  'TODO',
                  style: kSub2HeadTextStyle.copyWith(
                    color: primaryDGrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.035),
            Text(
              'Professionals\' life is a Mess',
              style: kHeadTextStyle.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: primaryDGrey,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              'Get Organized',
              style: kSub2HeadTextStyle.copyWith(
                color: primaryDGrey,
              ),
            ),
            SizedBox(height: size.height * 0.045),
            SvgPicture.asset(
              'assets/icons/laptopPerson2.svg',
              height: size.height * 0.5,
            ),
            SizedBox(height: size.height * 0.07),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                // size: Get.size,
                onPressed: () {
                  print('object');
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => LoginView(),
                  //     ));
                  Get.to(
                    () => LoginView(),
                    transition: Transition.rightToLeft,
                  );
                },
                child: Text('Start'),
                // title: 'Start',
              ),
            )
          ],
        ),
      ),
    );
  }
}
