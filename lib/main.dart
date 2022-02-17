import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/countries_repository.dart';
import 'presentation/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CountriesRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: const MaterialColor(
            0xffEB2534,
            <int, Color>{
              50: Color(0xffEB2534),
              100: Color(0xffEB2534),
              200: Color(0xffEB2534),
              300: Color(0xffEB2534),
              400: Color(0xffEB2534),
              500: Color(0xffEB2534),
              600: Color(0xffEB2534),
              700: Color(0xffEB2534),
              800: Color(0xffEB2534),
              900: Color(0xffEB2534),
            },
          ),
        ),
        home: const MainPage(),
      ),
    );
  }
}
