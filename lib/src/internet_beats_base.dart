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

/// The BMT Time
/// This time isn't in a specific time zone, but is universal
class BMTTime {
  DateTime theBMTTime;

  /// Default BMTTime constructor, which uses the current local time
  /// Assumes the current time and time zone are correct
  BMTTime() {
    this.theBMTTime = new DateTime.now().toUtc().add(new Duration(hours:1));
  }

  /// BMTTime constructor, which uses the given local time
  /// Assumes the time zone of the given local time is correct
  BMTTime.fromLocalTime(DateTime aLocalTime) {
    assert(aLocalTime.isUtc == false);
    this.theBMTTime = aLocalTime.toUtc().add(new Duration(hours:1));
  }

  /// BMT constructor, which uses the given UTC time
  BMTTime.fromUTCTime(DateTime aUTCTime) {
    assert(aUTCTime.isUtc);
    this.theBMTTime = aUTCTime.add(new Duration(hours:1));
  }

  /// Returns the solar-formatted BMT time as universal
  /// isUtc is true, though the BMT is universal BMT, not UTC
  DateTime asUniversal() {
    return this.theBMTTime;
  }

  /// Returns the local time corresponding to this BMT
  /// Assumes the time zone is correct
  DateTime asLocal() {
    DateTime utcTime = this.theBMTTime.subtract(new Duration(hours:1));
    return utcTime.toLocal();
  }
}