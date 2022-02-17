import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/countries_repository.dart';
import '../../presentation/widgest/loading_element.dart';

part 'countries_event.dart';
part 'countries_state.dart';

List<LoadingElement> loadingElements =
    List.generate(15, (index) => const LoadingElement());

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesRepository countriesRepository;
  CountriesBloc(
    this.countriesRepository,
  ) : super(CountriesInitial(loadingWidget: loadingElements)) {
    on<LoadCountries>((event, emit) async {
      List<String>? countries = await countriesRepository.getCountries();
      emit(CountriesLoaded(countries: countries));
    });
  }
}
