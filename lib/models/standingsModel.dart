// ignore_for_file: file_names

class StandingsModel {
  StandingsModel({
    required this.standingsModelGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  final String? standingsModelGet;
  final Parameters? parameters;
  final List<dynamic> errors;
  final int? results;
  final Paging? paging;
  final List<Response> response;

  StandingsModel copyWith({
    String? standingsModelGet,
    Parameters? parameters,
    List<dynamic>? errors,
    int? results,
    Paging? paging,
    List<Response>? response,
  }) {
    return StandingsModel(
      standingsModelGet: standingsModelGet ?? this.standingsModelGet,
      parameters: parameters ?? this.parameters,
      errors: errors ?? this.errors,
      results: results ?? this.results,
      paging: paging ?? this.paging,
      response: response ?? this.response,
    );
  }

  factory StandingsModel.fromJson(Map<String, dynamic> json) {
    return StandingsModel(
      standingsModelGet: json["get"],
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
        "get": standingsModelGet,
        "parameters": parameters?.toJson(),
        "errors": errors.map((x) => x).toList(),
        "results": results,
        "paging": paging?.toJson(),
        "response": response.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$standingsModelGet, $parameters, $errors, $results, $paging, $response, ";
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
    required this.league,
    required this.season,
  });

  final String? league;
  final String? season;

  Parameters copyWith({
    String? league,
    String? season,
  }) {
    return Parameters(
      league: league ?? this.league,
      season: season ?? this.season,
    );
  }

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      league: json["league"],
      season: json["season"],
    );
  }

  Map<String, dynamic> toJson() => {
        "league": league,
        "season": season,
      };

  @override
  String toString() {
    return "$league, $season, ";
  }
}

class Response {
  Response({
    required this.league,
  });

  final League? league;

  Response copyWith({
    League? league,
  }) {
    return Response(
      league: league ?? this.league,
    );
  }

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      league: json["league"] == null ? null : League.fromJson(json["league"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "league": league?.toJson(),
      };

  @override
  String toString() {
    return "$league, ";
  }
}

class League {
  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.standings,
  });

  final int? id;
  final String? name;
  final String? country;
  final String? logo;
  final String? flag;
  final int? season;
  final List<List<Standing>> standings;

  League copyWith({
    int? id,
    String? name,
    String? country,
    String? logo,
    String? flag,
    int? season,
    List<List<Standing>>? standings,
  }) {
    return League(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      logo: logo ?? this.logo,
      flag: flag ?? this.flag,
      season: season ?? this.season,
      standings: standings ?? this.standings,
    );
  }

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json["id"],
      name: json["name"],
      country: json["country"],
      logo: json["logo"],
      flag: json["flag"],
      season: json["season"],
      standings: json["standings"] == null
          ? []
          : List<List<Standing>>.from(json["standings"]!.map((x) => x == null
              ? []
              : List<Standing>.from(x!.map((x) => Standing.fromJson(x))))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
        "standings":
            standings.map((x) => x.map((x) => x.toJson()).toList()).toList(),
      };

  @override
  String toString() {
    return "$id, $name, $country, $logo, $flag, $season, $standings, ";
  }
}

class Standing {
  Standing({
    required this.rank,
    required this.team,
    required this.points,
    required this.goalsDiff,
    required this.group,
    required this.form,
    required this.status,
    required this.description,
    required this.all,
    required this.home,
    required this.away,
    required this.update,
  });

  final int? rank;
  final Team? team;
  final int? points;
  final int? goalsDiff;
  final String? group;
  final String? form;
  final String? status;
  final String? description;
  final All? all;
  final All? home;
  final All? away;
  final DateTime? update;

  Standing copyWith({
    int? rank,
    Team? team,
    int? points,
    int? goalsDiff,
    String? group,
    String? form,
    String? status,
    String? description,
    All? all,
    All? home,
    All? away,
    DateTime? update,
  }) {
    return Standing(
      rank: rank ?? this.rank,
      team: team ?? this.team,
      points: points ?? this.points,
      goalsDiff: goalsDiff ?? this.goalsDiff,
      group: group ?? this.group,
      form: form ?? this.form,
      status: status ?? this.status,
      description: description ?? this.description,
      all: all ?? this.all,
      home: home ?? this.home,
      away: away ?? this.away,
      update: update ?? this.update,
    );
  }

