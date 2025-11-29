import '../data/models/reminder.dart';

/// Geofencing/location reminders stub.
/// In production connect to a geofencing package (e.g. geolocator/geofence_service)
/// and register circular regions tied to the Reminder lat/long.
class LocationReminderService {
  Future<void> registerLocationReminder(Reminder reminder, {required String title}) async {
    // TODO: implement geofencing subscription. For now we no-op to keep
    // the API shape and enable wiring without platform setup.
    if (reminder.latitude == null || reminder.longitude == null) return;
  }
}
