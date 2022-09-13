import 'package:flutter/material.dart';
import '../core/theme/free_visa_free_ticket_theme.dart';

class UnorderedList extends StatelessWidget {
  const UnorderedList(this.texts, {Key? key}) : super(key: key);

  final List<String?> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(UnorderedListItem(text));
      // Add space between items
      widgetList.add(const SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text, {Key? key}) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('• '),
        Expanded(
          child: Text(
            text!,
            style: FreeVisaFreeTicketTheme.bodyTextStyle,
          ),
        ),
      ],
    );
  }
}
