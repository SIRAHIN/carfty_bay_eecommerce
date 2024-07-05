import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItemSection extends StatelessWidget {
  const CategoryItemSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: AppColors.primaryColor.withOpacity(0.1),
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.computer,
              color: AppColors.primaryColor,
              size: 35,
            ),
          ),
        ),
        const Text(
          'Electronic',
          style: TextStyle(
              fontSize: 15,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}