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