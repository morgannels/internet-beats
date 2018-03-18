import 'package:internet_beats/internet_beats.dart';

main() {
  InternetBeatsTime theTime = new InternetBeatsTime();

  print("Here, the time is ${theTime.asLocalTime()}");
  print("Everywhere, the time is ${theTime.asInternetBeatsTimeString()} " +
        "or more precisely: ${theTime.preciseInternetBeatsTime()}");
}
