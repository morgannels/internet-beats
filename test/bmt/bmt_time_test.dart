import 'package:test/test.dart';

import 'package:internet_beats/internet_beats.dart';

void main() {
  group('The tests of BMTTime', () {
    
    test('gets valid default instance of BMTTime', () {
      final bmtTime = new BMTTime();
      expect(bmtTime
          .asUniversal()
          .isUtc, isTrue);
      expect(bmtTime
          .asLocal()
          .isUtc, isFalse);
      expect(
          new DateTime.now().toUtc().isBefore(bmtTime.asUniversal()), isTrue);
    });

    test('gets valid instance of BMTTime set from local time', () {
      final localTime = new DateTime(1970);
      final bmtTime = new BMTTime.fromLocalTime(localTime);
      expect(bmtTime
          .asUniversal()
          .isUtc, isTrue);
      expect(bmtTime
          .asLocal()
          .isUtc, isFalse);
      expect(localTime == bmtTime.asLocal(), isTrue);
    });

    test('gets valid instance of BMTTime from UTC time', () {
      final utcTime = new DateTime(1970).toUtc();
      final bmtTime = new BMTTime.fromUTCTime(utcTime);
      expect(bmtTime
          .asUniversal()
          .isUtc, isTrue);
      expect(bmtTime
          .asLocal()
          .isUtc, isFalse);
      expect(utcTime.isBefore(bmtTime.asUniversal()), isTrue);
    });
  });
}
