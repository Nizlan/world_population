import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_population/data/repositories/countries_repository.dart';
import 'package:world_population/presentation/country_info_page.dart';

import '../domain/countries/countries_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CountriesBloc(CountriesRepository())..add(LoadCountries()),
      child: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Распределение стран по населению'),
            ),
            body: state is CountriesLoaded
                ? state.countries != null
                    ? ListView.builder(
                        itemCount: state.countries!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => CountryInfoPage(
                                            country: state.countries![index]))),
                                title: Text(
                                  (index + 1).toString() +
                                      '. ' +
                                      state.countries![index],
                                )),
                          );
                        })
                    : const Center(
                        child: CircularProgressIndicator(),
                      )
                : ListView.builder(
                    itemCount: state is CountriesInitial
                        ? state.loadingWidget.length
                        : null,
                    itemBuilder: (context, index) {
                      return state is CountriesInitial
                          ? state.loadingWidget[index]
                          : const SizedBox();
                    },
                  ),
          );
        },
      ),
    );
  }
}
