// ignore_for_file: duplicate_import
import 'package:flutter6_sports_app/models/LeaguesModel.dart';
import 'package:flutter6_sports_app/models/MatchVideoModel.dart';
import 'package:flutter6_sports_app/models/countriesModel.dart';
// import 'package:flutter6_sports_app/models/countriesModel.dart';
import 'package:flutter6_sports_app/models/eventsModel.dart';
import 'package:flutter6_sports_app/models/fixturesModel.dart';
import 'package:flutter6_sports_app/models/headtoheadModel.dart';
import 'package:flutter6_sports_app/models/predictionModel.dart';
import 'package:flutter6_sports_app/models/statisticsModel.dart';
import 'package:flutter6_sports_app/models/sportsNewsModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
// 2023-10-11

class ApiService {
  static Future<List<Responses>> fetchFixtures() async {
    // Get the user's timezone

    // final location = tz.getLocation(Intl.getCurrentLocale());
    // final timezoneName = location.name;
    // final timezone = getTimezone();
    // print('Timezone: $location');
   
    final String currentTimeZone = Intl.getCurrentLocale();
    // print('$currentTimeZone');

    // print(currentTimeZone);
    final String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    var headers = {
      'x-rapidapi-key': 'get-your-api-key-from-api-football.com',
      'x-rapidapi-host': 'v3.football.api-sports.io',
    };

    var endpoint =
        'fixtures?timezone=$currentTimeZone&date=$currentDate'; //userTimeZone// Updated endpoint

    try {
      var response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('response')) {
          List<dynamic> responseList = data['response'];
          //print('hello: $responseList');
          return responseList
              .map((fixtureJson) => Responses.fromJson(fixtureJson))
              .toList();
        }
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(
          'SOMETHING WENT WRONG '); //Exception('Something went wrong: $e');
    }
    return [];
  }

  static Future<List<Responses>> fetchFixturesMinusOneDay() async {
    // DateTime currentDate = DateTime.now().add(Duration(days: dayOffset));

    DateTime getDayMinus1 = DateTime.now().subtract(const Duration(days: 1));
    String formattedDateMinusOne =
        DateFormat('yyyy-MM-dd').format(getDayMinus1);
    // print(formattedDateMinusOne);
    var headers = {
      'x-rapidapi-key': 'get-your-api-key-from-api-football.com',
      'x-rapidapi-host': 'v3.football.api-sports.io',
    };
    final String currentTimeZone = Intl.getCurrentLocale();
    var endpoint =
        'fixtures?timezone=$currentTimeZone&date=$formattedDateMinusOne'; //userTimeZone// Updated endpoint

    try {
      var response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('response')) {
          List<dynamic> responseList = data['response'];
          // print('hello: $responseList');
          return responseList
              .map((fixtureJson) => Responses.fromJson(fixtureJson))
              .toList();
        }
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(
          'SOMETHING WENT WRONG '); //Exception('Something went wrong: $e');
    }
    return [];
  }

  static Future<List<Responses>> fetchFixturesMinusTwoDays() async {
    final String currentTimeZone = Intl.getCurrentLocale();

    DateTime getDayMinus2 = DateTime.now().subtract(const Duration(days: 2));
    String formattedDateMinus2 = DateFormat('yyyy-MM-dd').format(getDayMinus2);
    // print(formattedDateMinus2);
    var headers = {
      'x-rapidapi-key': 'get-your-api-key-from-api-football.com',
      'x-rapidapi-host': 'v3.football.api-sports.io',
    };

    var endpoint =
        'fixtures?timezone=$currentTimeZone&date=$formattedDateMinus2'; //userTimeZone// Updated endpoint

    try {
      var response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('response')) {
          List<dynamic> responseList = data['response'];
          // print('hello: $responseList');
          return responseList
              .map((fixtureJson) => Responses.fromJson(fixtureJson))
              .toList();
        }
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(
          'SOMETHING WENT WRONG '); //Exception('Something went wrong: $e');
    }
    return [];
  }

  static Future<List<Responses>> fetchFixturesPlusOneDay() async {
    final String currentTimeZone = Intl.getCurrentLocale();
    // print('$currentTimeZone');

    DateTime getDayPlus1 = DateTime.now().add(const Duration(days: 1));
    String formattedDatePlus1 = DateFormat('yyyy-MM-dd').format(getDayPlus1);
    var headers = {
      'x-rapidapi-key': 'get-your-api-key-from-api-football.com',
      'x-rapidapi-host': 'v3.football.api-sports.io',
    };

    var endpoint =
        'fixtures?timezone=$currentTimeZone&date=$formattedDatePlus1'; //userTimeZone// Updated endpoint

    try {
      var response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('response')) {
          List<dynamic> responseList = data['response'];
          // print('hello: $responseList');
          return responseList
              .map((fixtureJson) => Responses.fromJson(fixtureJson))
              .toList();
        }
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(
          'SOMETHING WENT WRONG '); //Exception('Something went wrong: $e');
    }
    return [];
  }

  static Future<List<Responses>> fetchFixturesPlusTwoDay() async {
    final String currentTimeZone = Intl.getCurrentLocale();

    DateTime getDayPlus2 = DateTime.now().add(const Duration(days: 2));
    String formattedDatePlus2 = DateFormat('yyyy-MM-dd').format(getDayPlus2);
    var headers = {
      'x-rapidapi-key': 'get-your-api-key-from-api-football.com',
      'x-rapidapi-host': 'v3.football.api-sports.io',
    };

    var endpoint =
        'fixtures?timezone=$currentTimeZone&date=$formattedDatePlus2'; //userTimeZone// Updated endpoint

    try {
      var response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('response')) {
          List<dynamic> responseList = data['response'];
          // print('hello: $responseList');
          return responseList
              .map((fixtureJson) => Responses.fromJson(fixtureJson))
              .toList();
        }
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(
          'SOMETHING WENT WRONG '); //Exception('Something went wrong: $e');
    }
    return [];
  }

  static Future<List<Responses>> fetchFixturesSelectedDate() async {
    final String currentTimeZone = Intl.getCurrentLocale();
    // print('$currentTimeZone');

    // print(currentTimeZone);
    final String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    var headers = {
      'x-rapidapi-key': 'get-your-api-key-from-api-football.com',
      'x-rapidapi-host': 'v3.football.api-sports.io',
    };

    var endpoint =
        'fixtures?timezone=$currentTimeZone&date=$currentDate'; //userTimeZone// Updated endpoint

    try {
      var response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('response')) {
          List<dynamic> responseList = data['response'];
          // print('hello: $responseList');
          return responseList
              .map((fixtureJson) => Responses.fromJson(fixtureJson))
              .toList();
        }
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(
          'SOMETHING WENT WRONG '); //Exception('Something went wrong: $e');
    }
    return [];
  }

  static Future<List<MatchVideoModel>> fetchFootballFeedsVideos() async {
    const String videoApiAccessToken =
        'NDg3MjdfMTY5NTMzNDY0OV8xYTkxMTZhMTZjNjQ2OTU5M2VjYjkxYTkyZTgzMTRhZWZiODMxNDc3';
    // const String embedToken =
    //     'NDg3MjdfMTY5NTMzNDY0OV8yYThhZDE0MWMxNzFkNDU3MDZhOWE5NTI2MjZkOTRlYzkxMWNlMmVh';
    var endpoint =        'feed/?token=$videoApiAccessToken'; //=$videoApiAccessToken//$embedToken

    try {
      var response = await http.get(
        Uri.parse('https://www.scorebat.com/video-api/v3/$endpoint'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('response')) {
          List<dynamic> responseList = data['response'];
          return responseList
              .map((json) => MatchVideoModel.fromJson(json))
              .toList();
        }
        throw Exception('Response does not contain the "response" key.');
      }
      throw Exception('Request failed with status: ${response.statusCode}');
    } catch (e) {
      throw Exception('Something went wrong: $e');
    }
  }

  static const String API_KEY = '17b28eaed4294ec7814df3217d156f76';
  static const String BASE_URL =
      'https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=$API_KEY';

  static Future<SportsNewModel> fetchSportsNews({int page = 1}) async {
    var endpoint = '$BASE_URL&page=$page'; // Use the base URL

    try {
      var response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('articles')) {
          return SportsNewModel.fromJson(data);
        }
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('SOMETHING WENT WRONG: $e');
    }
    return SportsNewModel(status: '', totalResults: 0, articles: []);
  }

  static Future<EventsModel> fetchEvents(int fixtureId) async {
    var headers = {
      'x-rapidapi-key': 'get-your-api-key-from-api-football.com',
      'x-rapidapi-host': 'v3.football.api-sports.io',
    };

    var endpoint = 'fixtures/events?fixture=$fixtureId';

    try {
      var response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return EventsModel.fromJson(data);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching events: $e');
    }
  }

  static Future<StatisticsModel> fetchStatistics(int fixtureId) async {
    var headers = {
      'x-rapidapi-key': 'get-your-api-key-from-api-football.com',
      'x-rapidapi-host': 'v3.football.api-sports.io',
    };

// fix/stat?fix=id
// fix=id and type=total shots
// and team=id
    var endpoint = 'fixtures/statistics?fixture=$fixtureId';

    try {
      var response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        // print('here is stats data : $data');
        return StatisticsModel.fromJson(data);
      } else {
        throw Exception('Request failed with status');
      }
    } catch (e) {
      // print('error fetching stats');
      throw Exception('Error fetching statistics');
    }
  }

  static Future<PredictionModel> fetchPredictions(int fixtureId) async {
    var headers = {
      'x-rapidapi-key': 'get-your-api-key-from-api-football.com',
      'x-rapidapi-host': 'v3.football.api-sports.io',
    };

    var endpoint = 'predictions?fixture=$fixtureId';

    try {
      var response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return PredictionModel.fromJson(data);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching predictions: $e');
    }
  }

  static Future<HeadToHeadModel> fetchHeadToHead(
      int hometeamID, int awayteamID) async {
    var headers = {
      'x-rapidapi-key': 'get-your-api-key-from-api-football.com',
      'x-rapidapi-host': 'v3.football.api-sports.io',
    };

    var endpoint = 'fixtures/headtohead?h2h=$hometeamID-$awayteamID';
// fixtures/headtohead?h2h=33-34
    try {
      var response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return HeadToHeadModel.fromJson(data);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching predictions: $e');
    }
  }

  static Future<LeaguesModel> fetchLeaguesByCountry(String countryCode) async {
    var headers = {
      'x-rapidapi-key': 'get-your-api-key-from-api-football.com',
      'x-rapidapi-host': 'v3.football.api-sports.io',
    };

    var endpoint = 'leagues?country=$countryCode';

    try {
      var response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return LeaguesModel.fromJson(data);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching leagues: $e');
    }
  }

  static Future<List<ResponseC>> fetchCountries() async {
    var headers = {
      'x-rapidapi-key': 'get-your-api-key-from-api-football.com',
      'x-rapidapi-host': 'v3.football.api-sports.io',
    };

    var endpoint = 'countries';

    try {
      var response = await http.get(
        Uri.parse('https://v3.football.api-sports.io/$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> countryList = data['response'] ?? [];
        return countryList
            .map((countryJson) => ResponseC.fromJson(countryJson))
            .toList();
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }
}
