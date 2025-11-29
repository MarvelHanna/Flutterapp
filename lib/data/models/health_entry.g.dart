// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_entry.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHealthEntryCollection on Isar {
  IsarCollection<HealthEntry> get healthEntrys => this.collection();
}

const HealthEntrySchema = CollectionSchema(
  name: r'HealthEntry',
  id: -643552396761949885,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'sleepHours': PropertySchema(
      id: 1,
      name: r'sleepHours',
      type: IsarType.double,
    ),
    r'waterCups': PropertySchema(
      id: 2,
      name: r'waterCups',
      type: IsarType.long,
    )
  },
  estimateSize: _healthEntryEstimateSize,
  serialize: _healthEntrySerialize,
  deserialize: _healthEntryDeserialize,
  deserializeProp: _healthEntryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _healthEntryGetId,
  getLinks: _healthEntryGetLinks,
  attach: _healthEntryAttach,
  version: '3.1.0+1',
);

int _healthEntryEstimateSize(
  HealthEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _healthEntrySerialize(
  HealthEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeDouble(offsets[1], object.sleepHours);
  writer.writeLong(offsets[2], object.waterCups);
}

HealthEntry _healthEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HealthEntry(
    date: reader.readDateTime(offsets[0]),
    id: id,
    sleepHours: reader.readDoubleOrNull(offsets[1]) ?? 7,
    waterCups: reader.readLongOrNull(offsets[2]) ?? 8,
  );
  return object;
}

P _healthEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset) ?? 7) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 8) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _healthEntryGetId(HealthEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _healthEntryGetLinks(HealthEntry object) {
  return [];
}

void _healthEntryAttach(
    IsarCollection<dynamic> col, Id id, HealthEntry object) {
  object.id = id;
}

extension HealthEntryQueryWhereSort
    on QueryBuilder<HealthEntry, HealthEntry, QWhere> {
  QueryBuilder<HealthEntry, HealthEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HealthEntryQueryWhere
    on QueryBuilder<HealthEntry, HealthEntry, QWhereClause> {
  QueryBuilder<HealthEntry, HealthEntry, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HealthEntryQueryFilter
    on QueryBuilder<HealthEntry, HealthEntry, QFilterCondition> {
  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition>
      sleepHoursEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition>
      sleepHoursGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleepHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition>
      sleepHoursLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleepHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition>
      sleepHoursBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleepHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition>
      waterCupsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waterCups',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition>
      waterCupsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waterCups',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition>
      waterCupsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waterCups',
        value: value,
      ));
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterFilterCondition>
      waterCupsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waterCups',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HealthEntryQueryObject
    on QueryBuilder<HealthEntry, HealthEntry, QFilterCondition> {}

extension HealthEntryQueryLinks
    on QueryBuilder<HealthEntry, HealthEntry, QFilterCondition> {}

extension HealthEntryQuerySortBy
    on QueryBuilder<HealthEntry, HealthEntry, QSortBy> {
  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> sortBySleepHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepHours', Sort.asc);
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> sortBySleepHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepHours', Sort.desc);
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> sortByWaterCups() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterCups', Sort.asc);
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> sortByWaterCupsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterCups', Sort.desc);
    });
  }
}

extension HealthEntryQuerySortThenBy
    on QueryBuilder<HealthEntry, HealthEntry, QSortThenBy> {
  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> thenBySleepHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepHours', Sort.asc);
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> thenBySleepHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepHours', Sort.desc);
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> thenByWaterCups() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterCups', Sort.asc);
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QAfterSortBy> thenByWaterCupsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterCups', Sort.desc);
    });
  }
}

extension HealthEntryQueryWhereDistinct
    on QueryBuilder<HealthEntry, HealthEntry, QDistinct> {
  QueryBuilder<HealthEntry, HealthEntry, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QDistinct> distinctBySleepHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepHours');
    });
  }

  QueryBuilder<HealthEntry, HealthEntry, QDistinct> distinctByWaterCups() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waterCups');
    });
  }
}

extension HealthEntryQueryProperty
    on QueryBuilder<HealthEntry, HealthEntry, QQueryProperty> {
  QueryBuilder<HealthEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HealthEntry, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<HealthEntry, double, QQueryOperations> sleepHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepHours');
    });
  }

  QueryBuilder<HealthEntry, int, QQueryOperations> waterCupsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waterCups');
    });
  }
}
