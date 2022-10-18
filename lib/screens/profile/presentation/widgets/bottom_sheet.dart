import 'package:flutter/material.dart';
import 'package:free_visa_free_ticket/core/constants/route_constants.dart';
import 'package:free_visa_free_ticket/core/services/navigation_service.dart';
import 'package:free_visa_free_ticket/core/services/service_locator.dart';
import 'package:provider/provider.dart';

Widget bottomSheet() => Container(
      height: 50,
      color: Colors.blue,
      child: Row(children: [
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.blue[700],
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  'Previous'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.blue[800],
            height: 50,
            child: Center(
                child: Text(
              'Save'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            )),
          ),
        ),
        Flexible(
          flex: 1,
          child: InkWell(
            onTap: () {
              locator<NavigationService>()
                  .pushReplacementNamedWithArgs(RouteConstants.profilePreview);
            },
            child: Container(
              color: Colors.blue[700],
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      'Next'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                 const  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
