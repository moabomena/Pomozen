import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomodoro_app/controllers/theme_controller.dart';
import 'package:pomodoro_app/responsive/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactTile extends StatelessWidget {
  const ContactTile(
      {this.title,
      this.subTitle,
      this.pathSvg,
      this.colorSvg,
      this.isContained = false,
      this.colorContainer,
      this.isGradientColorContainer = false,
      this.gradientColorPrimary,
      this.gradientColorSecondary,
      this.gradientColorTertiary,
      this.gradientColorQuaternary,
      this.isBackground = false,
      this.isContrast = false,
      this.url,
      Key? key})
      : super(key: key);

  final String? title;
  final String? subTitle;
  final String? pathSvg;
  final Color? colorSvg;
  final bool isContained;
  final Color? colorContainer;
  final Color? gradientColorPrimary;
  final Color? gradientColorSecondary;
  final Color? gradientColorTertiary;
  final Color? gradientColorQuaternary;
  final bool isGradientColorContainer;
  final bool isBackground;
  final bool isContrast;
  final String? url;

  @override
  Widget build(BuildContext context) {
    final Uri urls = Uri.parse(url!);

    Future<void> _launchUrl() async {
      if (!await launch(urls.toString())) {
        throw 'Could not launch $urls';
      }
    }

    return InkWell(
      onTap: _launchUrl,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              isContained
                  ? Container(
                      padding: const EdgeInsets.all(8),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          gradient: isGradientColorContainer
                              ? LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: const [
                                      0.1,
                                      0.4,
                                      0.6,
                                      0.9,
                                    ],
                                  colors: [
                                      gradientColorPrimary!,
                                      gradientColorSecondary!,
                                      gradientColorTertiary!,
                                      gradientColorQuaternary!,
                                    ])
                              : null,
                          color:
                              isGradientColorContainer ? null : colorContainer,
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        pathSvg!,
                        color: colorSvg,
                      ),
                    )
                  : isBackground && modeDark.value
                      ? Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                            ),
                            SvgPicture.asset(
                              pathSvg!,
                              color: colorSvg,
                              height: 50,
                              width: 50,
                            ),
                          ],
                        )
                      : SvgPicture.asset(
                          pathSvg!,
                          color: isContrast && modeDark.value
                              ? Colors.white
                              : colorSvg,
                          height: 50,
                          width: 50,
                        ),
              SizedBox(
                // width: 20,
                width: MediaQuery.of(context).size.width *
                    contactTileSizedBoxWidth,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height *
                            contactTileFontSizeTitle),
                  ),
                  Text(
                    subTitle!,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height *
                            contactTileFontSizeSubtitle),
                  )
                ],
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
          )
        ]),
      ),
    );
  }
}
