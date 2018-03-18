import 'package:test/test.dart';

import 'package:internet_beats/internet_beats.dart';

void main() {
  group('The tests of InternetBeatsTime', () {

    test('gets valid default instance of InternetBeatsTime', () {
      final theTime = new InternetBeatsTime();
      expect(theTime.asInternetBeatsTimeString().contains('@'), isTrue);
      expect(theTime.asInternetBeatsTimeString().length == 4, isTrue);
      expect(theTime.preciseInternetBeatsTime() < 1000, isTrue);
      expect(theTime.preciseInternetBeatsTime() >= 0, isTrue);
      expect(theTime.asLocalTime().isUtc, isFalse);
    });

    test('gets valid instance of InternetBeatsTime from local time', () {
      final localTime = new DateTime.now();
      final theTime = new InternetBeatsTime.fromLocalTime(localTime);
      expect(theTime.asInternetBeatsTimeString().contains('@'), isTrue);
      expect(theTime.asInternetBeatsTimeString().length == 4, isTrue);
      expect(theTime.preciseInternetBeatsTime() < 1000, isTrue);
      expect(theTime.preciseInternetBeatsTime() >= 0, isTrue);
      expect(theTime.asLocalTime() == localTime, isTrue);
    });

    test('gets valid instance of InternetBeatsTime from local time', () {
      final localTime = new DateTime(1970);
      final utcTime = localTime.toUtc();
      final theTime = new InternetBeatsTime.fromUTCTime(utcTime);
      expect(theTime.asInternetBeatsTimeString().contains('@'), isTrue);
      expect(theTime.asInternetBeatsTimeString().length == 4, isTrue);
      expect(theTime.preciseInternetBeatsTime() < 1000, isTrue);
      expect(theTime.preciseInternetBeatsTime() >= 0, isTrue);
      expect(theTime.theBMTTime.asUniversal().isAfter(utcTime), isTrue);
      expect(theTime.theBMTTime.asUniversal().subtract(new Duration(hours:1)) == utcTime, isTrue);
      expect(theTime.asLocalTime() == localTime, isTrue);
    });
  });
}