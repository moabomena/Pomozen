import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/contact_screen.dart';
import 'package:pomodoro_app/screens/help_support_screen.dart';
import 'package:pomodoro_app/widgets/drawer/custom_listile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../controllers/ux_controller.dart';
import '../../screens/home_screen.dart';
import '../../screens/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Drawer(
        elevation: 2,
        width: MediaQuery.of(context).size.width * 0.7,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                // decoration: BoxDecoration(color: Colors.blue),
                child: Text('')),
            const SizedBox(
              height: 40,
            ),
            CustomListTile(
                icon: indexPage.value == 0 ? Icons.home : Icons.home_outlined,
                title: AppLocalizations.of(context)!.home,
                indexSelect: 0,
                ontap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false);
                  setIndexPage(0);
                }),
            CustomListTile(
                icon: indexPage.value == 1
                    ? Icons.settings
                    : Icons.settings_outlined,
                title: AppLocalizations.of(context)!.settings,
                indexSelect: 1,
                ontap: () {
                  setHasDrawer(true);
                  setIndexPage(1);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                      (route) => false);
                }),
            const Divider(
              height: 20,
            ),
            CustomListTile(
                indexSelect: 2,
                icon: indexPage.value == 2
                    ? Icons.mail_rounded
                    : Icons.mail_outline_rounded,
                title: AppLocalizations.of(context)!.contactUs,
                ontap: () {
                  setIndexPage(2);
                  setHasDrawer(true);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactScreen()),
                      (route) => false);
                }),
            CustomListTile(
                indexSelect: 3,
                icon: indexPage.value == 3
                    ? Icons.info_rounded
                    : Icons.info_outline_rounded,
                title: AppLocalizations.of(context)!.about,
                ontap: () {
                  setIndexPage(3);
                  Navigator.of(context).pop();
                }),
            CustomListTile(
              indexSelect: 4,
              icon: indexPage.value == 4
                  ? Icons.help_rounded
                  : Icons.help_outline_sharp,
              title: AppLocalizations.of(context)!.helpsuport,
              ontap: () {
                setIndexPage(4);
                setHasDrawer(true);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HelpSupportScreen()),
                    (route) => false);
              },
            ),
            const Divider(
              height: 20,
            ),
            CustomListTile(
              indexSelect: 5,
              icon: indexPage.value == 5
                  ? Icons.receipt_long
                  : Icons.receipt_long_outlined,
              title: AppLocalizations.of(context)!.termsOfService,
              ontap: () {
                setIndexPage(5);
                Navigator.of(context).pop();
              },
            ),
            CustomListTile(
              indexSelect: 6,
              icon: indexPage.value == 6
                  ? Icons.privacy_tip_rounded
                  : Icons.privacy_tip_outlined,
              title: AppLocalizations.of(context)!.privacePolicy,
              ontap: () {
                setIndexPage(6);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
