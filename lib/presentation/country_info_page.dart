import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_population/domain/utils/formatNumber.dart';

import '../data/repositories/countries_repository.dart';
import '../domain/country_info/country_info_bloc.dart';

class CountryInfoPage extends StatelessWidget {
  final String country;
  const CountryInfoPage({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryInfoBloc(CountriesRepository())
        ..add(GetCountryInfo(country: country)),
      child: BlocBuilder<CountryInfoBloc, CountryInfoState>(
        builder: (context, state) {
          return Scaffold(
            body: state is CountryInfoRecieved
                ? state.countryInfo != null
                    ? CustomScrollView(
                        slivers: <Widget>[
                          SliverAppBar(
                            pinned: false,
                            snap: false,
                            floating: false,
                            expandedHeight: 320.0,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Container(
                                  padding: const EdgeInsets.all(20),
                                  alignment: Alignment.center,
                                  child: Text(
                                    state.countryInfo!.countryName,
                                    style: const TextStyle(
                                        fontSize: 80, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                          SliverList(
                              delegate: SliverChildListDelegate([
                            RowElement(
                                name: 'Население',
                                value: formatNumber(state
                                        .countryInfo!.population
                                        .ceil()
                                        .toString()) +
                                    ' человек'),
                            RowElement(
                                name: 'Место в рейтинге',
                                value: state.countryInfo!.ranking.toString()),
                            RowElement(
                                name: 'Процент от мирового',
                                value: state.countryInfo!.worldShare
                                    .toStringAsFixed(2))
                          ]))
                        ],
                      )
                    : const Center(
                        child: Text(
                        'Произошла ошибка',
                      ))
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}

class RowElement extends StatelessWidget {
  final String name;
  final String value;
  const RowElement({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 2,
              child: Text(
                name + ':',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(value, style: TextStyle(fontSize: 16)),
              )),
        ],
      ),
    );
  }
}
