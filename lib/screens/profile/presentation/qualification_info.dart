import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/appbar.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/bottom_sheet.dart';

class QualificationInfo extends StatelessWidget {
  const QualificationInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileScreenAppBar(context, title: 'Qualifications'),
      bottomSheet: bottomSheet(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.school, size: 40, color: Colors.black26),
                  Text('Qualification',
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Text(
                        '3/6',
                        style: TextStyle(color: Colors.black26, fontSize: 17),
                      ),
                    ),
                  ),
                ]),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 2,
                color: Colors.black12,
              ),
            ),
            const SizedBox(
            
              height: 40,
            ),
            _customLabelField(label: 'Education Level', fields: [
              _textField(context,
                  hint: 'Highest Education Level',
                  icon: Icons.arrow_drop_down,
                  readonly: true),
              const SizedBox(
                height: 10,
              ),
            ]),
            _customLabelField(label: 'Training', fields: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _textField(context,
                      hint: 'Training',
                      width: MediaQuery.of(context).size.width * .8),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
            _customLabelField(label: 'Skill', fields: [
              Row(
                children: [
                  _textField(context,
                      hint: 'Skill',
                      width: MediaQuery.of(context).size.width * .8),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Colors.blue,
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
            _customLabelField(label: 'Language', fields: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _textField(context, hint: 'Language', width: 200),
                  const SizedBox(
                    width: 10,
                  ),
                  _textField(context, hint: 'Level', width: 120),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  _customLabelField({required String label, required List<Widget> fields}) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: fields,
            )
          ],
        ),
      );

  Widget _textField(BuildContext context,
          {String? hint,
          double? width,
          IconData? icon,
          bool readonly = false}) =>
      SizedBox(
        height: 40,
        width: width != null ? width : MediaQuery.of(context).size.width * 0.9,
        child: TextField(
          readOnly: readonly,
          style: const TextStyle(color: Colors.black38),
          decoration: InputDecoration(
              suffixIcon: Icon(icon),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black38)),
              contentPadding: const EdgeInsets.only(left: 10),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black12))),
        ),
      );
}
