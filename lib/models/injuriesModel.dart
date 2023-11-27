// ignore_for_file: file_names

class InjuriesModel {
  InjuriesModel({
    required this.injuriesModelGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  final String? injuriesModelGet;
  final Parameters? parameters;
  final List<dynamic> errors;
  final int? results;
  final Paging? paging;
  final List<Response> response;

  InjuriesModel copyWith({
    String? injuriesModelGet,
    Parameters? parameters,
    List<dynamic>? errors,
    int? results,
    Paging? paging,
    List<Response>? response,
  }) {
    return InjuriesModel(
      injuriesModelGet: injuriesModelGet ?? this.injuriesModelGet,
      parameters: parameters ?? this.parameters,
      errors: errors ?? this.errors,
      results: results ?? this.results,
      paging: paging ?? this.paging,
      response: response ?? this.response,
    );
  }

  factory InjuriesModel.fromJson(Map<String, dynamic> json) {
    return InjuriesModel(
      injuriesModelGet: json["get"],
      parameters: json["parameters"] == null
          ? null
          : Parameters.fromJson(json["parameters"]),
      errors: json["errors"] == null
          ? []
          : List<dynamic>.from(json["errors"]!.map((x) => x)),
      results: json["results"],
      paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
      response: json["response"] == null
          ? []
          : List<Response>.from(
              json["response"]!.map((x) => Response.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "get": injuriesModelGet,
        "parameters": parameters?.toJson(),
        "errors": errors.map((x) => x).toList(),
        "results": results,
        "paging": paging?.toJson(),
        "response": response.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$injuriesModelGet, $parameters, $errors, $results, $paging, $response, ";
  }
}

class Paging {
  Paging({
    required this.current,
    required this.total,
  });

  final int? current;
  final int? total;

  Paging copyWith({
    int? current,
    int? total,
  }) {
    return Paging(
      current: current ?? this.current,
      total: total ?? this.total,
    );
  }

  factory Paging.fromJson(Map<String, dynamic> json) {
    return Paging(
      current: json["current"],
      total: json["total"],
    );
  }

  Map<String, dynamic> toJson() => {
        "current": current,
        "total": total,
      };

  @override
  String toString() {
    return "$current, $total, ";
  }
}

class Parameters {
  Parameters({
    required this.fixture,
  });

  final String? fixture;

  Parameters copyWith({
    String? fixture,
  }) {
    return Parameters(
      fixture: fixture ?? this.fixture,
    );
  }

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      fixture: json["fixture"],
    );
  }

  Map<String, dynamic> toJson() => {
        "fixture": fixture,
      };

  @override
  String toString() {
    return "$fixture, ";
  }
}

class Response {
  Response({
    required this.player,
    required this.team,
    required this.fixture,
    required this.league,
  });

  final Player? player;
  final Team? team;
  final Fixture? fixture;
  final League? league;

  Response copyWith({
    Player? player,
    Team? team,
    Fixture? fixture,
    League? league,
  }) {
    return Response(
      player: player ?? this.player,
      team: team ?? this.team,
      fixture: fixture ?? this.fixture,
      league: league ?? this.league,
    );
  }

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      player: json["player"] == null ? null : Player.fromJson(json["player"]),
      team: json["team"] == null ? null : Team.fromJson(json["team"]),
      fixture:
          json["fixture"] == null ? null : Fixture.fromJson(json["fixture"]),
      league: json["league"] == null ? null : League.fromJson(json["league"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "player": player?.toJson(),
        "team": team?.toJson(),
        "fixture": fixture?.toJson(),
        "league": league?.toJson(),
      };

  @override
  String toString() {
    return "$player, $team, $fixture, $league, ";
  }
}

class Fixture {
  Fixture({
    required this.id,
    required this.timezone,
    required this.date,
    required this.timestamp,
  });

  final int? id;
  final String? timezone;
  final DateTime? date;
  final int? timestamp;

  Fixture copyWith({
    int? id,
    String? timezone,
    DateTime? date,
    int? timestamp,
  }) {
    return Fixture(
      id: id ?? this.id,
      timezone: timezone ?? this.timezone,
      date: date ?? this.date,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(
      id: json["id"],
      timezone: json["timezone"],
      date: DateTime.tryParse(json["date"] ?? ""),
      timestamp: json["timestamp"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "timezone": timezone,
        "date": date?.toIso8601String(),
        "timestamp": timestamp,
      };

  @override
  String toString() {
    return "$id, $timezone, $date, $timestamp, ";
  }
}

class League {
  League({
    required this.id,
    required this.season,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
  });

  final int? id;
  final int? season;
  final String? name;
  final String? country;
  final String? logo;
  final dynamic flag;

  League copyWith({
    int? id,
    int? season,
    String? name,
    String? country,
    String? logo,
    dynamic flag,
  }) {
    return League(
      id: id ?? this.id,
      season: season ?? this.season,
      name: name ?? this.name,
      country: country ?? this.country,
      logo: logo ?? this.logo,
      flag: flag ?? this.flag,
    );
  }

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json["id"],
      season: json["season"],
      name: json["name"],
      country: json["country"],
      logo: json["logo"],
      flag: json["flag"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "season": season,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
      };

  @override
  String toString() {
    return "$id, $season, $name, $country, $logo, $flag, ";
  }
}

class Player {
  Player({
    required this.id,
    required this.name,
    required this.photo,
    required this.type,
    required this.reason,
  });

  final int? id;
  final String? name;
  final String? photo;
  final String? type;
  final String? reason;

  Player copyWith({
    int? id,
    String? name,
    String? photo,
    String? type,
    String? reason,
  }) {
    return Player(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      type: type ?? this.type,
      reason: reason ?? this.reason,
    );
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json["id"],
      name: json["name"],
      photo: json["photo"],
      type: json["type"],
      reason: json["reason"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo,
        "type": type,
        "reason": reason,
      };

  @override
  String toString() {
    return "$id, $name, $photo, $type, $reason, ";
  }
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.logo,
  });

  final int? id;
  final String? name;
  final String? logo;

  Team copyWith({
    int? id,
    String? name,
    String? logo,
  }) {
    return Team(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
    );
  }

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json["id"],
      name: json["name"],
      logo: json["logo"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
      };

  @override
  String toString() {
    return "$id, $name, $logo, ";
  }
}

/*
{
	"get": "injuries",
	"parameters": {
		"fixture": "686314"
	},
	"errors": [],
	"results": 13,
	"paging": {
		"current": 1,
		"total": 1
	},
	"response": [
		{
			"player": {
				"id": 865,
				"name": "D. Costa",
				"photo": "https://media.api-sports.io/football/players/865.png",
				"type": "Missing Fixture",
				"reason": "Broken ankle"
			},
			"team": {
				"id": 157,
				"name": "Bayern Munich",
				"logo": "https://media.api-sports.io/football/teams/157.png"
			},
			"fixture": {
				"id": 686314,
				"timezone": "UTC",
				"date": "2021-04-07T19:00:00+00:00",
				"timestamp": 1617822000
			},
			"league": {
				"id": 2,
				"season": 2020,
				"name": "UEFA Champions League",
				"country": "World",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": null
			}
		},
		{
			"player": {
				"id": 510,
				"name": "S. Gnabry",
				"photo": "https://media.api-sports.io/football/players/510.png",
				"type": "Missing Fixture",
				"reason": "Illness"
			},
			"team": {
				"id": 157,
				"name": "Bayern Munich",
				"logo": "https://media.api-sports.io/football/teams/157.png"
			},
			"fixture": {
				"id": 686314,
				"timezone": "UTC",
				"date": "2021-04-07T19:00:00+00:00",
				"timestamp": 1617822000
			},
			"league": {
				"id": 2,
				"season": 2020,
				"name": "UEFA Champions League",
				"country": "World",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": null
			}
		},
		{
			"player": {
				"id": 496,
				"name": "R. Hoffmann",
				"photo": "https://media.api-sports.io/football/players/496.png",
				"type": "Missing Fixture",
				"reason": "Knee Injury"
			},
			"team": {
				"id": 157,
				"name": "Bayern Munich",
				"logo": "https://media.api-sports.io/football/teams/157.png"
			},
			"fixture": {
				"id": 686314,
				"timezone": "UTC",
				"date": "2021-04-07T19:00:00+00:00",
				"timestamp": 1617822000
			},
			"league": {
				"id": 2,
				"season": 2020,
				"name": "UEFA Champions League",
				"country": "World",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": null
			}
		},
		{
			"player": {
				"id": 521,
				"name": "R. Lewandowski",
				"photo": "https://media.api-sports.io/football/players/521.png",
				"type": "Missing Fixture",
				"reason": "Knee Injury"
			},
			"team": {
				"id": 157,
				"name": "Bayern Munich",
				"logo": "https://media.api-sports.io/football/teams/157.png"
			},
			"fixture": {
				"id": 686314,
				"timezone": "UTC",
				"date": "2021-04-07T19:00:00+00:00",
				"timestamp": 1617822000
			},
			"league": {
				"id": 2,
				"season": 2020,
				"name": "UEFA Champions League",
				"country": "World",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": null
			}
		},
		{
			"player": {
				"id": 514,
				"name": "J. Martinez",
				"photo": "https://media.api-sports.io/football/players/514.png",
				"type": "Missing Fixture",
				"reason": "Knock"
			},
			"team": {
				"id": 157,
				"name": "Bayern Munich",
				"logo": "https://media.api-sports.io/football/teams/157.png"
			},
			"fixture": {
				"id": 686314,
				"timezone": "UTC",
				"date": "2021-04-07T19:00:00+00:00",
				"timestamp": 1617822000
			},
			"league": {
				"id": 2,
				"season": 2020,
				"name": "UEFA Champions League",
				"country": "World",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": null
			}
		},
		{
			"player": {
				"id": 162037,
				"name": "M. Tillman",
				"photo": "https://media.api-sports.io/football/players/162037.png",
				"type": "Missing Fixture",
				"reason": "Knee Injury"
			},
			"team": {
				"id": 157,
				"name": "Bayern Munich",
				"logo": "https://media.api-sports.io/football/teams/157.png"
			},
			"fixture": {
				"id": 686314,
				"timezone": "UTC",
				"date": "2021-04-07T19:00:00+00:00",
				"timestamp": 1617822000
			},
			"league": {
				"id": 2,
				"season": 2020,
				"name": "UEFA Champions League",
				"country": "World",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": null
			}
		},
		{
			"player": {
				"id": 519,
				"name": "C. Tolisso",
				"photo": "https://media.api-sports.io/football/players/519.png",
				"type": "Missing Fixture",
				"reason": "Tendon Injury"
			},
			"team": {
				"id": 157,
				"name": "Bayern Munich",
				"logo": "https://media.api-sports.io/football/teams/157.png"
			},
			"fixture": {
				"id": 686314,
				"timezone": "UTC",
				"date": "2021-04-07T19:00:00+00:00",
				"timestamp": 1617822000
			},
			"league": {
				"id": 2,
				"season": 2020,
				"name": "UEFA Champions League",
				"country": "World",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": null
			}
		},
		{
			"player": {
				"id": 258,
				"name": "J. Bernat",
				"photo": "https://media.api-sports.io/football/players/258.png",
				"type": "Missing Fixture",
				"reason": "Knee Injury"
			},
			"team": {
				"id": 85,
				"name": "Paris Saint Germain",
				"logo": "https://media.api-sports.io/football/teams/85.png"
			},
			"fixture": {
				"id": 686314,
				"timezone": "UTC",
				"date": "2021-04-07T19:00:00+00:00",
				"timestamp": 1617822000
			},
			"league": {
				"id": 2,
				"season": 2020,
				"name": "UEFA Champions League",
				"country": "World",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": null
			}
		},
		{
			"player": {
				"id": 769,
				"name": "A. Florenzi",
				"photo": "https://media.api-sports.io/football/players/769.png",
				"type": "Missing Fixture",
				"reason": "Illness"
			},
			"team": {
				"id": 85,
				"name": "Paris Saint Germain",
				"logo": "https://media.api-sports.io/football/teams/85.png"
			},
			"fixture": {
				"id": 686314,
				"timezone": "UTC",
				"date": "2021-04-07T19:00:00+00:00",
				"timestamp": 1617822000
			},
			"league": {
				"id": 2,
				"season": 2020,
				"name": "UEFA Champions League",
				"country": "World",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": null
			}
		},
		{
			"player": {
				"id": 216,
				"name": "M. Icardi",
				"photo": "https://media.api-sports.io/football/players/216.png",
				"type": "Missing Fixture",
				"reason": "Muscle Injury"
			},
			"team": {
				"id": 85,
				"name": "Paris Saint Germain",
				"logo": "https://media.api-sports.io/football/teams/85.png"
			},
			"fixture": {
				"id": 686314,
				"timezone": "UTC",
				"date": "2021-04-07T19:00:00+00:00",
				"timestamp": 1617822000
			},
			"league": {
				"id": 2,
				"season": 2020,
				"name": "UEFA Champions League",
				"country": "World",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": null
			}
		},
		{
			"player": {
				"id": 263,
				"name": "L. Kurzawa",
				"photo": "https://media.api-sports.io/football/players/263.png",
				"type": "Missing Fixture",
				"reason": "Calf Injury"
			},
			"team": {
				"id": 85,
				"name": "Paris Saint Germain",
				"logo": "https://media.api-sports.io/football/teams/85.png"
			},
			"fixture": {
				"id": 686314,
				"timezone": "UTC",
				"date": "2021-04-07T19:00:00+00:00",
				"timestamp": 1617822000
			},
			"league": {
				"id": 2,
				"season": 2020,
				"name": "UEFA Champions League",
				"country": "World",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": null
			}
		},
		{
			"player": {
				"id": 271,
				"name": "L. Paredes",
				"photo": "https://media.api-sports.io/football/players/271.png",
				"type": "Missing Fixture",
				"reason": "Suspended"
			},
			"team": {
				"id": 85,
				"name": "Paris Saint Germain",
				"logo": "https://media.api-sports.io/football/teams/85.png"
			},
			"fixture": {
				"id": 686314,
				"timezone": "UTC",
				"date": "2021-04-07T19:00:00+00:00",
				"timestamp": 1617822000
			},
			"league": {
				"id": 2,
				"season": 2020,
				"name": "UEFA Champions League",
				"country": "World",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": null
			}
		},
		{
			"player": {
				"id": 273,
				"name": "M. Verratti",
				"photo": "https://media.api-sports.io/football/players/273.png",
				"type": "Missing Fixture",
				"reason": "Illness"
			},
			"team": {
				"id": 85,
				"name": "Paris Saint Germain",
				"logo": "https://media.api-sports.io/football/teams/85.png"
			},
			"fixture": {
				"id": 686314,
				"timezone": "UTC",
				"date": "2021-04-07T19:00:00+00:00",
				"timestamp": 1617822000
			},
			"league": {
				"id": 2,
				"season": 2020,
				"name": "UEFA Champions League",
				"country": "World",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": null
			}
		}
	]
}*/
