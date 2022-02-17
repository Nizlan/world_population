import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:world_population/data/repositories/countries_repository.dart';
import 'package:world_population/domain/entities/country_info.dart';

part 'country_info_event.dart';
part 'country_info_state.dart';

class CountryInfoBloc extends Bloc<CountryInfoEvent, CountryInfoState> {
  CountriesRepository countriesRepository;
  CountryInfoBloc(
    this.countriesRepository,
  ) : super(CountryInfoInitial()) {
    on<GetCountryInfo>((event, emit) async {
      CountryInfo? countryInfo =
          await countriesRepository.getSingleCountry(event.country);
      emit(CountryInfoRecieved(countryInfo: countryInfo));
    });
  }
}
