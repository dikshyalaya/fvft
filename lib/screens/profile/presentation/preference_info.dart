import 'package:flutter/material.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/appbar.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/bottom_sheet.dart';

class ProfileJobPreference extends StatelessWidget {
  const ProfileJobPreference({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileScreenAppBar(context, title: 'Preference'),
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
                        Text('Preference',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 20)),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Text(
                              '5/6',
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
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22.0),
                        child: Text(
                          "Country",
                        ),
                      )),
                  _customLabelField(label: 'First name*', fields: [
                    _textField(context, hint: 'Country 1'),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                  _customLabelField(label: 'Last Name*', fields: [
                    _textField(context, hint: 'Country 2'),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  _customLabelField(label: 'Gender*', fields: [
                    _textField(context, hint: 'Country 3'),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22.0),
                        child: Text(
                          "Industry",
                        ),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  _customLabelField(label: 'First name*', fields: [
                    _textField(context, hint: 'Industry 1'),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                  _customLabelField(label: 'Last Name*', fields: [
                    _textField(context, hint: 'Industry 2'),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  _customLabelField(label: 'Gender*', fields: [
                    _textField(context, hint: 'Industry 3'),
                    const SizedBox(
                      height: 5,
                    ),
                  ]),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22.0),
                        child: Text(
                          "Job Category",
                        ),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  _customLabelField(label: 'First name*', fields: [
                    _textField(context, hint: 'Category 1'),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                  _customLabelField(label: 'Last Name*', fields: [
                    _textField(context, hint: 'Category 2'),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  _customLabelField(label: 'Gender*', fields: [
                    _textField(context, hint: 'Category 3'),
                    const SizedBox(
                      height: 5,
                    ),
                  ]),
                  const SizedBox(
                    height: 70,
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
