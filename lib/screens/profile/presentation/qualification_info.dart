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
      appBar: profileScreenAppBar(title: 'Qualifications'),
      bottomSheet: bottomSheet(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.school, size: 40, color: Colors.black26),
                  Text('Education',
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Text(
                        '3 of 6',
                        style: TextStyle(color: Colors.black26, fontSize: 24),
                      ),
                    ),
                  ),
                ]),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 2,
                color: Colors.black12,
              ),
            ),
            _customLabelField(label: 'Education Level', fields: [
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Select Level'),
              const SizedBox(
                height: 10,
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            _customLabelField(label: 'Training', fields: [
              _textField(hint: 'Select Training'),
              const SizedBox(
                height: 10,
              ),
            ]),
            const Text('Add Training +'),
            const SizedBox(
              height: 10,
            ),
            _customLabelField(label: 'Skill', fields: [
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Skill'),
              const SizedBox(
                height: 10,
              ),
            ]),
            const Text('Add Skills +'),
            const SizedBox(
              height: 10,
            ),
            _customLabelField(label: 'Language', fields: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _textField(hint: 'Language', width: 120),
                  const SizedBox(
                    width: 10,
                  ),
                  _textField(hint: 'Level', width: 120),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
            const Text(
              'Add Language +',
            ),
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
            Text(
              label,
              style: const TextStyle(color: Colors.black45),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: fields,
            )
          ],
        ),
      );

  Widget _textField({
    String? hint,
    double? width,
  }) =>
      SizedBox(
        height: 40,
        width: width ?? 250,
        child: TextField(
          style: const TextStyle(color: Colors.black38),
          decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.only(left: 10),
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      );
}
