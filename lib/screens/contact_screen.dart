import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/contact_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.contactUs),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
/*                 ContactTile(
                  title: 'Facebook',
                  subTitle: 'moabomena',
                  pathSvg: 'assets/images/brand_facebook.svg',
                  isBackground: true,
                  url:
                      "https://www.facebook.com/profile.php?id=100008947051777",
                ), */
                ContactTile(
                  title: 'Instagram',
                  subTitle: 'moabomena',
                  pathSvg: 'assets/images/brand_instagram.svg',
                  isContained: true,
                  isGradientColorContainer: true,
                  gradientColorPrimary: Color(0xff833AB4),
                  gradientColorSecondary: Color(0xffE1306C),
                  gradientColorTertiary: Color(0xffF56040),
                  gradientColorQuaternary: Color(0xffFCAF45),
                  url: "https://www.instagram.com/moabomena/",
                ),
                ContactTile(
                  title: 'Linkedin',
                  subTitle: 'Moab Omena',
                  pathSvg: 'assets/images/brand_linkedin.svg',
                  colorSvg: Colors.white,
                  isContained: true,
                  colorContainer: Color(0xff0e76a8),
                  url: "https://www.linkedin.com/in/moab-omena-93450715a/",
                ),
                ContactTile(
                  title: 'Twitter',
                  subTitle: '@Moab_Omena',
                  pathSvg: 'assets/images/brand_twitter.svg',
                  isContained: true,
                  colorContainer: Color(0xff00acee),
                  url: "https://twitter.com/Moab_Omena",
                ),
                ContactTile(
                  title: 'Github',
                  isContrast: true,
                  subTitle: 'moabomena',
                  pathSvg: 'assets/images/brand_github.svg',
                  url: "https://github.com/moabomena",
                ),
              ]),
        ),
      ),
    );
  }
}
