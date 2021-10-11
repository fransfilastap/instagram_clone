import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kBackgroundColor = Colors.white;
const kInstagramBlue = Color(0xFF0094F5);
const kInstagramGrey = Color(0xFFB1A9A9);

const kInstagramGradient = LinearGradient(
    colors: [Color(0xFF9E2692), Color(0xFFFAA958)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft);

const kInstagramLiveGradient = LinearGradient(
    colors: [Color(0xFF5B00C4), Color(0xFFD00049)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft);

const kInstagramGreyGradient = LinearGradient(
    colors: [kInstagramGrey, kInstagramGrey],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft);
