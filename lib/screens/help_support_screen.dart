import 'package:flutter/material.dart';
import 'package:Pomozen/responsive/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelpSupportScreen extends StatelessWidget {
  HelpSupportScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
          height: MediaQuery.of(context).size.height * floatingButtonHeight,
          width: MediaQuery.of(context).size.width * floatingButtonWidth,
          child: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height *
                          borderFloatingButton)),
              onPressed: () {
                formKey.currentState?.validate() == true
                    ? launchEmail(
                        toEmail: '1moabomena@gmail.com',
                        subject: subjectController.text,
                        message: messageController.text,
                        cleanTextFields: [
                            Future.delayed(const Duration(seconds: 2), () {
                              subjectController.clear();
                              messageController.clear();
                            })
                          ])
                    : null;
              },
              label: Text(
                AppLocalizations.of(context)!.submit,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height *
                        textSizeFloatingButton),
              ))),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helpsuport),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.suportText,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: subjectController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Titulo obrigatorio';
                    }
                    return null;
                  },
                  maxLines: null,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    // isDense: true,
                    icon: Icon(
                      Icons.edit_note_rounded,
                    ),
                    hintText: AppLocalizations.of(context)!.subjectText,
                    labelText: AppLocalizations.of(context)!.subject,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: messageController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Texto obrigatorio';
                    }
                    return null;
                  },
                  maxLines: null,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    // isDense: true,
                    icon: Icon(Icons.edit_note_rounded),
                    hintText: AppLocalizations.of(context)!.textHint,
                    labelText: AppLocalizations.of(context)!.text,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future launchEmail({
  required String toEmail,
  required String subject,
  required String message,
  required List<void> cleanTextFields,
}) async {
  final url =
      'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
  await launch(url);

  cleanTextFields.length;
}
