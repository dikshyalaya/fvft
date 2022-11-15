import 'package:flutter/material.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/appbar.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/bottom_sheet.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileScreenAppBar(context, title: 'Personal Information'),
      bottomSheet: bottomSheet(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.person, size: 40, color: Colors.black26),
                    Text('Contact Information',
                        style: TextStyle(color: Colors.black54, fontSize: 20)),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Text(
                          '2 of 6',
                          style: TextStyle(color: Colors.black26, fontSize: 17),
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
              const SizedBox(
                height: 40,
              ),
              _customLabelField(label: 'First name*', fields: [
                _textField(label: 'Mobile Number 1'),
                const SizedBox(
                  height: 10,
                ),
              ]),
              _customLabelField(label: 'Last Name*', fields: [
                _textField(label: 'Mobile Number 2'),
              ]),
              const SizedBox(
                height: 10,
              ),
              _customLabelField(label: 'Gender*', fields: [
                _textField(label: 'Email Address'),
                const SizedBox(
                  height: 10,
                ),
              ]),
              _customLabelField(label: 'Martial Status', fields: [
                _textField(label: 'Country'),
                const SizedBox(
                  height: 10,
                ),
              ]),
              _customLabelField(label: 'Date of Birth(B.S)', fields: [
                _textField(label: 'DOB (Nepali Date)'),
                const SizedBox(
                  height: 10,
                ),
              ]),
              _customLabelField(label: 'Date of Birth(A.D)*', fields: [
                _textField(label: 'State'),
                const SizedBox(
                  height: 10,
                ),
              ]),
              _customLabelField(label: 'Height', fields: [
                _textField(label: 'District'),
                const SizedBox(
                  height: 10,
                ),
              ]),
              _customLabelField(label: 'Weight', fields: [
                _textField(label: 'Municipality'),
                const SizedBox(
                  height: 10,
                ),
              ]),
              _customLabelField(label: 'Weight', fields: [
                _textField(label: 'Ward'),
                const SizedBox(
                  height: 10,
                ),
              ]),
              _customLabelField(label: 'Weight', fields: [
                _textField(label: 'City/Street/Tole/Town/Village'),
                const SizedBox(
                  height: 10,
                ),
              ]),
              _customLabelField(label: 'Weight', fields: [
                _textField(label: 'Address Line'),
                const SizedBox(
                  height: 10,
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _customLabelField({required String label, required List<Widget> fields}) =>
      Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: fields,
          ));

  Widget _textField({String? label, IconData? suffixIcon}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          color: Colors.white,
          height: 40,
          child: TextField(
            style: const TextStyle(color: Colors.black38),
            decoration: InputDecoration(
                suffixIcon: Icon(suffixIcon),
                labelStyle: const TextStyle(color: Colors.black38),
                labelText: label,
                border: const OutlineInputBorder()),
          ),
        ),
      );
}
