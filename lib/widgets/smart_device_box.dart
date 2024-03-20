import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String deviceName;
  final IconData icon;
  final bool powerOn;
  final Function(bool) onChanged;

  const SmartDeviceBox({
    super.key,
    required this.deviceName,
    required this.icon,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        decoration: BoxDecoration(
          color: powerOn ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1), // Shadow color with opacity
              offset: Offset(0, 1), // Shadow position, bottom right
              blurRadius: 1, // Spread radius
              spreadRadius: 1, // Expand the shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 54,
              color: powerOn ? Colors.white : Colors.black,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  deviceName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: powerOn ? Colors.white : Colors.black,
                  ),
                )),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                    value: powerOn,
                    onChanged: (value) {
                      onChanged(value);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
