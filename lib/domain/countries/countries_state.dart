part of 'countries_bloc.dart';

@immutable
abstract class CountriesState {}

class CountriesInitial extends CountriesState {
  final List<Widget> loadingWidget;
  CountriesInitial({
    required this.loadingWidget,
  });
}

class CountriesLoaded extends CountriesState {
  final List<String>? countries;
  CountriesLoaded({
    required this.countries,
  });
}
