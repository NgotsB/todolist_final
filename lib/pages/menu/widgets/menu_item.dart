import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MenuItem extends StatelessWidget {

  final IconData icon;
  final String title;
  final String? subtitle;
  final OnTapCallBack? onTap;
  final Widget? trailing;
  const MenuItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.trailing,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: trailing ?? const Icon(Icons.keyboard_arrow_right_rounded),
      ),
    );
  }
}


typedef OnTapCallBack = void Function();