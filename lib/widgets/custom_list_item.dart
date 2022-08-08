import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final void Function()? onTap;
  final Widget? trailingWidget;

  const CustomListTile(
      {Key? key, this.title, this.icon, this.onTap, this.trailingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Icon(icon),
          title: Text(title!),
          trailing: trailingWidget,
        ),
        const Divider(thickness: 1.5)
      ],
    );
  }
}
