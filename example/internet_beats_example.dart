import 'package:internet_beats/internet_beats.dart';

main() {
  InternetBeatsTime theTime = new InternetBeatsTime();

  print("Here, the time is ${theTime.theBMTTime.asLocal()}");
  print("Everywhere, the time is ${theTime.internetBeatsString()} " +
        "or more precisely: ${theTime.preciseInternetBeats()}");
}
