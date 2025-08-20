// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_doc_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetKycDocLocalCollection on Isar {
  IsarCollection<KycDocLocal> get kycDocLocals => this.collection();
}

const KycDocLocalSchema = CollectionSchema(
  name: r'KycDocLocal',
  id: 4987660477006780887,
  properties: {
    r'addressLat': PropertySchema(
      id: 0,
      name: r'addressLat',
      type: IsarType.double,
    ),
    r'addressLon': PropertySchema(
      id: 1,
      name: r'addressLon',
      type: IsarType.double,
    ),
    r'addressName': PropertySchema(
      id: 2,
      name: r'addressName',
      type: IsarType.string,
    ),
    r'alreadyStarted': PropertySchema(
      id: 3,
      name: r'alreadyStarted',
      type: IsarType.bool,
    ),
    r'birthDay': PropertySchema(
      id: 4,
      name: r'birthDay',
      type: IsarType.long,
    ),
    r'birthMonth': PropertySchema(
      id: 5,
      name: r'birthMonth',
      type: IsarType.long,
    ),
    r'birthYear': PropertySchema(
      id: 6,
      name: r'birthYear',
      type: IsarType.long,
    ),
    r'email': PropertySchema(
      id: 7,
      name: r'email',
      type: IsarType.string,
    ),
    r'firstName': PropertySchema(
      id: 8,
      name: r'firstName',
      type: IsarType.string,
    ),
    r'lastName': PropertySchema(
      id: 9,
      name: r'lastName',
      type: IsarType.string,
    ),
    r'nationalityCountryCode': PropertySchema(
      id: 10,
      name: r'nationalityCountryCode',
      type: IsarType.string,
    ),
    r'pathPassport': PropertySchema(
      id: 11,
      name: r'pathPassport',
      type: IsarType.string,
    ),
    r'pathRecto': PropertySchema(
      id: 12,
      name: r'pathRecto',
      type: IsarType.string,
    ),
    r'pathSelfie': PropertySchema(
      id: 13,
      name: r'pathSelfie',
      type: IsarType.string,
    ),
    r'pathVerso': PropertySchema(
      id: 14,
      name: r'pathVerso',
      type: IsarType.string,
    ),
    r'phoneNumber': PropertySchema(
      id: 15,
      name: r'phoneNumber',
      type: IsarType.string,
    ),
    r'postalCode': PropertySchema(
      id: 16,
      name: r'postalCode',
      type: IsarType.string,
    ),
    r'residenceCountryCode': PropertySchema(
      id: 17,
      name: r'residenceCountryCode',
      type: IsarType.string,
    ),
    r'sexe': PropertySchema(
      id: 18,
      name: r'sexe',
      type: IsarType.string,
    ),
    r'typeChoisi': PropertySchema(
      id: 19,
      name: r'typeChoisi',
      type: IsarType.string,
    ),
    r'validationOk': PropertySchema(
      id: 20,
      name: r'validationOk',
      type: IsarType.bool,
    )
  },
  estimateSize: _kycDocLocalEstimateSize,
  serialize: _kycDocLocalSerialize,
  deserialize: _kycDocLocalDeserialize,
  deserializeProp: _kycDocLocalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _kycDocLocalGetId,
  getLinks: _kycDocLocalGetLinks,
  attach: _kycDocLocalAttach,
  version: '3.1.8',
);

int _kycDocLocalEstimateSize(
  KycDocLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.addressName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.firstName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nationalityCountryCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pathPassport;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pathRecto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pathSelfie;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pathVerso;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phoneNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.postalCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.residenceCountryCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sexe;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.typeChoisi;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _kycDocLocalSerialize(
  KycDocLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.addressLat);
  writer.writeDouble(offsets[1], object.addressLon);
  writer.writeString(offsets[2], object.addressName);
  writer.writeBool(offsets[3], object.alreadyStarted);
  writer.writeLong(offsets[4], object.birthDay);
  writer.writeLong(offsets[5], object.birthMonth);
  writer.writeLong(offsets[6], object.birthYear);
  writer.writeString(offsets[7], object.email);
  writer.writeString(offsets[8], object.firstName);
  writer.writeString(offsets[9], object.lastName);
  writer.writeString(offsets[10], object.nationalityCountryCode);
  writer.writeString(offsets[11], object.pathPassport);
  writer.writeString(offsets[12], object.pathRecto);
  writer.writeString(offsets[13], object.pathSelfie);
  writer.writeString(offsets[14], object.pathVerso);
  writer.writeString(offsets[15], object.phoneNumber);
  writer.writeString(offsets[16], object.postalCode);
  writer.writeString(offsets[17], object.residenceCountryCode);
  writer.writeString(offsets[18], object.sexe);
  writer.writeString(offsets[19], object.typeChoisi);
  writer.writeBool(offsets[20], object.validationOk);
}

