import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/appbar.dart';
import 'package:free_visa_free_ticket/screens/profile/presentation/widgets/bottom_sheet.dart';

class GalleryInfo extends StatelessWidget {
  const GalleryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: profileScreenAppBar(context, title: 'Preference'),
        bottomSheet: bottomSheet(),
        body: Stack(
          children: [
            Container(),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.person, size: 40, color: Colors.black26),
                  Text('Gallery',
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 100,
              right: 10,
              left: 10,
              bottom: 0,
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(
                  9,
                  (index) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
