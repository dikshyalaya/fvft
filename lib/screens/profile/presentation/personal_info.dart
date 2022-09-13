import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/appbar.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileScreenAppBar(title: 'Personal Information'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.contacts_outlined,
                      size: 40, color: Colors.black26),
                  Text('Contact Information',
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Text(
                        '2 of 6',
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
            _customLabelField(label: 'Mobile Number', fields: [
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Mobile Number 1'),
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Mobile Number 2'),
              const SizedBox(
                height: 10,
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            _customLabelField(label: 'Email', fields: [
              _textField(hint: 'Email'),
            ]),
            const SizedBox(
              height: 10,
            ),
            _customLabelField(label: 'Address', fields: [
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Country'),
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'State'),
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'District'),
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Municipality'),
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Ward'),
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'City/Street/Tole/Town/Village'),
              const SizedBox(
                height: 10,
              ),
              _textField(hint: 'Address Line'),
              const SizedBox(
                height: 10,
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
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
              contentPadding:const EdgeInsets.only(left: 10),
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      );
}