KycDocLocal _kycDocLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KycDocLocal();
  object.addressLat = reader.readDoubleOrNull(offsets[0]);
  object.addressLon = reader.readDoubleOrNull(offsets[1]);
  object.addressName = reader.readStringOrNull(offsets[2]);
  object.alreadyStarted = reader.readBool(offsets[3]);
  object.birthDay = reader.readLongOrNull(offsets[4]);
  object.birthMonth = reader.readLongOrNull(offsets[5]);
  object.birthYear = reader.readLongOrNull(offsets[6]);
  object.email = reader.readStringOrNull(offsets[7]);
  object.firstName = reader.readStringOrNull(offsets[8]);
  object.id = id;
  object.lastName = reader.readStringOrNull(offsets[9]);
  object.nationalityCountryCode = reader.readStringOrNull(offsets[10]);
  object.pathPassport = reader.readStringOrNull(offsets[11]);
  object.pathRecto = reader.readStringOrNull(offsets[12]);
  object.pathSelfie = reader.readStringOrNull(offsets[13]);
  object.pathVerso = reader.readStringOrNull(offsets[14]);
  object.phoneNumber = reader.readStringOrNull(offsets[15]);
  object.postalCode = reader.readStringOrNull(offsets[16]);
  object.residenceCountryCode = reader.readStringOrNull(offsets[17]);
  object.sexe = reader.readStringOrNull(offsets[18]);
  object.typeChoisi = reader.readStringOrNull(offsets[19]);
  object.validationOk = reader.readBool(offsets[20]);
  return object;
}

