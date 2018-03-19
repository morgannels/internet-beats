import 'package:internet_beats/src/bmt/bmt_time.dart';

// The number of milliseconds in a day
const millisInDay = 24 * 60 * 60 * 1000;

/// The Internet Time
/// This time is stated as Beats, of which there are 1,000 in a day
/// This time doesn't support time zones--all times are in BMT
class InternetBeatsTime {
  BMTTime theBMTTime;

  /// The default InternetBeatsTime constructor
  InternetBeatsTime() {
    this.theBMTTime = new BMTTime();
  }

  /// InternetBeatsTime constructor, which uses a local time
  InternetBeatsTime.fromLocalTime(DateTime aLocalTime) {
    assert(aLocalTime.isUtc == false);
    this.theBMTTime = new BMTTime.fromLocalTime(aLocalTime);
  }

  /// InternetBeatsTime constructor, which uses a UTC time
  InternetBeatsTime.fromUTCTime(DateTime aUTCTime) {
    assert(aUTCTime.isUtc);
    this.theBMTTime = new BMTTime.fromUTCTime(aUTCTime);
  }

  /// Overrides toString() to provide a String representation of this InternetBeats
  toString() {
    return "@${this.preciseInternetBeatsTime().floor().toString().padLeft(3, '0')}";
  }

  /// Returns this InternetBeatsTime as a String
  /// Redundant convenience method
  String asInternetBeatsTimeString() {
    return this.toString();
  }

  /// Returns the local time corresponding to the InternetBeatsTime
  DateTime asLocalTime() {
    return theBMTTime.asLocal();
  }

  /// Return a decimal representation of this InternetBeats
  double preciseInternetBeatsTime() {
    DateTime bmtTime = this.theBMTTime.asUniversal();
    return (bmtTime.hour * 60 * 60 * 1000 +
        bmtTime.minute * 60 * 1000 +
        bmtTime.second * 1000 +
        bmtTime.millisecond) /
        millisInDay * 1000;
  }
}