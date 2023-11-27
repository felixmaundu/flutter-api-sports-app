// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/models/countriesModel.dart';
import 'package:flutter6_sports_app/screens/details_screen/leaguesPage.dart';
import 'package:flutter6_sports_app/services/api_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoutriesPage extends StatefulWidget {
  const CoutriesPage({Key? key}) : super(key: key);

  @override
  State<CoutriesPage> createState() => _CoutriesPageState();
}

class _CoutriesPageState extends State<CoutriesPage> {
  List<ResponseC>? response;

  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchCountries();
  }

  Future<void> _fetchCountries() async {
    try {
      response = await ApiService.fetchCountries(); // Updated function name
      setState(() {
        response = response;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching countries: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : _buildCountryList(),
    );
  }

  Widget _buildCountryList() {
    return ListView.builder(
      itemCount: response?.length ?? 0,
      itemBuilder: (context, index) {
        final country = response![index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LeaguesPage(
                  countryCode: country.code!,
                ),
              ),
            );
          },
          child: ListTile(
            leading: SvgPicture.network(
              country.flag!,
              width: 50,
              height: 30,
            ),
            title: Text(country.name ?? ''),
            subtitle: Text(country.code ?? ''),
          ),
        );
      },
    );
  }
}
