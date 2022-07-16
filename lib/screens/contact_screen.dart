import 'package:flutter/material.dart';
import 'package:pomodoro_app/controllers/ux_controller.dart';
import 'package:pomodoro_app/widgets/contact_tile.dart';
import 'package:pomodoro_app/widgets/drawer/custom_drawer.dart';
import 'package:pomodoro_app/widgets/drawer/willpop_callback.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPopCallback(context, 2),
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          leading: !hasDrawer.value
              ? IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back))
              : null,
          title: const Text('Contact us'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  ContactTile(
                    title: 'Facebook',
                    subTitle: 'Moab Omena',
                    pathSvg: 'assets/images/brand_facebook.svg',
                    isBackground: true,
                  ),
                  ContactTile(
                    title: 'Instagram',
                    subTitle: '@moabomen',
                    pathSvg: 'assets/images/brand_instagram.svg',
                    isContained: true,
                    isGradientColorContainer: true,
                    gradientColorPrimary: Color(0xff833AB4),
                    gradientColorSecondary: Color(0xffE1306C),
                    gradientColorTertiary: Color(0xffF56040),
                    gradientColorQuaternary: Color(0xffFCAF45),
                  ),
                  ContactTile(
                    title: 'Linkedin',
                    subTitle: 'moab_omena',
                    pathSvg: 'assets/images/brand_linkedin.svg',
                    colorSvg: Colors.white,
                    isContained: true,
                    colorContainer: Color(0xff0e76a8),
                  ),
                  ContactTile(
                    title: 'Twitter',
                    subTitle: '@moabome',
                    pathSvg: 'assets/images/brand_twitter.svg',
                    isContained: true,
                    colorContainer: Color(0xff00acee),
                  ),
                  ContactTile(
                    title: 'Github',
                    isContrast: true,
                    subTitle: 'moabomena',
                    pathSvg: 'assets/images/brand_github.svg',
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
