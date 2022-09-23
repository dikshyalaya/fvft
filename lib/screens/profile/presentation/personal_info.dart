import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/appbar.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/bottom_sheet.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileScreenAppBar(context , title: 'Personal Information'),
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
                  Icon(Icons.person, size: 40, color: Colors.black26),
                  Text('Personal Information',
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Text(
                        '1 of 6',
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
            _customLabelField(label: 'First name*', fields: [
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Enter your first name'),
            ]),
            const SizedBox(
              height: 10,
            ),
            _customLabelField(label: 'Last Name*', fields: [
              _textField(hint: 'Enter your last name'),
            ]),
            const SizedBox(
              height: 10,
            ),
            _customLabelField(label: 'Gender*', fields: [
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Choose Gender'),
              const SizedBox(
                height: 10,
              ),
            ]),
            _customLabelField(label: 'Martial Status', fields: [
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Select Martial Status'),
              const SizedBox(
                height: 10,
              ),
            ]),
            _customLabelField(label: 'Date of Birth(B.S)', fields: [
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Select DOB (Nepali Date)'),
              const SizedBox(
                height: 10,
              ),
            ]),
            _customLabelField(label: 'Date of Birth(A.D)*', fields: [
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Select DOB (English Date)'),
              const SizedBox(
                height: 10,
              ),
            ]),
            _customLabelField(label: 'Height', fields: [
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Height in CM'),
              const SizedBox(
                height: 10,
              ),
            ]),
            _customLabelField(label: 'Weight', fields: [
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Height in KG'),
              const SizedBox(
                height: 10,
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 40,
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
  }) =>
      SizedBox(
        height: 40,
        width: 250,
        child: TextField(
          style: const TextStyle(color: Colors.black38),
          decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.only(left: 10),
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      );
}
