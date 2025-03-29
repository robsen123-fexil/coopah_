import 'package:flutter/material.dart';

// Custom text styles for reuse
const TextStyle titleTextStyle = TextStyle(
  fontFamily: 'Futura',
  fontSize: 24,
  fontWeight: FontWeight.w900,
  fontStyle: FontStyle.italic,
  height: 1.3,
  letterSpacing: 0.0,
  textBaseline: TextBaseline.alphabetic,
  fontFeatures: [FontFeature.enable('smcp')],
);

const TextStyle sectionTitleStyle = TextStyle(
  fontFamily: 'CircularStd',
  fontSize: 20,
  fontWeight: FontWeight.w500,
  height: 24 / 20,
  letterSpacing: 0.0,
);

const TextStyle sectionTextStyle = TextStyle(
  fontFamily: 'CircularStd',
  fontSize: 16,
  fontWeight: FontWeight.w500,
  height: 24 / 16,
  letterSpacing: 0.0,
);

// Custom button style for reuse
final ButtonStyle refreshButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Color(0xFFFF5700),
  padding: EdgeInsets.fromLTRB(24, 14, 24, 14),
  minimumSize: Size(366, 51),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  textStyle: TextStyle(fontSize: 18),
);
