part of 'country_info_bloc.dart';

@immutable
abstract class CountryInfoEvent {}

class GetCountryInfo extends CountryInfoEvent {
  final String country;
  GetCountryInfo({
    required this.country,
  });
}
