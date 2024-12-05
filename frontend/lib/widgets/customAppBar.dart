import 'package:flutter/material.dart';
import 'package:proje/constants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String appBarTitle;

  const CustomAppBar({super.key, required this.appBarTitle});

  @override
  State<StatefulWidget> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: kLinearGradientAppColor
          )),
      title: Row(
        children: [
          const SizedBox(
            width: 85,
          ),
          Text(
            widget.appBarTitle,
            style: kAppBarTitleTextStyle
          )
        ],
      ),
    );
  }
}