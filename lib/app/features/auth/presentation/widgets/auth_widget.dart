import 'package:doctor_hunt/app/core/utils/image_assets.dart';
import 'package:doctor_hunt/app/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:otpin/otpin.dart';

class AuthWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> textFields;
  final Widget? privcyPolicy;
  final String textButton;
  final VoidCallback? onPressed;
  final String? forgotPasswordText;
  final VoidCallback? linkPressed;
  final String? linkText;
  final VoidCallback? forgotPasswordAction;
  final bool? googleSignInEnabled;
  //final double paddingLeft ;
  const AuthWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.textFields,
    this.onPressed,
    this.privcyPolicy,
    required this.textButton,
    this.forgotPasswordText,
    this.linkPressed,
    this.linkText,
    this.forgotPasswordAction,
    this.googleSignInEnabled,
    //required this.paddingLeft,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 70),
                  Text(title, style: context.bold24TextMain),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 10),
                    child: Text(
                      subtitle,
                      style: context.regular16TextPlaceholder,
                    ),
                  ),
                  if (textFields.isNotEmpty) const SizedBox(height: 40),
                  if (googleSignInEnabled == true)
                    GestureDetector(child: Image.asset(ImageAssets.google)),
                  if (textFields.isNotEmpty) const SizedBox(height: 5),
                  ...textFields,
                  if (textFields.isEmpty)
                    OTPin(
                      length: 4,
                      style: OrbitalStyle(),
                      // onCompleted: (code) async {
                      //   final isValid = await verifyOTP(code);
                      //   return isValid; // true → success animation, false → error animation
                      // },
                    ),
                  const SizedBox(height: 10),
                  if (privcyPolicy != null)
                    Column(
                      children: [privcyPolicy!, const SizedBox(height: 20)],
                    ),
                  //  const SizedBox(height: 10),
                  ButtonWidget(onPressed: onPressed, textButton: textButton),
                  if (forgotPasswordText != null)
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: forgotPasswordAction,
                          child: Text(
                            forgotPasswordText!,
                            style: context.regular16Primary,
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  if (linkPressed != null)
                    TextButton(
                      onPressed: linkPressed!,
                      child: Text(
                        linkText ?? '',
                        style: context.regular16Primary,
                      ),
                    ),
                  if (googleSignInEnabled == false) SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
