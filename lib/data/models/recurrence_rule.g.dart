// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurrence_rule.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RecurrenceRuleSchema = Schema(
  name: r'RecurrenceRule',
  id: 5257982281863433741,
  properties: {
    r'endsOn': PropertySchema(
      id: 0,
      name: r'endsOn',
      type: IsarType.dateTime,
    ),
    r'frequency': PropertySchema(
      id: 1,
      name: r'frequency',
      type: IsarType.string,
      enumMap: _RecurrenceRulefrequencyEnumValueMap,
    ),
    r'interval': PropertySchema(
      id: 2,
      name: r'interval',
      type: IsarType.long,
    ),
    r'label': PropertySchema(
      id: 3,
      name: r'label',
      type: IsarType.string,
    ),
    r'weekdays': PropertySchema(
      id: 4,
      name: r'weekdays',
      type: IsarType.longList,
    )
  },
  estimateSize: _recurrenceRuleEstimateSize,
  serialize: _recurrenceRuleSerialize,
  deserialize: _recurrenceRuleDeserialize,
  deserializeProp: _recurrenceRuleDeserializeProp,
);

int _recurrenceRuleEstimateSize(
  RecurrenceRule object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.frequency.name.length * 3;
  bytesCount += 3 + object.label.length * 3;
  bytesCount += 3 + object.weekdays.length * 8;
  return bytesCount;
}

void _recurrenceRuleSerialize(
  RecurrenceRule object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.endsOn);
  writer.writeString(offsets[1], object.frequency.name);
  writer.writeLong(offsets[2], object.interval);
  writer.writeString(offsets[3], object.label);
  writer.writeLongList(offsets[4], object.weekdays);
}

RecurrenceRule _recurrenceRuleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecurrenceRule(
    endsOn: reader.readDateTimeOrNull(offsets[0]),
    frequency: _RecurrenceRulefrequencyValueEnumMap[
            reader.readStringOrNull(offsets[1])] ??
        RecurrenceFrequency.none,
    interval: reader.readLongOrNull(offsets[2]) ?? 1,
    weekdays: reader.readLongList(offsets[4]) ?? const [],
  );
  return object;
}

P _recurrenceRuleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (_RecurrenceRulefrequencyValueEnumMap[
              reader.readStringOrNull(offset)] ??
          RecurrenceFrequency.none) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLongList(offset) ?? const []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RecurrenceRulefrequencyEnumValueMap = {
  r'none': r'none',
  r'daily': r'daily',
  r'weekly': r'weekly',
  r'monthly': r'monthly',
  r'custom': r'custom',
};
const _RecurrenceRulefrequencyValueEnumMap = {
  r'none': RecurrenceFrequency.none,
  r'daily': RecurrenceFrequency.daily,
  r'weekly': RecurrenceFrequency.weekly,
  r'monthly': RecurrenceFrequency.monthly,
  r'custom': RecurrenceFrequency.custom,
};

extension RecurrenceRuleQueryFilter
    on QueryBuilder<RecurrenceRule, RecurrenceRule, QFilterCondition> {
  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      endsOnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endsOn',
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      endsOnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endsOn',
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      endsOnEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endsOn',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      endsOnGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endsOn',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      endsOnLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endsOn',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      endsOnBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endsOn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      frequencyEqualTo(
    RecurrenceFrequency value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      frequencyGreaterThan(
    RecurrenceFrequency value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      frequencyLessThan(
    RecurrenceFrequency value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      frequencyBetween(
    RecurrenceFrequency lower,
    RecurrenceFrequency upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frequency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      frequencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      frequencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      frequencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      frequencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frequency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      frequencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frequency',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      frequencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frequency',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      intervalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      intervalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      intervalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      intervalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      labelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      labelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      labelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      labelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      labelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      labelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      weekdaysElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekdays',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      weekdaysElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weekdays',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      weekdaysElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weekdays',
        value: value,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      weekdaysElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weekdays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      weekdaysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekdays',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      weekdaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekdays',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      weekdaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekdays',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      weekdaysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekdays',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      weekdaysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekdays',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecurrenceRule, RecurrenceRule, QAfterFilterCondition>
      weekdaysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekdays',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension RecurrenceRuleQueryObject
    on QueryBuilder<RecurrenceRule, RecurrenceRule, QFilterCondition> {}
