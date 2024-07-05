import 'package:flutter/material.dart';


class SectionLevelText extends StatelessWidget {
  
  final String titleText;
  final String btnTitleText;
  final VoidCallback? onTap;
 
  const SectionLevelText({
    super.key, required this.titleText,  required this.btnTitleText,  this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TextButton(
            onPressed: onTap,
            child: Text(
              btnTitleText,
              style: Theme.of(context).textTheme.labelSmall,
            ))
      ],
    );
  }
}