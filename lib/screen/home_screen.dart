import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/search_city_provider.dart';
import 'package:untitled/widget/city_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SearchCityProvider searchCityProvider =
        Provider.of<SearchCityProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  labelText: 'Search City',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      if (_searchController.text.isNotEmpty) {
                        searchCityProvider.getSearchCity(
                            city: _searchController.text);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Enter City Name'),
                          backgroundColor: Colors.indigo,
                        ));
                      }
                    },
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
           const CityListWidget(),
          ],
        ),
      ),
    );
  }
}
