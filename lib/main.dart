import 'package:flutter/material.dart';
import 'package:Pomozen/controllers/intl_controller.dart';
import 'package:Pomozen/controllers/theme_controller.dart';
import 'package:Pomozen/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:Pomozen/theme/themes_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: modeDark,
        builder: (BuildContext context, bool themeDark, _) {
          return ValueListenableBuilder(
            valueListenable: intl,
            builder: (_, value, __) {
              return MaterialApp(
                title: 'Flutter Demo',
                locale: Locale(intl.value),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: const [
                  Locale('en'),
                  Locale('es'),
                  Locale('pt')
                ],
                debugShowCheckedModeBanner: false,
                theme: themeDark ? darkTheme : lightTheme,
                themeMode: ThemeMode.system,
                home: const Home(),
              );
            },
          );
        });
  }
}
