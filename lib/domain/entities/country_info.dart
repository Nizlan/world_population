import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_info.g.dart';

class CountryInfo extends Equatable {
  final String countryName;
  final double population;
  final int ranking;
  final double worldShare;
  const CountryInfo({
    required this.countryName,
    required this.population,
    required this.ranking,
    required this.worldShare,
  });

  @override
  List<Object> get props => [countryName, population, ranking, worldShare];
}

@JsonSerializable()
class CountryInfoDTO extends Equatable {
  @JsonKey(name: 'country_name')
  final String countryName;
  final double population;
  final int ranking;
  @JsonKey(name: 'world_share')
  final double worldShare;
  const CountryInfoDTO({
    required this.countryName,
    required this.population,
    required this.ranking,
    required this.worldShare,
  });

  factory CountryInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$CountryInfoDTOFromJson(json);

  CountryInfo toCountryInfo() => CountryInfo(
      countryName: countryName,
      population: population,
      ranking: ranking,
      worldShare: worldShare);

  @override
  List<Object> get props => [countryName, population, ranking, worldShare];
}
