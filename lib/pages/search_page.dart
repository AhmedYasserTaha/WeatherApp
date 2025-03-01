import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller, // التحكم في النص المكتوب
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                  labelText: 'Search',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _searchWeather(context);
                    },
                    child: const Icon(Icons.search),
                  ),
                  border: const OutlineInputBorder(),
                  hintText: 'Enter a city',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _searchWeather(BuildContext context) {
    String cityName = _controller.text.trim();
    if (cityName.isNotEmpty) {
      context.read<WeatherCubit>().getWeather(cityName: cityName);
      context.read<WeatherCubit>().cityName = cityName;
      Navigator.pop(context); // إغلاق الشاشة بعد البحث
    }
  }
}
