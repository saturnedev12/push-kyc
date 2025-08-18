// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOnboardingLocalCollection on Isar {
  IsarCollection<OnboardingLocal> get onboardingLocals => this.collection();
}

const OnboardingLocalSchema = CollectionSchema(
  name: r'OnboardingLocal',
  id: 3040460987791587440,
  properties: {
    r'opended': PropertySchema(
      id: 0,
      name: r'opended',
      type: IsarType.bool,
    )
  },
  estimateSize: _onboardingLocalEstimateSize,
  serialize: _onboardingLocalSerialize,
  deserialize: _onboardingLocalDeserialize,
  deserializeProp: _onboardingLocalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _onboardingLocalGetId,
  getLinks: _onboardingLocalGetLinks,
  attach: _onboardingLocalAttach,
  version: '3.1.8',
);

int _onboardingLocalEstimateSize(
  OnboardingLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _onboardingLocalSerialize(
  OnboardingLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.opended);
}

OnboardingLocal _onboardingLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OnboardingLocal();
  object.id = id;
  object.opended = reader.readBoolOrNull(offsets[0]);
  return object;
}

P _onboardingLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _onboardingLocalGetId(OnboardingLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _onboardingLocalGetLinks(OnboardingLocal object) {
  return [];
}

void _onboardingLocalAttach(
    IsarCollection<dynamic> col, Id id, OnboardingLocal object) {
  object.id = id;
}

extension OnboardingLocalQueryWhereSort
    on QueryBuilder<OnboardingLocal, OnboardingLocal, QWhere> {
  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OnboardingLocalQueryWhere
    on QueryBuilder<OnboardingLocal, OnboardingLocal, QWhereClause> {
  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterWhereClause> idBetween(
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

extension OnboardingLocalQueryFilter
    on QueryBuilder<OnboardingLocal, OnboardingLocal, QFilterCondition> {
  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterFilterCondition>
      opendedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'opended',
      ));
    });
  }

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterFilterCondition>
      opendedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'opended',
      ));
    });
  }

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterFilterCondition>
      opendedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opended',
        value: value,
      ));
    });
  }
}

extension OnboardingLocalQueryObject
    on QueryBuilder<OnboardingLocal, OnboardingLocal, QFilterCondition> {}

extension OnboardingLocalQueryLinks
    on QueryBuilder<OnboardingLocal, OnboardingLocal, QFilterCondition> {}

extension OnboardingLocalQuerySortBy
    on QueryBuilder<OnboardingLocal, OnboardingLocal, QSortBy> {
  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterSortBy> sortByOpended() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opended', Sort.asc);
    });
  }

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterSortBy>
      sortByOpendedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opended', Sort.desc);
    });
  }
}

extension OnboardingLocalQuerySortThenBy
    on QueryBuilder<OnboardingLocal, OnboardingLocal, QSortThenBy> {
  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterSortBy> thenByOpended() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opended', Sort.asc);
    });
  }

  QueryBuilder<OnboardingLocal, OnboardingLocal, QAfterSortBy>
      thenByOpendedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opended', Sort.desc);
    });
  }
}

extension OnboardingLocalQueryWhereDistinct
    on QueryBuilder<OnboardingLocal, OnboardingLocal, QDistinct> {
  QueryBuilder<OnboardingLocal, OnboardingLocal, QDistinct>
      distinctByOpended() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opended');
    });
  }
}

extension OnboardingLocalQueryProperty
    on QueryBuilder<OnboardingLocal, OnboardingLocal, QQueryProperty> {
  QueryBuilder<OnboardingLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OnboardingLocal, bool?, QQueryOperations> opendedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opended');
    });
  }
}
