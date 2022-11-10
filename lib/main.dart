import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/search_city_provider.dart';
import 'package:untitled/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<SearchCityProvider>(
        create: (context)=>SearchCityProvider(),
        child:const HomeScreen(),
      ),
    );
  }
}