P _kycDocLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _kycDocLocalGetId(KycDocLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _kycDocLocalGetLinks(KycDocLocal object) {
  return [];
}

void _kycDocLocalAttach(
    IsarCollection<dynamic> col, Id id, KycDocLocal object) {
  object.id = id;
}

extension KycDocLocalQueryWhereSort
    on QueryBuilder<KycDocLocal, KycDocLocal, QWhere> {
  QueryBuilder<KycDocLocal, KycDocLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension KycDocLocalQueryWhere
    on QueryBuilder<KycDocLocal, KycDocLocal, QWhereClause> {
  QueryBuilder<KycDocLocal, KycDocLocal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterWhereClause> idBetween(
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

extension KycDocLocalQueryFilter
    on QueryBuilder<KycDocLocal, KycDocLocal, QFilterCondition> {
  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressLatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addressLat',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressLatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addressLat',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressLatEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addressLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressLatGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'addressLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressLatLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'addressLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressLatBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'addressLat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressLonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addressLon',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressLonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addressLon',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressLonEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addressLon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressLonGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'addressLon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressLonLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'addressLon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressLonBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'addressLon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addressName',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addressName',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addressName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'addressName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'addressName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'addressName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'addressName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'addressName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'addressName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'addressName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addressName',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      addressNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'addressName',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      alreadyStartedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alreadyStarted',
        value: value,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthDayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'birthDay',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthDayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'birthDay',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> birthDayEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birthDay',
        value: value,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthDayGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'birthDay',
        value: value,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthDayLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'birthDay',
        value: value,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> birthDayBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'birthDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthMonthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'birthMonth',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthMonthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'birthMonth',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthMonthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birthMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthMonthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'birthMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthMonthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'birthMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthMonthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'birthMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'birthYear',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthYearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'birthYear',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthYearEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birthYear',
        value: value,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthYearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'birthYear',
        value: value,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthYearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'birthYear',
        value: value,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      birthYearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'birthYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      firstNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      firstNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      firstNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      firstNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      firstNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      firstNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      firstNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      firstNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      firstNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      firstNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firstName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      firstNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      firstNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      lastNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      lastNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> lastNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      lastNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      lastNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> lastNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      lastNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      lastNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      lastNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> lastNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      lastNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      lastNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      nationalityCountryCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nationalityCountryCode',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      nationalityCountryCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nationalityCountryCode',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      nationalityCountryCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationalityCountryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      nationalityCountryCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nationalityCountryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      nationalityCountryCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nationalityCountryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      nationalityCountryCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nationalityCountryCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      nationalityCountryCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nationalityCountryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      nationalityCountryCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nationalityCountryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      nationalityCountryCodeContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nationalityCountryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      nationalityCountryCodeMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nationalityCountryCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      nationalityCountryCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationalityCountryCode',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      nationalityCountryCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nationalityCountryCode',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathPassportIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pathPassport',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathPassportIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pathPassport',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathPassportEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathPassport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathPassportGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pathPassport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathPassportLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pathPassport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathPassportBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pathPassport',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathPassportStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pathPassport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathPassportEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pathPassport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathPassportContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pathPassport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathPassportMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pathPassport',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathPassportIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathPassport',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathPassportIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pathPassport',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathRectoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pathRecto',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathRectoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pathRecto',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathRectoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathRecto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathRectoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pathRecto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathRectoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pathRecto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathRectoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pathRecto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathRectoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pathRecto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathRectoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pathRecto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathRectoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pathRecto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathRectoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pathRecto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathRectoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathRecto',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathRectoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pathRecto',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathSelfieIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pathSelfie',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathSelfieIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pathSelfie',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathSelfieEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathSelfie',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathSelfieGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pathSelfie',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathSelfieLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pathSelfie',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathSelfieBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pathSelfie',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathSelfieStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pathSelfie',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathSelfieEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pathSelfie',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathSelfieContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pathSelfie',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathSelfieMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pathSelfie',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathSelfieIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathSelfie',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathSelfieIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pathSelfie',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathVersoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pathVerso',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathVersoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pathVerso',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathVersoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathVerso',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathVersoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pathVerso',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathVersoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pathVerso',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathVersoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pathVerso',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathVersoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pathVerso',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathVersoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pathVerso',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathVersoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pathVerso',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathVersoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pathVerso',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathVersoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathVerso',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      pathVersoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pathVerso',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      phoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      phoneNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      phoneNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      phoneNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      phoneNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      phoneNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      phoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      phoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      phoneNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      phoneNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      postalCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'postalCode',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      postalCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'postalCode',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      postalCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'postalCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      postalCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'postalCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      postalCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'postalCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      postalCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'postalCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      postalCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'postalCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      postalCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'postalCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      postalCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'postalCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      postalCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'postalCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      postalCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'postalCode',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      postalCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'postalCode',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      residenceCountryCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'residenceCountryCode',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      residenceCountryCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'residenceCountryCode',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      residenceCountryCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'residenceCountryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      residenceCountryCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'residenceCountryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      residenceCountryCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'residenceCountryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      residenceCountryCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'residenceCountryCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      residenceCountryCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'residenceCountryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      residenceCountryCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'residenceCountryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      residenceCountryCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'residenceCountryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      residenceCountryCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'residenceCountryCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      residenceCountryCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'residenceCountryCode',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      residenceCountryCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'residenceCountryCode',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> sexeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sexe',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      sexeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sexe',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> sexeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sexe',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> sexeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sexe',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> sexeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sexe',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> sexeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sexe',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> sexeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sexe',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> sexeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sexe',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> sexeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sexe',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> sexeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sexe',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition> sexeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sexe',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      sexeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sexe',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      typeChoisiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'typeChoisi',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      typeChoisiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'typeChoisi',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      typeChoisiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeChoisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      typeChoisiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typeChoisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      typeChoisiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typeChoisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      typeChoisiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typeChoisi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      typeChoisiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'typeChoisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      typeChoisiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'typeChoisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      typeChoisiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'typeChoisi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      typeChoisiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'typeChoisi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      typeChoisiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeChoisi',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      typeChoisiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'typeChoisi',
        value: '',
      ));
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterFilterCondition>
      validationOkEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validationOk',
        value: value,
      ));
    });
  }
}

extension KycDocLocalQueryObject
    on QueryBuilder<KycDocLocal, KycDocLocal, QFilterCondition> {}

extension KycDocLocalQueryLinks
    on QueryBuilder<KycDocLocal, KycDocLocal, QFilterCondition> {}

extension KycDocLocalQuerySortBy
    on QueryBuilder<KycDocLocal, KycDocLocal, QSortBy> {
  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByAddressLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressLat', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByAddressLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressLat', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByAddressLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressLon', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByAddressLonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressLon', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByAddressName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressName', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByAddressNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressName', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByAlreadyStarted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyStarted', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      sortByAlreadyStartedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyStarted', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByBirthDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDay', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByBirthDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDay', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByBirthMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthMonth', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByBirthMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthMonth', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByBirthYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthYear', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByBirthYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthYear', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      sortByNationalityCountryCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalityCountryCode', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      sortByNationalityCountryCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalityCountryCode', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByPathPassport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathPassport', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      sortByPathPassportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathPassport', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByPathRecto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathRecto', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByPathRectoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathRecto', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByPathSelfie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathSelfie', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByPathSelfieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathSelfie', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByPathVerso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathVerso', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByPathVersoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathVerso', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByPostalCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postalCode', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByPostalCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postalCode', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      sortByResidenceCountryCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'residenceCountryCode', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      sortByResidenceCountryCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'residenceCountryCode', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortBySexe() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexe', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortBySexeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexe', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByTypeChoisi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeChoisi', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByTypeChoisiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeChoisi', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> sortByValidationOk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validationOk', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      sortByValidationOkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validationOk', Sort.desc);
    });
  }
}

