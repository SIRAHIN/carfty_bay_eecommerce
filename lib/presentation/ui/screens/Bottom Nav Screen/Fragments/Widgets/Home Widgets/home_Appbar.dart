import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/Widgets/Home%20Widgets/appBar_Icon_btn.dart';
import 'package:crafty_bay/style/style.dart';
import 'package:crafty_bay/utils/constants/asset_paths.dart';
import 'package:flutter/material.dart';

AppBar appbar(context) {
  return AppBar(actions: [
    AppBarIconButton(
      icon: Icons.person_outline,
      onPressed: () {},
    ),
    const SizedBox(
      width: 5,
    ),
    AppBarIconButton(
      icon: Icons.call_outlined,
      onPressed: () {},
    ),
    const SizedBox(
      width: 5,
    ),
    AppBarIconButton(
      icon: Icons.notifications_on_outlined,
      onPressed: () {},
    ),
    const SizedBox(
      width: 5,
    ),
  ], title: svgImage(context, AssetPaths.homeNavLogo, .03, .04, false));
}