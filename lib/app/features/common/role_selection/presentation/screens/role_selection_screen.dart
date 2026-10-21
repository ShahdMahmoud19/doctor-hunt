import 'package:doctor_hunt/app/core/router/app_route.dart';
import 'package:doctor_hunt/app/core/utils/image_assets.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/button_widget.dart';
import 'package:doctor_hunt/app/features/common/role_selection/presentation/widgets/role_selection_card.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/translations/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? selectedWho;

  void continueToNextScreen() {
    if (selectedWho == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a role first.')),
      );
      return;
    }

    if (selectedWho == 'patient') {
      Navigator.pushReplacementNamed(context, AppRoute.login);
    } else if (selectedWho == 'admin') {
      Navigator.pushReplacementNamed(context, AppRoute.adminLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AppGradientBackground(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset(ImageAssets.logo),
                  Gap(40),
                  Text(t.role.chooseRole, style: context.regular28TextMain),
                  Gap(10),
                  Text(
                    t.role.subTitle,
                    style: context.regular16TextPlaceholder,
                  ),
                  Gap(20),
                  RoleSelectionCard(
                    icon: Icons.personal_injury_outlined,
                    title: t.role.patient,
                    subTitle: t.role.patientSub,
                    onTap: () {
                      setState(() {
                        selectedWho = 'patient';
                      });
                    },
                    isSelected: selectedWho == 'patient',
                  ),
                  Gap(15),
                  RoleSelectionCard(
                    icon: Icons.dashboard_outlined,
                    title: t.role.admin,
                    subTitle: t.role.adminSub,
                    onTap: () {
                      setState(() {
                        selectedWho = 'admin';
                      });
                    },
                    isSelected: selectedWho == 'admin',
                  ),
                  Gap(100),
                  ButtonWidget(
                    textButton: t.common.continueText,
                    onPressed: continueToNextScreen,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
