// ignore_for_file: file_names

class LeaguesModel {
  String? get;
  Parameters? parameters;
  int? results;
  Paging? paging;
  List<Response>? response;

  LeaguesModel(
      {this.get, this.parameters, this.results, this.paging, this.response});

  LeaguesModel.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    parameters = json['parameters'] != null
        ? Parameters.fromJson(json['parameters'])
        : null;

    results = json['results'];
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['get'] = get;
    if (parameters != null) {
      data['parameters'] = parameters!.toJson();
    }

    data['results'] = results;
    if (paging != null) {
      data['paging'] = paging!.toJson();
    }
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameters {
  String? id;

  Parameters({this.id});

  Parameters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Paging {
  int? current;
  int? total;

  Paging({this.current, this.total});

  Paging.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current'] = current;
    data['total'] = total;
    return data;
  }
}

class Response {
  League? league;
  Country? country;
  List<Seasons>? seasons;

  Response({this.league, this.country, this.seasons});

  Response.fromJson(Map<String, dynamic> json) {
    league = json['league'] != null ? League.fromJson(json['league']) : null;
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(Seasons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (league != null) {
      data['league'] = league!.toJson();
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (seasons != null) {
      data['seasons'] = seasons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class League {
  int? id;
  String? name;
  String? type;
  String? logo;

  League({this.id, this.name, this.type, this.logo});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['logo'] = logo;
    return data;
  }
}

class Country {
  String? name;
  String? code;
  String? flag;

  Country({this.name, this.code, this.flag});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['flag'] = flag;
    return data;
  }
}

class Seasons {
  int? year;
  String? start;
  String? end;
  bool? current;
  Coverage? coverage;

  Seasons({this.year, this.start, this.end, this.current, this.coverage});

  Seasons.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    start = json['start'];
    end = json['end'];
    current = json['current'];
    coverage =
        json['coverage'] != null ? Coverage.fromJson(json['coverage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['start'] = start;
    data['end'] = end;
    data['current'] = current;
    if (coverage != null) {
      data['coverage'] = coverage!.toJson();
    }
    return data;
  }
}

class Coverage {
  Fixtures? fixtures;
  bool? standings;
  bool? players;
  bool? topScorers;
  bool? topAssists;
  bool? topCards;
  bool? injuries;
  bool? predictions;
  bool? odds;

  Coverage(
      {this.fixtures,
      this.standings,
      this.players,
      this.topScorers,
      this.topAssists,
      this.topCards,
      this.injuries,
      this.predictions,
      this.odds});

  Coverage.fromJson(Map<String, dynamic> json) {
    fixtures =
        json['fixtures'] != null ? Fixtures.fromJson(json['fixtures']) : null;
    standings = json['standings'];
    players = json['players'];
    topScorers = json['top_scorers'];
    topAssists = json['top_assists'];
    topCards = json['top_cards'];
    injuries = json['injuries'];
    predictions = json['predictions'];
    odds = json['odds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fixtures != null) {
      data['fixtures'] = fixtures!.toJson();
    }
    data['standings'] = standings;
    data['players'] = players;
    data['top_scorers'] = topScorers;
    data['top_assists'] = topAssists;
    data['top_cards'] = topCards;
    data['injuries'] = injuries;
    data['predictions'] = predictions;
    data['odds'] = odds;
    return data;
  }
}

class Fixtures {
  bool? events;
  bool? lineups;
  bool? statisticsFixtures;
  bool? statisticsPlayers;

  Fixtures(
      {this.events,
      this.lineups,
      this.statisticsFixtures,
      this.statisticsPlayers});

  Fixtures.fromJson(Map<String, dynamic> json) {
    events = json['events'];
    lineups = json['lineups'];
    statisticsFixtures = json['statistics_fixtures'];
    statisticsPlayers = json['statistics_players'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['events'] = events;
    data['lineups'] = lineups;
    data['statistics_fixtures'] = statisticsFixtures;
    data['statistics_players'] = statisticsPlayers;
    return data;
  }
}
