import 'package:doctor_hunt/app/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class RoleSelectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final bool isSelected;
  const RoleSelectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: isSelected ? AppColors.secondary : AppColors.textBorders,
          ),
        ),
        child: ListTile(
          leading: Card(
            color: isSelected ? AppColors.white : AppColors.lightGrey,
            child: Icon(
              icon,
              size: 30,
              color: isSelected ? AppColors.secondary : AppColors.grey,
            ),
          ),
          title: Text(title, style: context.bold18TextMain),
          subtitle: Text(subTitle, style: context.regular16TextPlaceholder),
          trailing: Icon(
            Icons.check_circle,
            size: 30,
            color: isSelected ? AppColors.secondary : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
