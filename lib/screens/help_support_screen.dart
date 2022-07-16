import 'package:flutter/material.dart';
import 'package:pomodoro_app/controllers/ux_controller.dart';
import 'package:pomodoro_app/widgets/drawer/custom_drawer.dart';
import 'package:pomodoro_app/widgets/drawer/willpop_callback.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportScreen extends StatelessWidget {
  HelpSupportScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPopCallback(context, 4),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
            height: 60,
            width: 120,
            child: FloatingActionButton.extended(
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
                label: const Text(
                  'Enviar',
                  style: TextStyle(fontSize: 18),
                ))),
        drawer: const CustomDrawer(),
        appBar: AppBar(
          leading: !hasDrawer.value
              ? IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back))
              : null,
          title: const Text('Help and support'),
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
                  const Text(
                    'send your feedback to me and i will answer you shortly',
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
                    decoration: const InputDecoration(
                      // isDense: true,
                      icon: Icon(
                        Icons.edit_note_rounded,
                      ),
                      hintText: 'write your subject here...',
                      labelText: 'Subject',
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
                    decoration: const InputDecoration(
                      // isDense: true,
                      icon: Icon(Icons.edit_note_rounded),
                      hintText: 'write your text here...',
                      labelText: 'Text',
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
