import 'package:flutter/material.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/appbar.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/bottom_sheet.dart';

class ProfileJobPreference extends StatelessWidget {
  const ProfileJobPreference({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileScreenAppBar(context, title: 'Experience'),
      bottomSheet: bottomSheet(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.person, size: 40, color: Colors.black26),
                        Text('Experience',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 20)),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Text(
                              '4/6',
                              style: TextStyle(
                                  color: Colors.black26, fontSize: 17),
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
                    height: 30,
                  ),
                  _customLabelField(label: 'First name*', fields: [
                    _textField(context, hint: 'Select Country'),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                  _customLabelField(label: 'Last Name*', fields: [
                    _textField(context, hint: 'Select Job Category'),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  _customLabelField(label: 'Gender*', fields: [
                    _textField(context, hint: 'Select Job Title'),
                    const SizedBox(
                      height: 5,
                    ),
                  ]),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Text(
                          "Working Duration",
                        ),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  _customLabelField(label: 'Martial Status', fields: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _textField(context,
                            readonly: true,
                            hint: 'Years',
                            width: MediaQuery.of(context).size.width * 0.44,
                            icon: Icons.arrow_drop_down),
                        SizedBox(
                          width: 10,
                        ),
                        _textField(context,
                            readonly: true,
                            hint: 'Months',
                            width: MediaQuery.of(context).size.width * 0.42,
                            icon: Icons.arrow_drop_down),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 35.0),
                        child: Text(
                          'More Details',
                        ),
                      )),
                  _customLabelField(label: 'Date of Birth(B.S)', fields: [
                    _textField(context, hint: 'Company Name, Address etc'),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                  Container(
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[800],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _experienceCard(context),
                  const SizedBox(
                    height: 10,
                  ),
                  _experienceCard(context),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _experienceCard(BuildContext context) => Card(
        child: SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width * .9,
          child: Stack(
            children: [
              Container(),
              Container(
                height: 40,
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Senior SuperVisior",
                      style: TextStyle(color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      );
  _customLabelField({required String label, required List<Widget> fields}) =>
      Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: fields,
          ));

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
