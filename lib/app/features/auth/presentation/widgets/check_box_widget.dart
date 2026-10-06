import 'package:doctor_hunt/app/core/themes/app_colors.dart';
import 'package:doctor_hunt/app/core/utils/app_string.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

// class CheckBoxWidget extends StatelessWidget {
//   final bool value;
//   final ValueChanged<bool?> onChanged;

//   const CheckBoxWidget({
//     super.key,
//     required this.value,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 15.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Checkbox(
//             value: value,
//             onChanged: onChanged,
//             activeColor: AppColors.primary,
//             checkColor: AppColors.textPlaceholder,
//           ),
//           Text(
//             AppStrings.privacyPolicy,
//             style: context.regular14TextPlaceholder,
//             softWrap: true,
//             maxLines: 2,
//           ),
//         ],
//       ),
//     );
//   }
// }

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: WidgetStatePropertyAll(
            AppColors.textPlaceholder.withValues(alpha: 0.3),
          ),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(
          AppStrings.privacyPolicy,
          style: context.regular14TextPlaceholder,
          softWrap: true,
          maxLines: 2,
        ),
      ],
    );
  }
}
