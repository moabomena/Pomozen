import 'package:flutter/material.dart';
import 'package:pomodoro_app/responsive/dimensions.dart';
import 'package:pomodoro_app/screens/about_screen.dart';
import 'package:pomodoro_app/screens/contact_screen.dart';
import 'package:pomodoro_app/screens/help_support_screen.dart';
import 'package:pomodoro_app/screens/use_licenses.dart';
import 'package:pomodoro_app/widgets/drawer/custom_listile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../controllers/ux_controller.dart';
import '../../screens/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(32), bottomRight: Radius.circular(32)),
      child: Drawer(
        elevation: 2,
        width: MediaQuery.of(context).size.width * customDrawerWidth,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
        ),
        child: ValueListenableBuilder(
            valueListenable: indexPage,
            builder: (BuildContext context, value, _) {
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(child: Text('')),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        customDrawerSizedBoxHeight,
                  ),
                  CustomListTile(
                      icon: value == 0 ? Icons.home : Icons.home_outlined,
                      title: AppLocalizations.of(context)!.home,
                      indexSelect: 0,
                      ontap: () {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          setIndexPage(0);
                        });
                        Navigator.of(context).pop();
                      }),
                  CustomListTile(
                      icon:
                          value == 1 ? Icons.settings : Icons.settings_outlined,
                      title: AppLocalizations.of(context)!.settings,
                      indexSelect: 1,
                      ontap: () {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          setIndexPage(1);
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const SettingsPage()));
                      }),
                  Divider(
                    height: MediaQuery.of(context).size.height *
                        customDrawerDividerHeight,
                  ),
                  CustomListTile(
                      indexSelect: 2,
                      icon: value == 2
                          ? Icons.mail_rounded
                          : Icons.mail_outline_rounded,
                      title: AppLocalizations.of(context)!.contactUs,
                      ontap: () {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          setIndexPage(2);
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const ContactScreen()));
                      }),
                  CustomListTile(
                      indexSelect: 3,
                      icon: value == 3
                          ? Icons.info_rounded
                          : Icons.info_outline_rounded,
                      title: AppLocalizations.of(context)!.about,
                      ontap: () {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          setIndexPage(3);
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const AboutScreen()));
                      }),
                  CustomListTile(
                    indexSelect: 4,
                    icon: value == 4
                        ? Icons.help_rounded
                        : Icons.help_outline_sharp,
                    title: AppLocalizations.of(context)!.helpsuport,
                    ontap: () {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setIndexPage(4);
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => HelpSupportScreen()));
                    },
                  ),
                  Divider(
                    height: MediaQuery.of(context).size.height *
                        customDrawerDividerHeight,
                  ),
                  CustomListTile(
                    indexSelect: 5,
                    icon: value == 5
                        ? Icons.receipt_long
                        : Icons.receipt_long_outlined,
                    title: AppLocalizations.of(context)!.useLicense,
                    ontap: () {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setIndexPage(5);
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const UseLicenseScreen()));
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
