// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryInfoDTO _$CountryInfoDTOFromJson(Map<String, dynamic> json) =>
    CountryInfoDTO(
      countryName: json['country_name'] as String,
      population: (json['population'] as num).toDouble(),
      ranking: json['ranking'] as int,
      worldShare: (json['world_share'] as num).toDouble(),
    );

Map<String, dynamic> _$CountryInfoDTOToJson(CountryInfoDTO instance) =>
    <String, dynamic>{
      'country_name': instance.countryName,
      'population': instance.population,
      'ranking': instance.ranking,
      'world_share': instance.worldShare,
    };
