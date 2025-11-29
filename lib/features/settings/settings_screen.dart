import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/reminder.dart';
import '../../services/location_reminder_service.dart';
import '../../services/notification_service.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _notifications = true;
  bool _location = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Enable notifications'),
            value: _notifications,
            onChanged: (val) async {
              setState(() => _notifications = val);
              if (val) {
                await ref.read(notificationServiceProvider).showNow('Notifications on', body: 'Local alerts enabled');
              }
            },
          ),
          SwitchListTile(
            title: const Text('Location reminders (stub)'),
            subtitle: const Text('Geofencing placeholder; wire to platform service to enable.'),
            value: _location,
            onChanged: (val) async {
              setState(() => _location = val);
              if (val) {
                await LocationReminderService().registerLocationReminder(
                  Reminder(isLocationBased: true, latitude: 0, longitude: 0),
                  title: 'Demo geofence registration',
                );
              }
            },
          ),
          ListTile(
            title: const Text('About'),
            subtitle: const Text('Local-first organizer • Riverpod + go_router + Isar'),
            trailing: const Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
