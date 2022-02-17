part of 'country_info_bloc.dart';

@immutable
abstract class CountryInfoState {}

class CountryInfoInitial extends CountryInfoState {}

class CountryInfoRecieved extends CountryInfoState {
  final CountryInfo? countryInfo;
  CountryInfoRecieved({
    required this.countryInfo,
  });
}
