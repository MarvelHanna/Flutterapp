# Personal Organizer (Flutter + Riverpod + Isar)

Local-first organizer for Android/iOS with tasks, events, habits, goals, notes, lists, reminders, health and mood tracking, and a smart capture flow. Uses Riverpod for state, go_router for navigation, Isar for storage, flutter_local_notifications for alerts, and speech_to_text for voice capture.

## Features
- Tasks with subtasks, priority, due dates, recurrence, reminders, Later bin, and weekly review actions (reschedule/move to today).
- Calendar events with travel buffers, reminders, and area tags.
- Habits/routines with flexible streak logic (grace/catch-up flags) and recurrence rules.
- Goals with weekly targets and 13-week milestones; progress shown on dashboard.
- Notes and one-tap checklists (lists) tied to life areas (School/Work/Home/Health/Personal/Social).
- Reminders (time-based via local notifications) plus stubbed geofencing API for location reminders.
- Mood/energy logging and manual health entries (sleep/water) with quick summaries.
- Smart capture (text or voice) → parser infers type/priority/date/area; saves to Isar.
- Recurring schedules stored on tasks/habits; progress tracking and hydration averages.
- Weekly review flow in Today tab; Later bin surfaced for cleanup.
- Global search across tasks/events/goals/notes; Life Areas dashboard highlights load.
- Dark/light themes with Material 3.

## App layout
- Dashboard: life area load, goals progress, quick lists, notes, mood/health snapshots.
- Today: agenda, due tasks with priority chips, weekly review actions.
- Calendar: combined tasks/events grouped by day with travel buffers.
- Capture: smart inbox with parser + voice input (speech_to_text).
- Search: global search across everything.
- Settings: toggles, notification demo, geofence stub hook.

## Project structure (lib/)
- `app/` app root wiring
- `config/` router + themes
- `data/` models (Isar), seed data, repository layer
- `features/` UI screens (today, calendar, capture, search, dashboard, settings) + shared widgets/providers
- `services/` notifications, speech, smart-capture parser, location reminder stub

## Getting started
1) Install Flutter (latest stable) and platform toolchains for Android/iOS.
2) Install dependencies:
   ```bash
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
3) Run the app:
   ```bash
   flutter run
   ```

## Notes & platform setup
- Seed data is inserted on first launch from `lib/data/local/seed_data.dart`.
- Notifications: permissions requested at runtime. Android uses channels `tasks` and `immediate`. iOS requires alert/badge/sound permissions.
- Location reminders: `LocationReminderService` is stubbed; integrate a geofencing plugin (e.g., geolocator/geofence_service) and wire `Reminder.isLocationBased` to platform code.
- Voice capture: uses `speech_to_text`; ensure microphone permission is enabled on device/simulator.
- Data model uses Isar; migrations handled by bumping schemas when models evolve.

## Testing/dev tips
- Re-run code generation after model changes: `flutter pub run build_runner build --delete-conflicting-outputs`.
- Use hot reload for UI tweaks; state is Riverpod-managed.

