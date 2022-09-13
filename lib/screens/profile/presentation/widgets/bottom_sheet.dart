import 'package:flutter/material.dart';

Widget bottomSheet() => Container(
      height: 50,
      color: Colors.blue,
      child: Row(children: [
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.blue,
            height: 50,
            child: Center(
                child: Text(
              'Previous'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
              ),
            )),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.green,
            height: 50,
            child: Center(
                child: Text(
              'Save'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
              ),
            )),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.blue,
            height: 50,
            child: Center(
                child: Text(
              'Next'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
              ),
            )),
          ),
        ),
      ]),
    );
