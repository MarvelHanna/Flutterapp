// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<TaskPriority, String> priority =
      GeneratedColumn<String>('priority', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TaskPriority>($TasksTable.$converterpriority);
  @override
  late final GeneratedColumnWithTypeConverter<TaskStatus, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TaskStatus>($TasksTable.$converterstatus);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<LifeArea, String> area =
      GeneratedColumn<String>('area', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<LifeArea>($TasksTable.$converterarea);
  @override
  late final GeneratedColumnWithTypeConverter<RecurrenceRule?, String>
      recurrence = GeneratedColumn<String>('recurrence', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<RecurrenceRule?>($TasksTable.$converterrecurrencen);
  @override
  late final GeneratedColumnWithTypeConverter<Reminder?, String> reminder =
      GeneratedColumn<String>('reminder', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Reminder?>($TasksTable.$converterremindern);
  @override
  late final GeneratedColumnWithTypeConverter<List<SubTask>, String> subtasks =
      GeneratedColumn<String>('subtasks', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<SubTask>>($TasksTable.$convertersubtasks);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        priority,
        status,
        dueDate,
        area,
        recurrence,
        reminder,
        subtasks,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      priority: $TasksTable.$converterpriority.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])!),
      status: $TasksTable.$converterstatus.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      area: $TasksTable.$converterarea.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!),
      recurrence: $TasksTable.$converterrecurrencen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recurrence'])),
      reminder: $TasksTable.$converterremindern.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reminder'])),
      subtasks: $TasksTable.$convertersubtasks.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subtasks'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TaskPriority, String, String> $converterpriority =
      const EnumNameConverter<TaskPriority>(TaskPriority.values);
  static JsonTypeConverter2<TaskStatus, String, String> $converterstatus =
      const EnumNameConverter<TaskStatus>(TaskStatus.values);
  static JsonTypeConverter2<LifeArea, String, String> $converterarea =
      const EnumNameConverter<LifeArea>(LifeArea.values);
  static TypeConverter<RecurrenceRule, String> $converterrecurrence =
      const RecurrenceConverter();
  static TypeConverter<RecurrenceRule?, String?> $converterrecurrencen =
      NullAwareTypeConverter.wrap($converterrecurrence);
  static TypeConverter<Reminder, String> $converterreminder =
      const ReminderConverter();
  static TypeConverter<Reminder?, String?> $converterremindern =
      NullAwareTypeConverter.wrap($converterreminder);
  static TypeConverter<List<SubTask>, String> $convertersubtasks =
      const SubTaskListConverter();
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String title;
  final String? description;
  final TaskPriority priority;
  final TaskStatus status;
  final DateTime? dueDate;
  final LifeArea area;
  final RecurrenceRule? recurrence;
  final Reminder? reminder;
  final List<SubTask> subtasks;
  final DateTime createdAt;
  const Task(
      {required this.id,
      required this.title,
      this.description,
      required this.priority,
      required this.status,
      this.dueDate,
      required this.area,
      this.recurrence,
      this.reminder,
      required this.subtasks,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    {
      map['priority'] =
          Variable<String>($TasksTable.$converterpriority.toSql(priority));
    }
    {
      map['status'] =
          Variable<String>($TasksTable.$converterstatus.toSql(status));
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    {
      map['area'] = Variable<String>($TasksTable.$converterarea.toSql(area));
    }
    if (!nullToAbsent || recurrence != null) {
      map['recurrence'] =
          Variable<String>($TasksTable.$converterrecurrencen.toSql(recurrence));
    }
    if (!nullToAbsent || reminder != null) {
      map['reminder'] =
          Variable<String>($TasksTable.$converterremindern.toSql(reminder));
    }
    {
      map['subtasks'] =
          Variable<String>($TasksTable.$convertersubtasks.toSql(subtasks));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      priority: Value(priority),
      status: Value(status),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      area: Value(area),
      recurrence: recurrence == null && nullToAbsent
          ? const Value.absent()
          : Value(recurrence),
      reminder: reminder == null && nullToAbsent
          ? const Value.absent()
          : Value(reminder),
      subtasks: Value(subtasks),
      createdAt: Value(createdAt),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      priority: $TasksTable.$converterpriority
          .fromJson(serializer.fromJson<String>(json['priority'])),
      status: $TasksTable.$converterstatus
          .fromJson(serializer.fromJson<String>(json['status'])),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      area: $TasksTable.$converterarea
          .fromJson(serializer.fromJson<String>(json['area'])),
      recurrence: serializer.fromJson<RecurrenceRule?>(json['recurrence']),
      reminder: serializer.fromJson<Reminder?>(json['reminder']),
      subtasks: serializer.fromJson<List<SubTask>>(json['subtasks']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'priority': serializer
          .toJson<String>($TasksTable.$converterpriority.toJson(priority)),
      'status': serializer
          .toJson<String>($TasksTable.$converterstatus.toJson(status)),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'area':
          serializer.toJson<String>($TasksTable.$converterarea.toJson(area)),
      'recurrence': serializer.toJson<RecurrenceRule?>(recurrence),
      'reminder': serializer.toJson<Reminder?>(reminder),
      'subtasks': serializer.toJson<List<SubTask>>(subtasks),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Task copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent(),
          TaskPriority? priority,
          TaskStatus? status,
          Value<DateTime?> dueDate = const Value.absent(),
          LifeArea? area,
          Value<RecurrenceRule?> recurrence = const Value.absent(),
          Value<Reminder?> reminder = const Value.absent(),
          List<SubTask>? subtasks,
          DateTime? createdAt}) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        priority: priority ?? this.priority,
        status: status ?? this.status,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        area: area ?? this.area,
        recurrence: recurrence.present ? recurrence.value : this.recurrence,
        reminder: reminder.present ? reminder.value : this.reminder,
        subtasks: subtasks ?? this.subtasks,
        createdAt: createdAt ?? this.createdAt,
      );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      priority: data.priority.present ? data.priority.value : this.priority,
      status: data.status.present ? data.status.value : this.status,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      area: data.area.present ? data.area.value : this.area,
      recurrence:
          data.recurrence.present ? data.recurrence.value : this.recurrence,
      reminder: data.reminder.present ? data.reminder.value : this.reminder,
      subtasks: data.subtasks.present ? data.subtasks.value : this.subtasks,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('area: $area, ')
          ..write('recurrence: $recurrence, ')
          ..write('reminder: $reminder, ')
          ..write('subtasks: $subtasks, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, priority, status,
      dueDate, area, recurrence, reminder, subtasks, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.priority == this.priority &&
          other.status == this.status &&
          other.dueDate == this.dueDate &&
          other.area == this.area &&
          other.recurrence == this.recurrence &&
          other.reminder == this.reminder &&
          other.subtasks == this.subtasks &&
          other.createdAt == this.createdAt);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<TaskPriority> priority;
  final Value<TaskStatus> status;
  final Value<DateTime?> dueDate;
  final Value<LifeArea> area;
  final Value<RecurrenceRule?> recurrence;
  final Value<Reminder?> reminder;
  final Value<List<SubTask>> subtasks;
  final Value<DateTime> createdAt;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.area = const Value.absent(),
    this.recurrence = const Value.absent(),
    this.reminder = const Value.absent(),
    this.subtasks = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required TaskPriority priority,
    required TaskStatus status,
    this.dueDate = const Value.absent(),
    required LifeArea area,
    this.recurrence = const Value.absent(),
    this.reminder = const Value.absent(),
    required List<SubTask> subtasks,
    this.createdAt = const Value.absent(),
  })  : title = Value(title),
        priority = Value(priority),
        status = Value(status),
        area = Value(area),
        subtasks = Value(subtasks);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? priority,
    Expression<String>? status,
    Expression<DateTime>? dueDate,
    Expression<String>? area,
    Expression<String>? recurrence,
    Expression<String>? reminder,
    Expression<String>? subtasks,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (priority != null) 'priority': priority,
      if (status != null) 'status': status,
      if (dueDate != null) 'due_date': dueDate,
      if (area != null) 'area': area,
      if (recurrence != null) 'recurrence': recurrence,
      if (reminder != null) 'reminder': reminder,
      if (subtasks != null) 'subtasks': subtasks,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<TaskPriority>? priority,
      Value<TaskStatus>? status,
      Value<DateTime?>? dueDate,
      Value<LifeArea>? area,
      Value<RecurrenceRule?>? recurrence,
      Value<Reminder?>? reminder,
      Value<List<SubTask>>? subtasks,
      Value<DateTime>? createdAt}) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      area: area ?? this.area,
      recurrence: recurrence ?? this.recurrence,
      reminder: reminder ?? this.reminder,
      subtasks: subtasks ?? this.subtasks,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(
          $TasksTable.$converterpriority.toSql(priority.value));
    }
    if (status.present) {
      map['status'] =
          Variable<String>($TasksTable.$converterstatus.toSql(status.value));
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (area.present) {
      map['area'] =
          Variable<String>($TasksTable.$converterarea.toSql(area.value));
    }
    if (recurrence.present) {
      map['recurrence'] = Variable<String>(
          $TasksTable.$converterrecurrencen.toSql(recurrence.value));
    }
    if (reminder.present) {
      map['reminder'] = Variable<String>(
          $TasksTable.$converterremindern.toSql(reminder.value));
    }
    if (subtasks.present) {
      map['subtasks'] = Variable<String>(
          $TasksTable.$convertersubtasks.toSql(subtasks.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('area: $area, ')
          ..write('recurrence: $recurrence, ')
          ..write('reminder: $reminder, ')
          ..write('subtasks: $subtasks, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $HabitsTable extends Habits with TableInfo<$HabitsTable, Habit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<RecurrenceRule?, String>
      recurrence = GeneratedColumn<String>('recurrence', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<RecurrenceRule?>($HabitsTable.$converterrecurrencen);
  @override
  late final GeneratedColumnWithTypeConverter<LifeArea, String> area =
      GeneratedColumn<String>('area', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<LifeArea>($HabitsTable.$converterarea);
  static const VerificationMeta _currentStreakMeta =
      const VerificationMeta('currentStreak');
  @override
  late final GeneratedColumn<int> currentStreak = GeneratedColumn<int>(
      'current_streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _bestStreakMeta =
      const VerificationMeta('bestStreak');
  @override
  late final GeneratedColumn<int> bestStreak = GeneratedColumn<int>(
      'best_streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _graceDaysMeta =
      const VerificationMeta('graceDays');
  @override
  late final GeneratedColumn<int> graceDays = GeneratedColumn<int>(
      'grace_days', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _catchUpAllowedMeta =
      const VerificationMeta('catchUpAllowed');
  @override
  late final GeneratedColumn<bool> catchUpAllowed = GeneratedColumn<bool>(
      'catch_up_allowed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("catch_up_allowed" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  late final GeneratedColumnWithTypeConverter<Reminder?, String> reminder =
      GeneratedColumn<String>('reminder', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Reminder?>($HabitsTable.$converterremindern);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        recurrence,
        area,
        currentStreak,
        bestStreak,
        graceDays,
        catchUpAllowed,
        reminder
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits';
  @override
  VerificationContext validateIntegrity(Insertable<Habit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('current_streak')) {
      context.handle(
          _currentStreakMeta,
          currentStreak.isAcceptableOrUnknown(
              data['current_streak']!, _currentStreakMeta));
    }
    if (data.containsKey('best_streak')) {
      context.handle(
          _bestStreakMeta,
          bestStreak.isAcceptableOrUnknown(
              data['best_streak']!, _bestStreakMeta));
    }
    if (data.containsKey('grace_days')) {
      context.handle(_graceDaysMeta,
          graceDays.isAcceptableOrUnknown(data['grace_days']!, _graceDaysMeta));
    }
    if (data.containsKey('catch_up_allowed')) {
      context.handle(
          _catchUpAllowedMeta,
          catchUpAllowed.isAcceptableOrUnknown(
              data['catch_up_allowed']!, _catchUpAllowedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Habit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Habit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      recurrence: $HabitsTable.$converterrecurrencen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recurrence'])),
      area: $HabitsTable.$converterarea.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!),
      currentStreak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_streak'])!,
      bestStreak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}best_streak'])!,
      graceDays: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grace_days'])!,
      catchUpAllowed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}catch_up_allowed'])!,
      reminder: $HabitsTable.$converterremindern.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reminder'])),
    );
  }

  @override
  $HabitsTable createAlias(String alias) {
    return $HabitsTable(attachedDatabase, alias);
  }

  static TypeConverter<RecurrenceRule, String> $converterrecurrence =
      const RecurrenceConverter();
  static TypeConverter<RecurrenceRule?, String?> $converterrecurrencen =
      NullAwareTypeConverter.wrap($converterrecurrence);
  static JsonTypeConverter2<LifeArea, String, String> $converterarea =
      const EnumNameConverter<LifeArea>(LifeArea.values);
  static TypeConverter<Reminder, String> $converterreminder =
      const ReminderConverter();
  static TypeConverter<Reminder?, String?> $converterremindern =
      NullAwareTypeConverter.wrap($converterreminder);
}

class Habit extends DataClass implements Insertable<Habit> {
  final int id;
  final String title;
  final String? description;
  final RecurrenceRule? recurrence;
  final LifeArea area;
  final int currentStreak;
  final int bestStreak;
  final int graceDays;
  final bool catchUpAllowed;
  final Reminder? reminder;
  const Habit(
      {required this.id,
      required this.title,
      this.description,
      this.recurrence,
      required this.area,
      required this.currentStreak,
      required this.bestStreak,
      required this.graceDays,
      required this.catchUpAllowed,
      this.reminder});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || recurrence != null) {
      map['recurrence'] = Variable<String>(
          $HabitsTable.$converterrecurrencen.toSql(recurrence));
    }
    {
      map['area'] = Variable<String>($HabitsTable.$converterarea.toSql(area));
    }
    map['current_streak'] = Variable<int>(currentStreak);
    map['best_streak'] = Variable<int>(bestStreak);
    map['grace_days'] = Variable<int>(graceDays);
    map['catch_up_allowed'] = Variable<bool>(catchUpAllowed);
    if (!nullToAbsent || reminder != null) {
      map['reminder'] =
          Variable<String>($HabitsTable.$converterremindern.toSql(reminder));
    }
    return map;
  }

  HabitsCompanion toCompanion(bool nullToAbsent) {
    return HabitsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      recurrence: recurrence == null && nullToAbsent
          ? const Value.absent()
          : Value(recurrence),
      area: Value(area),
      currentStreak: Value(currentStreak),
      bestStreak: Value(bestStreak),
      graceDays: Value(graceDays),
      catchUpAllowed: Value(catchUpAllowed),
      reminder: reminder == null && nullToAbsent
          ? const Value.absent()
          : Value(reminder),
    );
  }

  factory Habit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Habit(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      recurrence: serializer.fromJson<RecurrenceRule?>(json['recurrence']),
      area: $HabitsTable.$converterarea
          .fromJson(serializer.fromJson<String>(json['area'])),
      currentStreak: serializer.fromJson<int>(json['currentStreak']),
      bestStreak: serializer.fromJson<int>(json['bestStreak']),
      graceDays: serializer.fromJson<int>(json['graceDays']),
      catchUpAllowed: serializer.fromJson<bool>(json['catchUpAllowed']),
      reminder: serializer.fromJson<Reminder?>(json['reminder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'recurrence': serializer.toJson<RecurrenceRule?>(recurrence),
      'area':
          serializer.toJson<String>($HabitsTable.$converterarea.toJson(area)),
      'currentStreak': serializer.toJson<int>(currentStreak),
      'bestStreak': serializer.toJson<int>(bestStreak),
      'graceDays': serializer.toJson<int>(graceDays),
      'catchUpAllowed': serializer.toJson<bool>(catchUpAllowed),
      'reminder': serializer.toJson<Reminder?>(reminder),
    };
  }

  Habit copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent(),
          Value<RecurrenceRule?> recurrence = const Value.absent(),
          LifeArea? area,
          int? currentStreak,
          int? bestStreak,
          int? graceDays,
          bool? catchUpAllowed,
          Value<Reminder?> reminder = const Value.absent()}) =>
      Habit(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        recurrence: recurrence.present ? recurrence.value : this.recurrence,
        area: area ?? this.area,
        currentStreak: currentStreak ?? this.currentStreak,
        bestStreak: bestStreak ?? this.bestStreak,
        graceDays: graceDays ?? this.graceDays,
        catchUpAllowed: catchUpAllowed ?? this.catchUpAllowed,
        reminder: reminder.present ? reminder.value : this.reminder,
      );
  Habit copyWithCompanion(HabitsCompanion data) {
    return Habit(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      recurrence:
          data.recurrence.present ? data.recurrence.value : this.recurrence,
      area: data.area.present ? data.area.value : this.area,
      currentStreak: data.currentStreak.present
          ? data.currentStreak.value
          : this.currentStreak,
      bestStreak:
          data.bestStreak.present ? data.bestStreak.value : this.bestStreak,
      graceDays: data.graceDays.present ? data.graceDays.value : this.graceDays,
      catchUpAllowed: data.catchUpAllowed.present
          ? data.catchUpAllowed.value
          : this.catchUpAllowed,
      reminder: data.reminder.present ? data.reminder.value : this.reminder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Habit(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('recurrence: $recurrence, ')
          ..write('area: $area, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('bestStreak: $bestStreak, ')
          ..write('graceDays: $graceDays, ')
          ..write('catchUpAllowed: $catchUpAllowed, ')
          ..write('reminder: $reminder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, recurrence, area,
      currentStreak, bestStreak, graceDays, catchUpAllowed, reminder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Habit &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.recurrence == this.recurrence &&
          other.area == this.area &&
          other.currentStreak == this.currentStreak &&
          other.bestStreak == this.bestStreak &&
          other.graceDays == this.graceDays &&
          other.catchUpAllowed == this.catchUpAllowed &&
          other.reminder == this.reminder);
}

class HabitsCompanion extends UpdateCompanion<Habit> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<RecurrenceRule?> recurrence;
  final Value<LifeArea> area;
  final Value<int> currentStreak;
  final Value<int> bestStreak;
  final Value<int> graceDays;
  final Value<bool> catchUpAllowed;
  final Value<Reminder?> reminder;
  const HabitsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.recurrence = const Value.absent(),
    this.area = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.bestStreak = const Value.absent(),
    this.graceDays = const Value.absent(),
    this.catchUpAllowed = const Value.absent(),
    this.reminder = const Value.absent(),
  });
  HabitsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.recurrence = const Value.absent(),
    required LifeArea area,
    this.currentStreak = const Value.absent(),
    this.bestStreak = const Value.absent(),
    this.graceDays = const Value.absent(),
    this.catchUpAllowed = const Value.absent(),
    this.reminder = const Value.absent(),
  })  : title = Value(title),
        area = Value(area);
  static Insertable<Habit> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? recurrence,
    Expression<String>? area,
    Expression<int>? currentStreak,
    Expression<int>? bestStreak,
    Expression<int>? graceDays,
    Expression<bool>? catchUpAllowed,
    Expression<String>? reminder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (recurrence != null) 'recurrence': recurrence,
      if (area != null) 'area': area,
      if (currentStreak != null) 'current_streak': currentStreak,
      if (bestStreak != null) 'best_streak': bestStreak,
      if (graceDays != null) 'grace_days': graceDays,
      if (catchUpAllowed != null) 'catch_up_allowed': catchUpAllowed,
      if (reminder != null) 'reminder': reminder,
    });
  }

  HabitsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<RecurrenceRule?>? recurrence,
      Value<LifeArea>? area,
      Value<int>? currentStreak,
      Value<int>? bestStreak,
      Value<int>? graceDays,
      Value<bool>? catchUpAllowed,
      Value<Reminder?>? reminder}) {
    return HabitsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      recurrence: recurrence ?? this.recurrence,
      area: area ?? this.area,
      currentStreak: currentStreak ?? this.currentStreak,
      bestStreak: bestStreak ?? this.bestStreak,
      graceDays: graceDays ?? this.graceDays,
      catchUpAllowed: catchUpAllowed ?? this.catchUpAllowed,
      reminder: reminder ?? this.reminder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (recurrence.present) {
      map['recurrence'] = Variable<String>(
          $HabitsTable.$converterrecurrencen.toSql(recurrence.value));
    }
    if (area.present) {
      map['area'] =
          Variable<String>($HabitsTable.$converterarea.toSql(area.value));
    }
    if (currentStreak.present) {
      map['current_streak'] = Variable<int>(currentStreak.value);
    }
    if (bestStreak.present) {
      map['best_streak'] = Variable<int>(bestStreak.value);
    }
    if (graceDays.present) {
      map['grace_days'] = Variable<int>(graceDays.value);
    }
    if (catchUpAllowed.present) {
      map['catch_up_allowed'] = Variable<bool>(catchUpAllowed.value);
    }
    if (reminder.present) {
      map['reminder'] = Variable<String>(
          $HabitsTable.$converterremindern.toSql(reminder.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('recurrence: $recurrence, ')
          ..write('area: $area, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('bestStreak: $bestStreak, ')
          ..write('graceDays: $graceDays, ')
          ..write('catchUpAllowed: $catchUpAllowed, ')
          ..write('reminder: $reminder')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<LifeArea, String> area =
      GeneratedColumn<String>('area', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<LifeArea>($GoalsTable.$converterarea);
  static const VerificationMeta _weeklyTargetMeta =
      const VerificationMeta('weeklyTarget');
  @override
  late final GeneratedColumn<int> weeklyTarget = GeneratedColumn<int>(
      'weekly_target', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
      'progress', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  late final GeneratedColumnWithTypeConverter<List<GoalMilestone>, String>
      milestones = GeneratedColumn<String>('milestones', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<GoalMilestone>>($GoalsTable.$convertermilestones);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, area, weeklyTarget, progress, milestones];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(Insertable<Goal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('weekly_target')) {
      context.handle(
          _weeklyTargetMeta,
          weeklyTarget.isAcceptableOrUnknown(
              data['weekly_target']!, _weeklyTargetMeta));
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Goal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      area: $GoalsTable.$converterarea.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!),
      weeklyTarget: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}weekly_target'])!,
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}progress'])!,
      milestones: $GoalsTable.$convertermilestones.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}milestones'])!),
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LifeArea, String, String> $converterarea =
      const EnumNameConverter<LifeArea>(LifeArea.values);
  static TypeConverter<List<GoalMilestone>, String> $convertermilestones =
      const GoalMilestoneListConverter();
}

class Goal extends DataClass implements Insertable<Goal> {
  final int id;
  final String title;
  final String? description;
  final LifeArea area;
  final int weeklyTarget;
  final int progress;
  final List<GoalMilestone> milestones;
  const Goal(
      {required this.id,
      required this.title,
      this.description,
      required this.area,
      required this.weeklyTarget,
      required this.progress,
      required this.milestones});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    {
      map['area'] = Variable<String>($GoalsTable.$converterarea.toSql(area));
    }
    map['weekly_target'] = Variable<int>(weeklyTarget);
    map['progress'] = Variable<int>(progress);
    {
      map['milestones'] =
          Variable<String>($GoalsTable.$convertermilestones.toSql(milestones));
    }
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      area: Value(area),
      weeklyTarget: Value(weeklyTarget),
      progress: Value(progress),
      milestones: Value(milestones),
    );
  }

  factory Goal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Goal(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      area: $GoalsTable.$converterarea
          .fromJson(serializer.fromJson<String>(json['area'])),
      weeklyTarget: serializer.fromJson<int>(json['weeklyTarget']),
      progress: serializer.fromJson<int>(json['progress']),
      milestones: serializer.fromJson<List<GoalMilestone>>(json['milestones']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'area':
          serializer.toJson<String>($GoalsTable.$converterarea.toJson(area)),
      'weeklyTarget': serializer.toJson<int>(weeklyTarget),
      'progress': serializer.toJson<int>(progress),
      'milestones': serializer.toJson<List<GoalMilestone>>(milestones),
    };
  }

  Goal copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent(),
          LifeArea? area,
          int? weeklyTarget,
          int? progress,
          List<GoalMilestone>? milestones}) =>
      Goal(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        area: area ?? this.area,
        weeklyTarget: weeklyTarget ?? this.weeklyTarget,
        progress: progress ?? this.progress,
        milestones: milestones ?? this.milestones,
      );
  Goal copyWithCompanion(GoalsCompanion data) {
    return Goal(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      area: data.area.present ? data.area.value : this.area,
      weeklyTarget: data.weeklyTarget.present
          ? data.weeklyTarget.value
          : this.weeklyTarget,
      progress: data.progress.present ? data.progress.value : this.progress,
      milestones:
          data.milestones.present ? data.milestones.value : this.milestones,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('area: $area, ')
          ..write('weeklyTarget: $weeklyTarget, ')
          ..write('progress: $progress, ')
          ..write('milestones: $milestones')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, description, area, weeklyTarget, progress, milestones);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.area == this.area &&
          other.weeklyTarget == this.weeklyTarget &&
          other.progress == this.progress &&
          other.milestones == this.milestones);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<LifeArea> area;
  final Value<int> weeklyTarget;
  final Value<int> progress;
  final Value<List<GoalMilestone>> milestones;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.area = const Value.absent(),
    this.weeklyTarget = const Value.absent(),
    this.progress = const Value.absent(),
    this.milestones = const Value.absent(),
  });
  GoalsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required LifeArea area,
    this.weeklyTarget = const Value.absent(),
    this.progress = const Value.absent(),
    required List<GoalMilestone> milestones,
  })  : title = Value(title),
        area = Value(area),
        milestones = Value(milestones);
  static Insertable<Goal> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? area,
    Expression<int>? weeklyTarget,
    Expression<int>? progress,
    Expression<String>? milestones,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (area != null) 'area': area,
      if (weeklyTarget != null) 'weekly_target': weeklyTarget,
      if (progress != null) 'progress': progress,
      if (milestones != null) 'milestones': milestones,
    });
  }

  GoalsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<LifeArea>? area,
      Value<int>? weeklyTarget,
      Value<int>? progress,
      Value<List<GoalMilestone>>? milestones}) {
    return GoalsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      area: area ?? this.area,
      weeklyTarget: weeklyTarget ?? this.weeklyTarget,
      progress: progress ?? this.progress,
      milestones: milestones ?? this.milestones,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (area.present) {
      map['area'] =
          Variable<String>($GoalsTable.$converterarea.toSql(area.value));
    }
    if (weeklyTarget.present) {
      map['weekly_target'] = Variable<int>(weeklyTarget.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    if (milestones.present) {
      map['milestones'] = Variable<String>(
          $GoalsTable.$convertermilestones.toSql(milestones.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('area: $area, ')
          ..write('weeklyTarget: $weeklyTarget, ')
          ..write('progress: $progress, ')
          ..write('milestones: $milestones')
          ..write(')'))
        .toString();
  }
}

class $CalendarEventsTable extends CalendarEvents
    with TableInfo<$CalendarEventsTable, CalendarEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<DateTime> end = GeneratedColumn<DateTime>(
      'end', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<LifeArea, String> area =
      GeneratedColumn<String>('area', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<LifeArea>($CalendarEventsTable.$converterarea);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _travelBufferMinutesMeta =
      const VerificationMeta('travelBufferMinutes');
  @override
  late final GeneratedColumn<int> travelBufferMinutes = GeneratedColumn<int>(
      'travel_buffer_minutes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, start, end, area, location, travelBufferMinutes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_events';
  @override
  VerificationContext validateIntegrity(Insertable<CalendarEvent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('end')) {
      context.handle(
          _endMeta, end.isAcceptableOrUnknown(data['end']!, _endMeta));
    } else if (isInserting) {
      context.missing(_endMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('travel_buffer_minutes')) {
      context.handle(
          _travelBufferMinutesMeta,
          travelBufferMinutes.isAcceptableOrUnknown(
              data['travel_buffer_minutes']!, _travelBufferMinutesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarEvent(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start'])!,
      end: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end'])!,
      area: $CalendarEventsTable.$converterarea.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      travelBufferMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}travel_buffer_minutes'])!,
    );
  }

  @override
  $CalendarEventsTable createAlias(String alias) {
    return $CalendarEventsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LifeArea, String, String> $converterarea =
      const EnumNameConverter<LifeArea>(LifeArea.values);
}

class CalendarEvent extends DataClass implements Insertable<CalendarEvent> {
  final int id;
  final String title;
  final String? description;
  final DateTime start;
  final DateTime end;
  final LifeArea area;
  final String? location;
  final int travelBufferMinutes;
  const CalendarEvent(
      {required this.id,
      required this.title,
      this.description,
      required this.start,
      required this.end,
      required this.area,
      this.location,
      required this.travelBufferMinutes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['start'] = Variable<DateTime>(start);
    map['end'] = Variable<DateTime>(end);
    {
      map['area'] =
          Variable<String>($CalendarEventsTable.$converterarea.toSql(area));
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['travel_buffer_minutes'] = Variable<int>(travelBufferMinutes);
    return map;
  }

  CalendarEventsCompanion toCompanion(bool nullToAbsent) {
    return CalendarEventsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      start: Value(start),
      end: Value(end),
      area: Value(area),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      travelBufferMinutes: Value(travelBufferMinutes),
    );
  }

  factory CalendarEvent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarEvent(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      start: serializer.fromJson<DateTime>(json['start']),
      end: serializer.fromJson<DateTime>(json['end']),
      area: $CalendarEventsTable.$converterarea
          .fromJson(serializer.fromJson<String>(json['area'])),
      location: serializer.fromJson<String?>(json['location']),
      travelBufferMinutes:
          serializer.fromJson<int>(json['travelBufferMinutes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'start': serializer.toJson<DateTime>(start),
      'end': serializer.toJson<DateTime>(end),
      'area': serializer
          .toJson<String>($CalendarEventsTable.$converterarea.toJson(area)),
      'location': serializer.toJson<String?>(location),
      'travelBufferMinutes': serializer.toJson<int>(travelBufferMinutes),
    };
  }

  CalendarEvent copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent(),
          DateTime? start,
          DateTime? end,
          LifeArea? area,
          Value<String?> location = const Value.absent(),
          int? travelBufferMinutes}) =>
      CalendarEvent(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        start: start ?? this.start,
        end: end ?? this.end,
        area: area ?? this.area,
        location: location.present ? location.value : this.location,
        travelBufferMinutes: travelBufferMinutes ?? this.travelBufferMinutes,
      );
  CalendarEvent copyWithCompanion(CalendarEventsCompanion data) {
    return CalendarEvent(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      start: data.start.present ? data.start.value : this.start,
      end: data.end.present ? data.end.value : this.end,
      area: data.area.present ? data.area.value : this.area,
      location: data.location.present ? data.location.value : this.location,
      travelBufferMinutes: data.travelBufferMinutes.present
          ? data.travelBufferMinutes.value
          : this.travelBufferMinutes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEvent(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('area: $area, ')
          ..write('location: $location, ')
          ..write('travelBufferMinutes: $travelBufferMinutes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, description, start, end, area, location, travelBufferMinutes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarEvent &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.start == this.start &&
          other.end == this.end &&
          other.area == this.area &&
          other.location == this.location &&
          other.travelBufferMinutes == this.travelBufferMinutes);
}

class CalendarEventsCompanion extends UpdateCompanion<CalendarEvent> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<DateTime> start;
  final Value<DateTime> end;
  final Value<LifeArea> area;
  final Value<String?> location;
  final Value<int> travelBufferMinutes;
  const CalendarEventsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
    this.area = const Value.absent(),
    this.location = const Value.absent(),
    this.travelBufferMinutes = const Value.absent(),
  });
  CalendarEventsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required DateTime start,
    required DateTime end,
    required LifeArea area,
    this.location = const Value.absent(),
    this.travelBufferMinutes = const Value.absent(),
  })  : title = Value(title),
        start = Value(start),
        end = Value(end),
        area = Value(area);
  static Insertable<CalendarEvent> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? start,
    Expression<DateTime>? end,
    Expression<String>? area,
    Expression<String>? location,
    Expression<int>? travelBufferMinutes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
      if (area != null) 'area': area,
      if (location != null) 'location': location,
      if (travelBufferMinutes != null)
        'travel_buffer_minutes': travelBufferMinutes,
    });
  }

  CalendarEventsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<DateTime>? start,
      Value<DateTime>? end,
      Value<LifeArea>? area,
      Value<String?>? location,
      Value<int>? travelBufferMinutes}) {
    return CalendarEventsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      start: start ?? this.start,
      end: end ?? this.end,
      area: area ?? this.area,
      location: location ?? this.location,
      travelBufferMinutes: travelBufferMinutes ?? this.travelBufferMinutes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<DateTime>(end.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(
          $CalendarEventsTable.$converterarea.toSql(area.value));
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (travelBufferMinutes.present) {
      map['travel_buffer_minutes'] = Variable<int>(travelBufferMinutes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('area: $area, ')
          ..write('location: $location, ')
          ..write('travelBufferMinutes: $travelBufferMinutes')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<LifeArea, String> area =
      GeneratedColumn<String>('area', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<LifeArea>($NotesTable.$converterarea);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, title, content, area, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      area: $NotesTable.$converterarea.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LifeArea, String, String> $converterarea =
      const EnumNameConverter<LifeArea>(LifeArea.values);
}

class Note extends DataClass implements Insertable<Note> {
  final int id;
  final String title;
  final String content;
  final LifeArea area;
  final DateTime createdAt;
  const Note(
      {required this.id,
      required this.title,
      required this.content,
      required this.area,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    {
      map['area'] = Variable<String>($NotesTable.$converterarea.toSql(area));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      area: Value(area),
      createdAt: Value(createdAt),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      area: $NotesTable.$converterarea
          .fromJson(serializer.fromJson<String>(json['area'])),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'area':
          serializer.toJson<String>($NotesTable.$converterarea.toJson(area)),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Note copyWith(
          {int? id,
          String? title,
          String? content,
          LifeArea? area,
          DateTime? createdAt}) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        area: area ?? this.area,
        createdAt: createdAt ?? this.createdAt,
      );
  Note copyWithCompanion(NotesCompanion data) {
    return Note(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      area: data.area.present ? data.area.value : this.area,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('area: $area, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, area, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.area == this.area &&
          other.createdAt == this.createdAt);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<LifeArea> area;
  final Value<DateTime> createdAt;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.area = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    required LifeArea area,
    this.createdAt = const Value.absent(),
  })  : title = Value(title),
        content = Value(content),
        area = Value(area);
  static Insertable<Note> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? area,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (area != null) 'area': area,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  NotesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<LifeArea>? area,
      Value<DateTime>? createdAt}) {
    return NotesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      area: area ?? this.area,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (area.present) {
      map['area'] =
          Variable<String>($NotesTable.$converterarea.toSql(area.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('area: $area, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ChecklistsTable extends Checklists
    with TableInfo<$ChecklistsTable, Checklist> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChecklistsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<List<ChecklistItem>, String>
      items = GeneratedColumn<String>('items', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<ChecklistItem>>($ChecklistsTable.$converteritems);
  @override
  late final GeneratedColumnWithTypeConverter<LifeArea, String> area =
      GeneratedColumn<String>('area', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<LifeArea>($ChecklistsTable.$converterarea);
  @override
  List<GeneratedColumn> get $columns => [id, title, items, area];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'checklists';
  @override
  VerificationContext validateIntegrity(Insertable<Checklist> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Checklist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Checklist(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      items: $ChecklistsTable.$converteritems.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}items'])!),
      area: $ChecklistsTable.$converterarea.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!),
    );
  }

  @override
  $ChecklistsTable createAlias(String alias) {
    return $ChecklistsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<ChecklistItem>, String> $converteritems =
      const ChecklistItemListConverter();
  static JsonTypeConverter2<LifeArea, String, String> $converterarea =
      const EnumNameConverter<LifeArea>(LifeArea.values);
}

class Checklist extends DataClass implements Insertable<Checklist> {
  final int id;
  final String title;
  final List<ChecklistItem> items;
  final LifeArea area;
  const Checklist(
      {required this.id,
      required this.title,
      required this.items,
      required this.area});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    {
      map['items'] =
          Variable<String>($ChecklistsTable.$converteritems.toSql(items));
    }
    {
      map['area'] =
          Variable<String>($ChecklistsTable.$converterarea.toSql(area));
    }
    return map;
  }

  ChecklistsCompanion toCompanion(bool nullToAbsent) {
    return ChecklistsCompanion(
      id: Value(id),
      title: Value(title),
      items: Value(items),
      area: Value(area),
    );
  }

  factory Checklist.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Checklist(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      items: serializer.fromJson<List<ChecklistItem>>(json['items']),
      area: $ChecklistsTable.$converterarea
          .fromJson(serializer.fromJson<String>(json['area'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'items': serializer.toJson<List<ChecklistItem>>(items),
      'area': serializer
          .toJson<String>($ChecklistsTable.$converterarea.toJson(area)),
    };
  }

  Checklist copyWith(
          {int? id,
          String? title,
          List<ChecklistItem>? items,
          LifeArea? area}) =>
      Checklist(
        id: id ?? this.id,
        title: title ?? this.title,
        items: items ?? this.items,
        area: area ?? this.area,
      );
  Checklist copyWithCompanion(ChecklistsCompanion data) {
    return Checklist(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      items: data.items.present ? data.items.value : this.items,
      area: data.area.present ? data.area.value : this.area,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Checklist(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('items: $items, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, items, area);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Checklist &&
          other.id == this.id &&
          other.title == this.title &&
          other.items == this.items &&
          other.area == this.area);
}

class ChecklistsCompanion extends UpdateCompanion<Checklist> {
  final Value<int> id;
  final Value<String> title;
  final Value<List<ChecklistItem>> items;
  final Value<LifeArea> area;
  const ChecklistsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.items = const Value.absent(),
    this.area = const Value.absent(),
  });
  ChecklistsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required List<ChecklistItem> items,
    required LifeArea area,
  })  : title = Value(title),
        items = Value(items),
        area = Value(area);
  static Insertable<Checklist> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? items,
    Expression<String>? area,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (items != null) 'items': items,
      if (area != null) 'area': area,
    });
  }

  ChecklistsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<List<ChecklistItem>>? items,
      Value<LifeArea>? area}) {
    return ChecklistsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      items: items ?? this.items,
      area: area ?? this.area,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (items.present) {
      map['items'] =
          Variable<String>($ChecklistsTable.$converteritems.toSql(items.value));
    }
    if (area.present) {
      map['area'] =
          Variable<String>($ChecklistsTable.$converterarea.toSql(area.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('items: $items, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }
}

class $MoodEntriesTable extends MoodEntries
    with TableInfo<$MoodEntriesTable, MoodEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoodEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<int> mood = GeneratedColumn<int>(
      'mood', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _energyMeta = const VerificationMeta('energy');
  @override
  late final GeneratedColumn<int> energy = GeneratedColumn<int>(
      'energy', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, mood, energy, note, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mood_entries';
  @override
  VerificationContext validateIntegrity(Insertable<MoodEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mood')) {
      context.handle(
          _moodMeta, mood.isAcceptableOrUnknown(data['mood']!, _moodMeta));
    } else if (isInserting) {
      context.missing(_moodMeta);
    }
    if (data.containsKey('energy')) {
      context.handle(_energyMeta,
          energy.isAcceptableOrUnknown(data['energy']!, _energyMeta));
    } else if (isInserting) {
      context.missing(_energyMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoodEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MoodEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mood: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mood'])!,
      energy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}energy'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $MoodEntriesTable createAlias(String alias) {
    return $MoodEntriesTable(attachedDatabase, alias);
  }
}

class MoodEntry extends DataClass implements Insertable<MoodEntry> {
  final int id;
  final int mood;
  final int energy;
  final String? note;
  final DateTime date;
  const MoodEntry(
      {required this.id,
      required this.mood,
      required this.energy,
      this.note,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mood'] = Variable<int>(mood);
    map['energy'] = Variable<int>(energy);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  MoodEntriesCompanion toCompanion(bool nullToAbsent) {
    return MoodEntriesCompanion(
      id: Value(id),
      mood: Value(mood),
      energy: Value(energy),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      date: Value(date),
    );
  }

  factory MoodEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MoodEntry(
      id: serializer.fromJson<int>(json['id']),
      mood: serializer.fromJson<int>(json['mood']),
      energy: serializer.fromJson<int>(json['energy']),
      note: serializer.fromJson<String?>(json['note']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mood': serializer.toJson<int>(mood),
      'energy': serializer.toJson<int>(energy),
      'note': serializer.toJson<String?>(note),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  MoodEntry copyWith(
          {int? id,
          int? mood,
          int? energy,
          Value<String?> note = const Value.absent(),
          DateTime? date}) =>
      MoodEntry(
        id: id ?? this.id,
        mood: mood ?? this.mood,
        energy: energy ?? this.energy,
        note: note.present ? note.value : this.note,
        date: date ?? this.date,
      );
  MoodEntry copyWithCompanion(MoodEntriesCompanion data) {
    return MoodEntry(
      id: data.id.present ? data.id.value : this.id,
      mood: data.mood.present ? data.mood.value : this.mood,
      energy: data.energy.present ? data.energy.value : this.energy,
      note: data.note.present ? data.note.value : this.note,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MoodEntry(')
          ..write('id: $id, ')
          ..write('mood: $mood, ')
          ..write('energy: $energy, ')
          ..write('note: $note, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mood, energy, note, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoodEntry &&
          other.id == this.id &&
          other.mood == this.mood &&
          other.energy == this.energy &&
          other.note == this.note &&
          other.date == this.date);
}

class MoodEntriesCompanion extends UpdateCompanion<MoodEntry> {
  final Value<int> id;
  final Value<int> mood;
  final Value<int> energy;
  final Value<String?> note;
  final Value<DateTime> date;
  const MoodEntriesCompanion({
    this.id = const Value.absent(),
    this.mood = const Value.absent(),
    this.energy = const Value.absent(),
    this.note = const Value.absent(),
    this.date = const Value.absent(),
  });
  MoodEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int mood,
    required int energy,
    this.note = const Value.absent(),
    this.date = const Value.absent(),
  })  : mood = Value(mood),
        energy = Value(energy);
  static Insertable<MoodEntry> custom({
    Expression<int>? id,
    Expression<int>? mood,
    Expression<int>? energy,
    Expression<String>? note,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mood != null) 'mood': mood,
      if (energy != null) 'energy': energy,
      if (note != null) 'note': note,
      if (date != null) 'date': date,
    });
  }

  MoodEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? mood,
      Value<int>? energy,
      Value<String?>? note,
      Value<DateTime>? date}) {
    return MoodEntriesCompanion(
      id: id ?? this.id,
      mood: mood ?? this.mood,
      energy: energy ?? this.energy,
      note: note ?? this.note,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mood.present) {
      map['mood'] = Variable<int>(mood.value);
    }
    if (energy.present) {
      map['energy'] = Variable<int>(energy.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoodEntriesCompanion(')
          ..write('id: $id, ')
          ..write('mood: $mood, ')
          ..write('energy: $energy, ')
          ..write('note: $note, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $HealthEntriesTable extends HealthEntries
    with TableInfo<$HealthEntriesTable, HealthEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HealthEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sleepHoursMeta =
      const VerificationMeta('sleepHours');
  @override
  late final GeneratedColumn<double> sleepHours = GeneratedColumn<double>(
      'sleep_hours', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _waterCupsMeta =
      const VerificationMeta('waterCups');
  @override
  late final GeneratedColumn<int> waterCups = GeneratedColumn<int>(
      'water_cups', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _exerciseMinutesMeta =
      const VerificationMeta('exerciseMinutes');
  @override
  late final GeneratedColumn<int> exerciseMinutes = GeneratedColumn<int>(
      'exercise_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sleepHours, waterCups, exerciseMinutes, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'health_entries';
  @override
  VerificationContext validateIntegrity(Insertable<HealthEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sleep_hours')) {
      context.handle(
          _sleepHoursMeta,
          sleepHours.isAcceptableOrUnknown(
              data['sleep_hours']!, _sleepHoursMeta));
    } else if (isInserting) {
      context.missing(_sleepHoursMeta);
    }
    if (data.containsKey('water_cups')) {
      context.handle(_waterCupsMeta,
          waterCups.isAcceptableOrUnknown(data['water_cups']!, _waterCupsMeta));
    } else if (isInserting) {
      context.missing(_waterCupsMeta);
    }
    if (data.containsKey('exercise_minutes')) {
      context.handle(
          _exerciseMinutesMeta,
          exerciseMinutes.isAcceptableOrUnknown(
              data['exercise_minutes']!, _exerciseMinutesMeta));
    } else if (isInserting) {
      context.missing(_exerciseMinutesMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HealthEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HealthEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sleepHours: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sleep_hours'])!,
      waterCups: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}water_cups'])!,
      exerciseMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exercise_minutes'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $HealthEntriesTable createAlias(String alias) {
    return $HealthEntriesTable(attachedDatabase, alias);
  }
}

class HealthEntry extends DataClass implements Insertable<HealthEntry> {
  final int id;
  final double sleepHours;
  final int waterCups;
  final int exerciseMinutes;
  final DateTime date;
  const HealthEntry(
      {required this.id,
      required this.sleepHours,
      required this.waterCups,
      required this.exerciseMinutes,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sleep_hours'] = Variable<double>(sleepHours);
    map['water_cups'] = Variable<int>(waterCups);
    map['exercise_minutes'] = Variable<int>(exerciseMinutes);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  HealthEntriesCompanion toCompanion(bool nullToAbsent) {
    return HealthEntriesCompanion(
      id: Value(id),
      sleepHours: Value(sleepHours),
      waterCups: Value(waterCups),
      exerciseMinutes: Value(exerciseMinutes),
      date: Value(date),
    );
  }

  factory HealthEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HealthEntry(
      id: serializer.fromJson<int>(json['id']),
      sleepHours: serializer.fromJson<double>(json['sleepHours']),
      waterCups: serializer.fromJson<int>(json['waterCups']),
      exerciseMinutes: serializer.fromJson<int>(json['exerciseMinutes']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sleepHours': serializer.toJson<double>(sleepHours),
      'waterCups': serializer.toJson<int>(waterCups),
      'exerciseMinutes': serializer.toJson<int>(exerciseMinutes),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  HealthEntry copyWith(
          {int? id,
          double? sleepHours,
          int? waterCups,
          int? exerciseMinutes,
          DateTime? date}) =>
      HealthEntry(
        id: id ?? this.id,
        sleepHours: sleepHours ?? this.sleepHours,
        waterCups: waterCups ?? this.waterCups,
        exerciseMinutes: exerciseMinutes ?? this.exerciseMinutes,
        date: date ?? this.date,
      );
  HealthEntry copyWithCompanion(HealthEntriesCompanion data) {
    return HealthEntry(
      id: data.id.present ? data.id.value : this.id,
      sleepHours:
          data.sleepHours.present ? data.sleepHours.value : this.sleepHours,
      waterCups: data.waterCups.present ? data.waterCups.value : this.waterCups,
      exerciseMinutes: data.exerciseMinutes.present
          ? data.exerciseMinutes.value
          : this.exerciseMinutes,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HealthEntry(')
          ..write('id: $id, ')
          ..write('sleepHours: $sleepHours, ')
          ..write('waterCups: $waterCups, ')
          ..write('exerciseMinutes: $exerciseMinutes, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sleepHours, waterCups, exerciseMinutes, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HealthEntry &&
          other.id == this.id &&
          other.sleepHours == this.sleepHours &&
          other.waterCups == this.waterCups &&
          other.exerciseMinutes == this.exerciseMinutes &&
          other.date == this.date);
}

class HealthEntriesCompanion extends UpdateCompanion<HealthEntry> {
  final Value<int> id;
  final Value<double> sleepHours;
  final Value<int> waterCups;
  final Value<int> exerciseMinutes;
  final Value<DateTime> date;
  const HealthEntriesCompanion({
    this.id = const Value.absent(),
    this.sleepHours = const Value.absent(),
    this.waterCups = const Value.absent(),
    this.exerciseMinutes = const Value.absent(),
    this.date = const Value.absent(),
  });
  HealthEntriesCompanion.insert({
    this.id = const Value.absent(),
    required double sleepHours,
    required int waterCups,
    required int exerciseMinutes,
    this.date = const Value.absent(),
  })  : sleepHours = Value(sleepHours),
        waterCups = Value(waterCups),
        exerciseMinutes = Value(exerciseMinutes);
  static Insertable<HealthEntry> custom({
    Expression<int>? id,
    Expression<double>? sleepHours,
    Expression<int>? waterCups,
    Expression<int>? exerciseMinutes,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sleepHours != null) 'sleep_hours': sleepHours,
      if (waterCups != null) 'water_cups': waterCups,
      if (exerciseMinutes != null) 'exercise_minutes': exerciseMinutes,
      if (date != null) 'date': date,
    });
  }

  HealthEntriesCompanion copyWith(
      {Value<int>? id,
      Value<double>? sleepHours,
      Value<int>? waterCups,
      Value<int>? exerciseMinutes,
      Value<DateTime>? date}) {
    return HealthEntriesCompanion(
      id: id ?? this.id,
      sleepHours: sleepHours ?? this.sleepHours,
      waterCups: waterCups ?? this.waterCups,
      exerciseMinutes: exerciseMinutes ?? this.exerciseMinutes,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sleepHours.present) {
      map['sleep_hours'] = Variable<double>(sleepHours.value);
    }
    if (waterCups.present) {
      map['water_cups'] = Variable<int>(waterCups.value);
    }
    if (exerciseMinutes.present) {
      map['exercise_minutes'] = Variable<int>(exerciseMinutes.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HealthEntriesCompanion(')
          ..write('id: $id, ')
          ..write('sleepHours: $sleepHours, ')
          ..write('waterCups: $waterCups, ')
          ..write('exerciseMinutes: $exerciseMinutes, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $HabitsTable habits = $HabitsTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $CalendarEventsTable calendarEvents = $CalendarEventsTable(this);
  late final $NotesTable notes = $NotesTable(this);
  late final $ChecklistsTable checklists = $ChecklistsTable(this);
  late final $MoodEntriesTable moodEntries = $MoodEntriesTable(this);
  late final $HealthEntriesTable healthEntries = $HealthEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        tasks,
        habits,
        goals,
        calendarEvents,
        notes,
        checklists,
        moodEntries,
        healthEntries
      ];
}

typedef $$TasksTableCreateCompanionBuilder = TasksCompanion Function({
  Value<int> id,
  required String title,
  Value<String?> description,
  required TaskPriority priority,
  required TaskStatus status,
  Value<DateTime?> dueDate,
  required LifeArea area,
  Value<RecurrenceRule?> recurrence,
  Value<Reminder?> reminder,
  required List<SubTask> subtasks,
  Value<DateTime> createdAt,
});
typedef $$TasksTableUpdateCompanionBuilder = TasksCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> description,
  Value<TaskPriority> priority,
  Value<TaskStatus> status,
  Value<DateTime?> dueDate,
  Value<LifeArea> area,
  Value<RecurrenceRule?> recurrence,
  Value<Reminder?> reminder,
  Value<List<SubTask>> subtasks,
  Value<DateTime> createdAt,
});

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<TaskPriority, TaskPriority, String>
      get priority => $composableBuilder(
          column: $table.priority,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<TaskStatus, TaskStatus, String> get status =>
      $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LifeArea, LifeArea, String> get area =>
      $composableBuilder(
          column: $table.area,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<RecurrenceRule?, RecurrenceRule, String>
      get recurrence => $composableBuilder(
          column: $table.recurrence,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Reminder?, Reminder, String> get reminder =>
      $composableBuilder(
          column: $table.reminder,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<SubTask>, List<SubTask>, String>
      get subtasks => $composableBuilder(
          column: $table.subtasks,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get area => $composableBuilder(
      column: $table.area, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recurrence => $composableBuilder(
      column: $table.recurrence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reminder => $composableBuilder(
      column: $table.reminder, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subtasks => $composableBuilder(
      column: $table.subtasks, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TaskPriority, String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TaskStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LifeArea, String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumnWithTypeConverter<RecurrenceRule?, String> get recurrence =>
      $composableBuilder(
          column: $table.recurrence, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Reminder?, String> get reminder =>
      $composableBuilder(column: $table.reminder, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<SubTask>, String> get subtasks =>
      $composableBuilder(column: $table.subtasks, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TasksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TasksTable,
    Task,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableAnnotationComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
    Task,
    PrefetchHooks Function()> {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<TaskPriority> priority = const Value.absent(),
            Value<TaskStatus> status = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<LifeArea> area = const Value.absent(),
            Value<RecurrenceRule?> recurrence = const Value.absent(),
            Value<Reminder?> reminder = const Value.absent(),
            Value<List<SubTask>> subtasks = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TasksCompanion(
            id: id,
            title: title,
            description: description,
            priority: priority,
            status: status,
            dueDate: dueDate,
            area: area,
            recurrence: recurrence,
            reminder: reminder,
            subtasks: subtasks,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
            required TaskPriority priority,
            required TaskStatus status,
            Value<DateTime?> dueDate = const Value.absent(),
            required LifeArea area,
            Value<RecurrenceRule?> recurrence = const Value.absent(),
            Value<Reminder?> reminder = const Value.absent(),
            required List<SubTask> subtasks,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TasksCompanion.insert(
            id: id,
            title: title,
            description: description,
            priority: priority,
            status: status,
            dueDate: dueDate,
            area: area,
            recurrence: recurrence,
            reminder: reminder,
            subtasks: subtasks,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TasksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TasksTable,
    Task,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableAnnotationComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
    Task,
    PrefetchHooks Function()>;
typedef $$HabitsTableCreateCompanionBuilder = HabitsCompanion Function({
  Value<int> id,
  required String title,
  Value<String?> description,
  Value<RecurrenceRule?> recurrence,
  required LifeArea area,
  Value<int> currentStreak,
  Value<int> bestStreak,
  Value<int> graceDays,
  Value<bool> catchUpAllowed,
  Value<Reminder?> reminder,
});
typedef $$HabitsTableUpdateCompanionBuilder = HabitsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> description,
  Value<RecurrenceRule?> recurrence,
  Value<LifeArea> area,
  Value<int> currentStreak,
  Value<int> bestStreak,
  Value<int> graceDays,
  Value<bool> catchUpAllowed,
  Value<Reminder?> reminder,
});

class $$HabitsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<RecurrenceRule?, RecurrenceRule, String>
      get recurrence => $composableBuilder(
          column: $table.recurrence,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<LifeArea, LifeArea, String> get area =>
      $composableBuilder(
          column: $table.area,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get currentStreak => $composableBuilder(
      column: $table.currentStreak, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bestStreak => $composableBuilder(
      column: $table.bestStreak, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get graceDays => $composableBuilder(
      column: $table.graceDays, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get catchUpAllowed => $composableBuilder(
      column: $table.catchUpAllowed,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Reminder?, Reminder, String> get reminder =>
      $composableBuilder(
          column: $table.reminder,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$HabitsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recurrence => $composableBuilder(
      column: $table.recurrence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get area => $composableBuilder(
      column: $table.area, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentStreak => $composableBuilder(
      column: $table.currentStreak,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bestStreak => $composableBuilder(
      column: $table.bestStreak, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get graceDays => $composableBuilder(
      column: $table.graceDays, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get catchUpAllowed => $composableBuilder(
      column: $table.catchUpAllowed,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reminder => $composableBuilder(
      column: $table.reminder, builder: (column) => ColumnOrderings(column));
}

class $$HabitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumnWithTypeConverter<RecurrenceRule?, String> get recurrence =>
      $composableBuilder(
          column: $table.recurrence, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LifeArea, String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<int> get currentStreak => $composableBuilder(
      column: $table.currentStreak, builder: (column) => column);

  GeneratedColumn<int> get bestStreak => $composableBuilder(
      column: $table.bestStreak, builder: (column) => column);

  GeneratedColumn<int> get graceDays =>
      $composableBuilder(column: $table.graceDays, builder: (column) => column);

  GeneratedColumn<bool> get catchUpAllowed => $composableBuilder(
      column: $table.catchUpAllowed, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Reminder?, String> get reminder =>
      $composableBuilder(column: $table.reminder, builder: (column) => column);
}

class $$HabitsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HabitsTable,
    Habit,
    $$HabitsTableFilterComposer,
    $$HabitsTableOrderingComposer,
    $$HabitsTableAnnotationComposer,
    $$HabitsTableCreateCompanionBuilder,
    $$HabitsTableUpdateCompanionBuilder,
    (Habit, BaseReferences<_$AppDatabase, $HabitsTable, Habit>),
    Habit,
    PrefetchHooks Function()> {
  $$HabitsTableTableManager(_$AppDatabase db, $HabitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<RecurrenceRule?> recurrence = const Value.absent(),
            Value<LifeArea> area = const Value.absent(),
            Value<int> currentStreak = const Value.absent(),
            Value<int> bestStreak = const Value.absent(),
            Value<int> graceDays = const Value.absent(),
            Value<bool> catchUpAllowed = const Value.absent(),
            Value<Reminder?> reminder = const Value.absent(),
          }) =>
              HabitsCompanion(
            id: id,
            title: title,
            description: description,
            recurrence: recurrence,
            area: area,
            currentStreak: currentStreak,
            bestStreak: bestStreak,
            graceDays: graceDays,
            catchUpAllowed: catchUpAllowed,
            reminder: reminder,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
            Value<RecurrenceRule?> recurrence = const Value.absent(),
            required LifeArea area,
            Value<int> currentStreak = const Value.absent(),
            Value<int> bestStreak = const Value.absent(),
            Value<int> graceDays = const Value.absent(),
            Value<bool> catchUpAllowed = const Value.absent(),
            Value<Reminder?> reminder = const Value.absent(),
          }) =>
              HabitsCompanion.insert(
            id: id,
            title: title,
            description: description,
            recurrence: recurrence,
            area: area,
            currentStreak: currentStreak,
            bestStreak: bestStreak,
            graceDays: graceDays,
            catchUpAllowed: catchUpAllowed,
            reminder: reminder,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HabitsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HabitsTable,
    Habit,
    $$HabitsTableFilterComposer,
    $$HabitsTableOrderingComposer,
    $$HabitsTableAnnotationComposer,
    $$HabitsTableCreateCompanionBuilder,
    $$HabitsTableUpdateCompanionBuilder,
    (Habit, BaseReferences<_$AppDatabase, $HabitsTable, Habit>),
    Habit,
    PrefetchHooks Function()>;
typedef $$GoalsTableCreateCompanionBuilder = GoalsCompanion Function({
  Value<int> id,
  required String title,
  Value<String?> description,
  required LifeArea area,
  Value<int> weeklyTarget,
  Value<int> progress,
  required List<GoalMilestone> milestones,
});
typedef $$GoalsTableUpdateCompanionBuilder = GoalsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> description,
  Value<LifeArea> area,
  Value<int> weeklyTarget,
  Value<int> progress,
  Value<List<GoalMilestone>> milestones,
});

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LifeArea, LifeArea, String> get area =>
      $composableBuilder(
          column: $table.area,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get weeklyTarget => $composableBuilder(
      column: $table.weeklyTarget, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<GoalMilestone>, List<GoalMilestone>,
          String>
      get milestones => $composableBuilder(
          column: $table.milestones,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get area => $composableBuilder(
      column: $table.area, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get weeklyTarget => $composableBuilder(
      column: $table.weeklyTarget,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get milestones => $composableBuilder(
      column: $table.milestones, builder: (column) => ColumnOrderings(column));
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LifeArea, String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<int> get weeklyTarget => $composableBuilder(
      column: $table.weeklyTarget, builder: (column) => column);

  GeneratedColumn<int> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<GoalMilestone>, String>
      get milestones => $composableBuilder(
          column: $table.milestones, builder: (column) => column);
}

class $$GoalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GoalsTable,
    Goal,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableAnnotationComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (Goal, BaseReferences<_$AppDatabase, $GoalsTable, Goal>),
    Goal,
    PrefetchHooks Function()> {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<LifeArea> area = const Value.absent(),
            Value<int> weeklyTarget = const Value.absent(),
            Value<int> progress = const Value.absent(),
            Value<List<GoalMilestone>> milestones = const Value.absent(),
          }) =>
              GoalsCompanion(
            id: id,
            title: title,
            description: description,
            area: area,
            weeklyTarget: weeklyTarget,
            progress: progress,
            milestones: milestones,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
            required LifeArea area,
            Value<int> weeklyTarget = const Value.absent(),
            Value<int> progress = const Value.absent(),
            required List<GoalMilestone> milestones,
          }) =>
              GoalsCompanion.insert(
            id: id,
            title: title,
            description: description,
            area: area,
            weeklyTarget: weeklyTarget,
            progress: progress,
            milestones: milestones,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GoalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GoalsTable,
    Goal,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableAnnotationComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (Goal, BaseReferences<_$AppDatabase, $GoalsTable, Goal>),
    Goal,
    PrefetchHooks Function()>;
typedef $$CalendarEventsTableCreateCompanionBuilder = CalendarEventsCompanion
    Function({
  Value<int> id,
  required String title,
  Value<String?> description,
  required DateTime start,
  required DateTime end,
  required LifeArea area,
  Value<String?> location,
  Value<int> travelBufferMinutes,
});
typedef $$CalendarEventsTableUpdateCompanionBuilder = CalendarEventsCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<String?> description,
  Value<DateTime> start,
  Value<DateTime> end,
  Value<LifeArea> area,
  Value<String?> location,
  Value<int> travelBufferMinutes,
});

class $$CalendarEventsTableFilterComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get start => $composableBuilder(
      column: $table.start, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get end => $composableBuilder(
      column: $table.end, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LifeArea, LifeArea, String> get area =>
      $composableBuilder(
          column: $table.area,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get travelBufferMinutes => $composableBuilder(
      column: $table.travelBufferMinutes,
      builder: (column) => ColumnFilters(column));
}

class $$CalendarEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get start => $composableBuilder(
      column: $table.start, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get end => $composableBuilder(
      column: $table.end, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get area => $composableBuilder(
      column: $table.area, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get travelBufferMinutes => $composableBuilder(
      column: $table.travelBufferMinutes,
      builder: (column) => ColumnOrderings(column));
}

class $$CalendarEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get start =>
      $composableBuilder(column: $table.start, builder: (column) => column);

  GeneratedColumn<DateTime> get end =>
      $composableBuilder(column: $table.end, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LifeArea, String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<int> get travelBufferMinutes => $composableBuilder(
      column: $table.travelBufferMinutes, builder: (column) => column);
}

class $$CalendarEventsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CalendarEventsTable,
    CalendarEvent,
    $$CalendarEventsTableFilterComposer,
    $$CalendarEventsTableOrderingComposer,
    $$CalendarEventsTableAnnotationComposer,
    $$CalendarEventsTableCreateCompanionBuilder,
    $$CalendarEventsTableUpdateCompanionBuilder,
    (
      CalendarEvent,
      BaseReferences<_$AppDatabase, $CalendarEventsTable, CalendarEvent>
    ),
    CalendarEvent,
    PrefetchHooks Function()> {
  $$CalendarEventsTableTableManager(
      _$AppDatabase db, $CalendarEventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> start = const Value.absent(),
            Value<DateTime> end = const Value.absent(),
            Value<LifeArea> area = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<int> travelBufferMinutes = const Value.absent(),
          }) =>
              CalendarEventsCompanion(
            id: id,
            title: title,
            description: description,
            start: start,
            end: end,
            area: area,
            location: location,
            travelBufferMinutes: travelBufferMinutes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
            required DateTime start,
            required DateTime end,
            required LifeArea area,
            Value<String?> location = const Value.absent(),
            Value<int> travelBufferMinutes = const Value.absent(),
          }) =>
              CalendarEventsCompanion.insert(
            id: id,
            title: title,
            description: description,
            start: start,
            end: end,
            area: area,
            location: location,
            travelBufferMinutes: travelBufferMinutes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CalendarEventsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CalendarEventsTable,
    CalendarEvent,
    $$CalendarEventsTableFilterComposer,
    $$CalendarEventsTableOrderingComposer,
    $$CalendarEventsTableAnnotationComposer,
    $$CalendarEventsTableCreateCompanionBuilder,
    $$CalendarEventsTableUpdateCompanionBuilder,
    (
      CalendarEvent,
      BaseReferences<_$AppDatabase, $CalendarEventsTable, CalendarEvent>
    ),
    CalendarEvent,
    PrefetchHooks Function()>;
typedef $$NotesTableCreateCompanionBuilder = NotesCompanion Function({
  Value<int> id,
  required String title,
  required String content,
  required LifeArea area,
  Value<DateTime> createdAt,
});
typedef $$NotesTableUpdateCompanionBuilder = NotesCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> content,
  Value<LifeArea> area,
  Value<DateTime> createdAt,
});

class $$NotesTableFilterComposer extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<LifeArea, LifeArea, String> get area =>
      $composableBuilder(
          column: $table.area,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$NotesTableOrderingComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get area => $composableBuilder(
      column: $table.area, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$NotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LifeArea, String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$NotesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotesTable,
    Note,
    $$NotesTableFilterComposer,
    $$NotesTableOrderingComposer,
    $$NotesTableAnnotationComposer,
    $$NotesTableCreateCompanionBuilder,
    $$NotesTableUpdateCompanionBuilder,
    (Note, BaseReferences<_$AppDatabase, $NotesTable, Note>),
    Note,
    PrefetchHooks Function()> {
  $$NotesTableTableManager(_$AppDatabase db, $NotesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<LifeArea> area = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              NotesCompanion(
            id: id,
            title: title,
            content: content,
            area: area,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String content,
            required LifeArea area,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              NotesCompanion.insert(
            id: id,
            title: title,
            content: content,
            area: area,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NotesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NotesTable,
    Note,
    $$NotesTableFilterComposer,
    $$NotesTableOrderingComposer,
    $$NotesTableAnnotationComposer,
    $$NotesTableCreateCompanionBuilder,
    $$NotesTableUpdateCompanionBuilder,
    (Note, BaseReferences<_$AppDatabase, $NotesTable, Note>),
    Note,
    PrefetchHooks Function()>;
typedef $$ChecklistsTableCreateCompanionBuilder = ChecklistsCompanion Function({
  Value<int> id,
  required String title,
  required List<ChecklistItem> items,
  required LifeArea area,
});
typedef $$ChecklistsTableUpdateCompanionBuilder = ChecklistsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<List<ChecklistItem>> items,
  Value<LifeArea> area,
});

class $$ChecklistsTableFilterComposer
    extends Composer<_$AppDatabase, $ChecklistsTable> {
  $$ChecklistsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<ChecklistItem>, List<ChecklistItem>,
          String>
      get items => $composableBuilder(
          column: $table.items,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<LifeArea, LifeArea, String> get area =>
      $composableBuilder(
          column: $table.area,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$ChecklistsTableOrderingComposer
    extends Composer<_$AppDatabase, $ChecklistsTable> {
  $$ChecklistsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get items => $composableBuilder(
      column: $table.items, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get area => $composableBuilder(
      column: $table.area, builder: (column) => ColumnOrderings(column));
}

class $$ChecklistsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChecklistsTable> {
  $$ChecklistsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<ChecklistItem>, String> get items =>
      $composableBuilder(column: $table.items, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LifeArea, String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);
}

class $$ChecklistsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChecklistsTable,
    Checklist,
    $$ChecklistsTableFilterComposer,
    $$ChecklistsTableOrderingComposer,
    $$ChecklistsTableAnnotationComposer,
    $$ChecklistsTableCreateCompanionBuilder,
    $$ChecklistsTableUpdateCompanionBuilder,
    (Checklist, BaseReferences<_$AppDatabase, $ChecklistsTable, Checklist>),
    Checklist,
    PrefetchHooks Function()> {
  $$ChecklistsTableTableManager(_$AppDatabase db, $ChecklistsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChecklistsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChecklistsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChecklistsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<List<ChecklistItem>> items = const Value.absent(),
            Value<LifeArea> area = const Value.absent(),
          }) =>
              ChecklistsCompanion(
            id: id,
            title: title,
            items: items,
            area: area,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required List<ChecklistItem> items,
            required LifeArea area,
          }) =>
              ChecklistsCompanion.insert(
            id: id,
            title: title,
            items: items,
            area: area,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ChecklistsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ChecklistsTable,
    Checklist,
    $$ChecklistsTableFilterComposer,
    $$ChecklistsTableOrderingComposer,
    $$ChecklistsTableAnnotationComposer,
    $$ChecklistsTableCreateCompanionBuilder,
    $$ChecklistsTableUpdateCompanionBuilder,
    (Checklist, BaseReferences<_$AppDatabase, $ChecklistsTable, Checklist>),
    Checklist,
    PrefetchHooks Function()>;
typedef $$MoodEntriesTableCreateCompanionBuilder = MoodEntriesCompanion
    Function({
  Value<int> id,
  required int mood,
  required int energy,
  Value<String?> note,
  Value<DateTime> date,
});
typedef $$MoodEntriesTableUpdateCompanionBuilder = MoodEntriesCompanion
    Function({
  Value<int> id,
  Value<int> mood,
  Value<int> energy,
  Value<String?> note,
  Value<DateTime> date,
});

class $$MoodEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $MoodEntriesTable> {
  $$MoodEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get mood => $composableBuilder(
      column: $table.mood, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get energy => $composableBuilder(
      column: $table.energy, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));
}

class $$MoodEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $MoodEntriesTable> {
  $$MoodEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get mood => $composableBuilder(
      column: $table.mood, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get energy => $composableBuilder(
      column: $table.energy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));
}

class $$MoodEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MoodEntriesTable> {
  $$MoodEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumn<int> get energy =>
      $composableBuilder(column: $table.energy, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$MoodEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MoodEntriesTable,
    MoodEntry,
    $$MoodEntriesTableFilterComposer,
    $$MoodEntriesTableOrderingComposer,
    $$MoodEntriesTableAnnotationComposer,
    $$MoodEntriesTableCreateCompanionBuilder,
    $$MoodEntriesTableUpdateCompanionBuilder,
    (MoodEntry, BaseReferences<_$AppDatabase, $MoodEntriesTable, MoodEntry>),
    MoodEntry,
    PrefetchHooks Function()> {
  $$MoodEntriesTableTableManager(_$AppDatabase db, $MoodEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MoodEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MoodEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MoodEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> mood = const Value.absent(),
            Value<int> energy = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              MoodEntriesCompanion(
            id: id,
            mood: mood,
            energy: energy,
            note: note,
            date: date,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int mood,
            required int energy,
            Value<String?> note = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              MoodEntriesCompanion.insert(
            id: id,
            mood: mood,
            energy: energy,
            note: note,
            date: date,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MoodEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MoodEntriesTable,
    MoodEntry,
    $$MoodEntriesTableFilterComposer,
    $$MoodEntriesTableOrderingComposer,
    $$MoodEntriesTableAnnotationComposer,
    $$MoodEntriesTableCreateCompanionBuilder,
    $$MoodEntriesTableUpdateCompanionBuilder,
    (MoodEntry, BaseReferences<_$AppDatabase, $MoodEntriesTable, MoodEntry>),
    MoodEntry,
    PrefetchHooks Function()>;
typedef $$HealthEntriesTableCreateCompanionBuilder = HealthEntriesCompanion
    Function({
  Value<int> id,
  required double sleepHours,
  required int waterCups,
  required int exerciseMinutes,
  Value<DateTime> date,
});
typedef $$HealthEntriesTableUpdateCompanionBuilder = HealthEntriesCompanion
    Function({
  Value<int> id,
  Value<double> sleepHours,
  Value<int> waterCups,
  Value<int> exerciseMinutes,
  Value<DateTime> date,
});

class $$HealthEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $HealthEntriesTable> {
  $$HealthEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sleepHours => $composableBuilder(
      column: $table.sleepHours, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get waterCups => $composableBuilder(
      column: $table.waterCups, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get exerciseMinutes => $composableBuilder(
      column: $table.exerciseMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));
}

class $$HealthEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $HealthEntriesTable> {
  $$HealthEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sleepHours => $composableBuilder(
      column: $table.sleepHours, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get waterCups => $composableBuilder(
      column: $table.waterCups, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get exerciseMinutes => $composableBuilder(
      column: $table.exerciseMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));
}

class $$HealthEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $HealthEntriesTable> {
  $$HealthEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get sleepHours => $composableBuilder(
      column: $table.sleepHours, builder: (column) => column);

  GeneratedColumn<int> get waterCups =>
      $composableBuilder(column: $table.waterCups, builder: (column) => column);

  GeneratedColumn<int> get exerciseMinutes => $composableBuilder(
      column: $table.exerciseMinutes, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$HealthEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HealthEntriesTable,
    HealthEntry,
    $$HealthEntriesTableFilterComposer,
    $$HealthEntriesTableOrderingComposer,
    $$HealthEntriesTableAnnotationComposer,
    $$HealthEntriesTableCreateCompanionBuilder,
    $$HealthEntriesTableUpdateCompanionBuilder,
    (
      HealthEntry,
      BaseReferences<_$AppDatabase, $HealthEntriesTable, HealthEntry>
    ),
    HealthEntry,
    PrefetchHooks Function()> {
  $$HealthEntriesTableTableManager(_$AppDatabase db, $HealthEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HealthEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HealthEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HealthEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> sleepHours = const Value.absent(),
            Value<int> waterCups = const Value.absent(),
            Value<int> exerciseMinutes = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              HealthEntriesCompanion(
            id: id,
            sleepHours: sleepHours,
            waterCups: waterCups,
            exerciseMinutes: exerciseMinutes,
            date: date,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double sleepHours,
            required int waterCups,
            required int exerciseMinutes,
            Value<DateTime> date = const Value.absent(),
          }) =>
              HealthEntriesCompanion.insert(
            id: id,
            sleepHours: sleepHours,
            waterCups: waterCups,
            exerciseMinutes: exerciseMinutes,
            date: date,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HealthEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HealthEntriesTable,
    HealthEntry,
    $$HealthEntriesTableFilterComposer,
    $$HealthEntriesTableOrderingComposer,
    $$HealthEntriesTableAnnotationComposer,
    $$HealthEntriesTableCreateCompanionBuilder,
    $$HealthEntriesTableUpdateCompanionBuilder,
    (
      HealthEntry,
      BaseReferences<_$AppDatabase, $HealthEntriesTable, HealthEntry>
    ),
    HealthEntry,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$HabitsTableTableManager get habits =>
      $$HabitsTableTableManager(_db, _db.habits);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$CalendarEventsTableTableManager get calendarEvents =>
      $$CalendarEventsTableTableManager(_db, _db.calendarEvents);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
  $$ChecklistsTableTableManager get checklists =>
      $$ChecklistsTableTableManager(_db, _db.checklists);
  $$MoodEntriesTableTableManager get moodEntries =>
      $$MoodEntriesTableTableManager(_db, _db.moodEntries);
  $$HealthEntriesTableTableManager get healthEntries =>
      $$HealthEntriesTableTableManager(_db, _db.healthEntries);
}
