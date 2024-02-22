import 'package:flutter/material.dart';
import 'package:speed_vision/constant/app_images.dart';
import 'package:speed_vision/constant/color_palete.dart';
import 'package:speed_vision/constant/spacing.dart';
import 'package:speed_vision/constant/typography.dart';
import 'package:speed_vision/shared/custom_buttons.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:get/get.dart';

class EmailSentView extends StatefulWidget {
  static const String id = '/email-sent';

  const EmailSentView({super.key});

  @override
  State<EmailSentView> createState() => _EmailSentViewState();
}

class _EmailSentViewState extends State<EmailSentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const VerticalSpacing(15),
              GestureDetector(
                onTap: ()=> Navigator.pop(context),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.close, color: Colors.white),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: ColorPalette.whiteColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        Images.email,
                        width: 60,
                        height: 60,
                        color: Colors.white,
                      ),
                    ),
                    const VerticalSpacing(30),
                    Text('Check your mail', style: poppinsBold.copyWith(fontSize: 20, color: Colors.white)),
                    const VerticalSpacing(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'We have sent a password recover instruction to your email',
                        style: poppinsRegular.copyWith(fontSize: 15, color: ColorPalette.greyShade600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const VerticalSpacing(40),
                    CustomElevatedButton(
                      width: 200,
                      textStyle: poppinsRegular.copyWith(fontSize: 14, color: Colors.white),
                      onPressed: () async {
                        var result = await OpenMailApp.openMailApp();

                        if (mounted) {
                          /// If no mail apps found, show error
                          if (!result.didOpen && !result.canOpen) {
                            Get.showSnackbar(
                              const GetSnackBar(
                                message: 'No mail app found!',
                              ),
                            );

                            /// iOS: if multiple mail apps found, show dialog to select.
                            /// There is no native intent/default app system in iOS so
                            /// you have to do it yourself.
                          } else if (!result.didOpen && result.canOpen) {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return MailAppPickerDialog(
                                  mailApps: result.options,
                                );
                              },
                            );
                          }
                        }
                      },
                      title: 'Open email app',
                    ),
                    const VerticalSpacing(50),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