  factory Standing.fromJson(Map<String, dynamic> json) {
    return Standing(
      rank: json["rank"],
      team: json["team"] == null ? null : Team.fromJson(json["team"]),
      points: json["points"],
      goalsDiff: json["goalsDiff"],
      group: json["group"],
      form: json["form"],
      status: json["status"],
      description: json["description"],
      all: json["all"] == null ? null : All.fromJson(json["all"]),
      home: json["home"] == null ? null : All.fromJson(json["home"]),
      away: json["away"] == null ? null : All.fromJson(json["away"]),
      update: DateTime.tryParse(json["update"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "team": team?.toJson(),
        "points": points,
        "goalsDiff": goalsDiff,
        "group": group,
        "form": form,
        "status": status,
        "description": description,
        "all": all?.toJson(),
        "home": home?.toJson(),
        "away": away?.toJson(),
        "update": update?.toIso8601String(),
      };

  @override
  String toString() {
    return "$rank, $team, $points, $goalsDiff, $group, $form, $status, $description, $all, $home, $away, $update, ";
  }
}

class All {
  All({
    required this.played,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
  });

  final int? played;
  final int? win;
  final int? draw;
  final int? lose;
  final Goals? goals;

  All copyWith({
    int? played,
    int? win,
    int? draw,
    int? lose,
    Goals? goals,
  }) {
    return All(
      played: played ?? this.played,
      win: win ?? this.win,
      draw: draw ?? this.draw,
      lose: lose ?? this.lose,
      goals: goals ?? this.goals,
    );
  }

  factory All.fromJson(Map<String, dynamic> json) {
    return All(
      played: json["played"],
      win: json["win"],
      draw: json["draw"],
      lose: json["lose"],
      goals: json["goals"] == null ? null : Goals.fromJson(json["goals"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "played": played,
        "win": win,
        "draw": draw,
        "lose": lose,
        "goals": goals?.toJson(),
      };

  @override
  String toString() {
    return "$played, $win, $draw, $lose, $goals, ";
  }
}

class Goals {
  Goals({
    required this.goalsFor,
    required this.against,
  });

  final int? goalsFor;
  final int? against;

  Goals copyWith({
    int? goalsFor,
    int? against,
  }) {
    return Goals(
      goalsFor: goalsFor ?? this.goalsFor,
      against: against ?? this.against,
    );
  }

  factory Goals.fromJson(Map<String, dynamic> json) {
    return Goals(
      goalsFor: json["for"],
      against: json["against"],
    );
  }

  Map<String, dynamic> toJson() => {
        "for": goalsFor,
        "against": against,
      };

  @override
  String toString() {
    return "$goalsFor, $against, ";
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
	"get": "standings",
	"parameters": {
		"league": "39",
		"season": "2019"
	},
	"errors": [],
	"results": 1,
	"paging": {
		"current": 1,
		"total": 1
	},
	"response": [
		{
			"league": {
				"id": 39,
				"name": "Premier League",
				"country": "England",
				"logo": "https://media.api-sports.io/football/leagues/2.png",
				"flag": "https://media.api-sports.io/flags/gb.svg",
				"season": 2019,
				"standings": [
					[
						{
							"rank": 1,
							"team": {
								"id": 40,
								"name": "Liverpool",
								"logo": "https://media.api-sports.io/football/teams/40.png"
							},
							"points": 70,
							"goalsDiff": 41,
							"group": "Premier League",
							"form": "WWWWW",
							"status": "same",
							"description": "Promotion - Champions League (Group Stage)",
							"all": {
								"played": 24,
								"win": 23,
								"draw": 1,
								"lose": 0,
								"goals": {
									"for": 56,
									"against": 15
								}
							},
							"home": {
								"played": 12,
								"win": 12,
								"draw": 0,
								"lose": 0,
								"goals": {
									"for": 31,
									"against": 9
								}
							},
							"away": {
								"played": 12,
								"win": 11,
								"draw": 1,
								"lose": 0,
								"goals": {
									"for": 25,
									"against": 6
								}
							},
							"update": "2020-01-29T00:00:00+00:00"
						}
					]
				]
			}
		}
	]
}*/
