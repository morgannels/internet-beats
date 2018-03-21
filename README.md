# internet_beats

A library for Dart developers to generate and manage instances
of [Internet Time](https://en.wikipedia.org/wiki/Swatch_Internet_Time)
in the form of Internet Beats.

## Usage

A simple usage example:

    import 'package:internet_beats/internet_beats.dart';

    main() {
      InternetBeatsTime theTime = new InternetBeatsTime();

      print("Here, the time is ${theTime.asLocalTime()}");
      print("Everywhere, the time is ${theTime.asInternetBeatsTimeString()} " +
            "or more precisely: ${theTime.preciseInternetBeatsTime()}");
    }

## Features and bugs

Please e-mail feature requests and bugs to [Morgan Sandquist](mailto:morgannels@gmail.com).