extension KycDocLocalQuerySortThenBy
    on QueryBuilder<KycDocLocal, KycDocLocal, QSortThenBy> {
  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByAddressLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressLat', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByAddressLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressLat', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByAddressLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressLon', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByAddressLonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressLon', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByAddressName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressName', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByAddressNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addressName', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByAlreadyStarted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyStarted', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      thenByAlreadyStartedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyStarted', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByBirthDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDay', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByBirthDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDay', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByBirthMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthMonth', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByBirthMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthMonth', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByBirthYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthYear', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByBirthYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthYear', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      thenByNationalityCountryCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalityCountryCode', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      thenByNationalityCountryCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalityCountryCode', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByPathPassport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathPassport', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      thenByPathPassportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathPassport', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByPathRecto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathRecto', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByPathRectoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathRecto', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByPathSelfie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathSelfie', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByPathSelfieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathSelfie', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByPathVerso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathVerso', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByPathVersoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathVerso', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByPostalCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postalCode', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByPostalCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postalCode', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      thenByResidenceCountryCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'residenceCountryCode', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      thenByResidenceCountryCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'residenceCountryCode', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenBySexe() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexe', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenBySexeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexe', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByTypeChoisi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeChoisi', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByTypeChoisiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeChoisi', Sort.desc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy> thenByValidationOk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validationOk', Sort.asc);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QAfterSortBy>
      thenByValidationOkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validationOk', Sort.desc);
    });
  }
}

extension KycDocLocalQueryWhereDistinct
    on QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> {
  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByAddressLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addressLat');
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByAddressLon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addressLon');
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByAddressName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addressName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByAlreadyStarted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alreadyStarted');
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByBirthDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'birthDay');
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByBirthMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'birthMonth');
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByBirthYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'birthYear');
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByFirstName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByLastName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct>
      distinctByNationalityCountryCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nationalityCountryCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByPathPassport(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pathPassport', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByPathRecto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pathRecto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByPathSelfie(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pathSelfie', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByPathVerso(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pathVerso', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByPhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByPostalCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'postalCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct>
      distinctByResidenceCountryCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'residenceCountryCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctBySexe(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sexe', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByTypeChoisi(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typeChoisi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KycDocLocal, KycDocLocal, QDistinct> distinctByValidationOk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validationOk');
    });
  }
}

extension KycDocLocalQueryProperty
    on QueryBuilder<KycDocLocal, KycDocLocal, QQueryProperty> {
  QueryBuilder<KycDocLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<KycDocLocal, double?, QQueryOperations> addressLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addressLat');
    });
  }

  QueryBuilder<KycDocLocal, double?, QQueryOperations> addressLonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addressLon');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations> addressNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addressName');
    });
  }

  QueryBuilder<KycDocLocal, bool, QQueryOperations> alreadyStartedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alreadyStarted');
    });
  }

  QueryBuilder<KycDocLocal, int?, QQueryOperations> birthDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'birthDay');
    });
  }

  QueryBuilder<KycDocLocal, int?, QQueryOperations> birthMonthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'birthMonth');
    });
  }

  QueryBuilder<KycDocLocal, int?, QQueryOperations> birthYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'birthYear');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations> firstNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstName');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations> lastNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastName');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations>
      nationalityCountryCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nationalityCountryCode');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations> pathPassportProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathPassport');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations> pathRectoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathRecto');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations> pathSelfieProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathSelfie');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations> pathVersoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathVerso');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations> phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations> postalCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'postalCode');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations>
      residenceCountryCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'residenceCountryCode');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations> sexeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sexe');
    });
  }

  QueryBuilder<KycDocLocal, String?, QQueryOperations> typeChoisiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeChoisi');
    });
  }

  QueryBuilder<KycDocLocal, bool, QQueryOperations> validationOkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validationOk');
    });
  }
}
