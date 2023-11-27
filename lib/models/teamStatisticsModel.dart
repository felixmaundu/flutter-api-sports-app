// // Get all statistics for a {team} in a {league} & {season}
// get("https://v3.football.api-sports.io/teams/statistics?league=39&team=33&season=2019");

// //Get all statistics for a {team} in a {league} & {season} with a end {date}
// get("https://v3.football.api-sports.io/teams/statistics?league=39&team=33&season=2019&date=2019-10-08");

// ignore_for_file: file_names
class TeamStatisticsModel {
  TeamStatisticsModel({
    required this.teamStatisticsModelGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  final String? teamStatisticsModelGet;
  final Parameters? parameters;
  final List<dynamic> errors;
  final int? results;
  final Paging? paging;
  final Response? response;

  TeamStatisticsModel copyWith({
    String? teamStatisticsModelGet,
    Parameters? parameters,
    List<dynamic>? errors,
    int? results,
    Paging? paging,
    Response? response,
  }) {
    return TeamStatisticsModel(
      teamStatisticsModelGet:
          teamStatisticsModelGet ?? this.teamStatisticsModelGet,
      parameters: parameters ?? this.parameters,
      errors: errors ?? this.errors,
      results: results ?? this.results,
      paging: paging ?? this.paging,
      response: response ?? this.response,
    );
  }

  factory TeamStatisticsModel.fromJson(Map<String, dynamic> json) {
    return TeamStatisticsModel(
      teamStatisticsModelGet: json["get"],
      parameters: json["parameters"] == null
          ? null
          : Parameters.fromJson(json["parameters"]),
      errors: json["errors"] == null
          ? []
          : List<dynamic>.from(json["errors"]!.map((x) => x)),
      results: json["results"],
      paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
      response:
          json["response"] == null ? null : Response.fromJson(json["response"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "get": teamStatisticsModelGet,
        "parameters": parameters?.toJson(),
        "errors": errors.map((x) => x).toList(),
        "results": results,
        "paging": paging?.toJson(),
        "response": response?.toJson(),
      };

  @override
  String toString() {
    return "$teamStatisticsModelGet, $parameters, $errors, $results, $paging, $response, ";
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
    required this.team,
    required this.season,
    required this.league,
  });

  final String? team;
  final String? season;
  final String? league;

  Parameters copyWith({
    String? team,
    String? season,
    String? league,
  }) {
    return Parameters(
      team: team ?? this.team,
      season: season ?? this.season,
      league: league ?? this.league,
    );
  }

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      team: json["team"],
      season: json["season"],
      league: json["league"],
    );
  }

  Map<String, dynamic> toJson() => {
        "team": team,
        "season": season,
        "league": league,
      };

  @override
  String toString() {
    return "$team, $season, $league, ";
  }
}

class Response {
  Response({
    required this.league,
    required this.team,
    required this.form,
    required this.fixtures,
    required this.goals,
    required this.biggest,
    required this.cleanSheet,
    required this.failedToScore,
    required this.penalty,
    required this.lineups,
    required this.cards,
  });

  final League? league;
  final Team? team;
  final String? form;
  final Fixtures? fixtures;
  final ResponseGoals? goals;
  final Biggest? biggest;
  final CleanSheet? cleanSheet;
  final CleanSheet? failedToScore;
  final Penalty? penalty;
  final List<Lineup> lineups;
  final Cards? cards;

  Response copyWith({
    League? league,
    Team? team,
    String? form,
    Fixtures? fixtures,
    ResponseGoals? goals,
    Biggest? biggest,
    CleanSheet? cleanSheet,
    CleanSheet? failedToScore,
    Penalty? penalty,
    List<Lineup>? lineups,
    Cards? cards,
  }) {
    return Response(
      league: league ?? this.league,
      team: team ?? this.team,
      form: form ?? this.form,
      fixtures: fixtures ?? this.fixtures,
      goals: goals ?? this.goals,
      biggest: biggest ?? this.biggest,
      cleanSheet: cleanSheet ?? this.cleanSheet,
      failedToScore: failedToScore ?? this.failedToScore,
      penalty: penalty ?? this.penalty,
      lineups: lineups ?? this.lineups,
      cards: cards ?? this.cards,
    );
  }

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      league: json["league"] == null ? null : League.fromJson(json["league"]),
      team: json["team"] == null ? null : Team.fromJson(json["team"]),
      form: json["form"],
      fixtures:
          json["fixtures"] == null ? null : Fixtures.fromJson(json["fixtures"]),
      goals:
          json["goals"] == null ? null : ResponseGoals.fromJson(json["goals"]),
      biggest:
          json["biggest"] == null ? null : Biggest.fromJson(json["biggest"]),
      cleanSheet: json["clean_sheet"] == null
          ? null
          : CleanSheet.fromJson(json["clean_sheet"]),
      failedToScore: json["failed_to_score"] == null
          ? null
          : CleanSheet.fromJson(json["failed_to_score"]),
      penalty:
          json["penalty"] == null ? null : Penalty.fromJson(json["penalty"]),
      lineups: json["lineups"] == null
          ? []
          : List<Lineup>.from(json["lineups"]!.map((x) => Lineup.fromJson(x))),
      cards: json["cards"] == null ? null : Cards.fromJson(json["cards"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "league": league?.toJson(),
        "team": team?.toJson(),
        "form": form,
        "fixtures": fixtures?.toJson(),
        "goals": goals?.toJson(),
        "biggest": biggest?.toJson(),
        "clean_sheet": cleanSheet?.toJson(),
        "failed_to_score": failedToScore?.toJson(),
        "penalty": penalty?.toJson(),
        "lineups": lineups.map((x) => x.toJson()).toList(),
        "cards": cards?.toJson(),
      };

  @override
  String toString() {
    return "$league, $team, $form, $fixtures, $goals, $biggest, $cleanSheet, $failedToScore, $penalty, $lineups, $cards, ";
  }
}

class Biggest {
  Biggest({
    required this.streak,
    required this.wins,
    required this.loses,
    required this.goals,
  });

  final Streak? streak;
  final Loses? wins;
  final Loses? loses;
  final BiggestGoals? goals;

  Biggest copyWith({
    Streak? streak,
    Loses? wins,
    Loses? loses,
    BiggestGoals? goals,
  }) {
    return Biggest(
      streak: streak ?? this.streak,
      wins: wins ?? this.wins,
      loses: loses ?? this.loses,
      goals: goals ?? this.goals,
    );
  }

  factory Biggest.fromJson(Map<String, dynamic> json) {
    return Biggest(
      streak: json["streak"] == null ? null : Streak.fromJson(json["streak"]),
      wins: json["wins"] == null ? null : Loses.fromJson(json["wins"]),
      loses: json["loses"] == null ? null : Loses.fromJson(json["loses"]),
      goals:
          json["goals"] == null ? null : BiggestGoals.fromJson(json["goals"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "streak": streak?.toJson(),
        "wins": wins?.toJson(),
        "loses": loses?.toJson(),
        "goals": goals?.toJson(),
      };

  @override
  String toString() {
    return "$streak, $wins, $loses, $goals, ";
  }
}

class BiggestGoals {
  BiggestGoals({
    required this.goalsFor,
    required this.against,
  });

  final PurpleAgainst? goalsFor;
  final PurpleAgainst? against;

  BiggestGoals copyWith({
    PurpleAgainst? goalsFor,
    PurpleAgainst? against,
  }) {
    return BiggestGoals(
      goalsFor: goalsFor ?? this.goalsFor,
      against: against ?? this.against,
    );
  }

  factory BiggestGoals.fromJson(Map<String, dynamic> json) {
    return BiggestGoals(
      goalsFor:
          json["for"] == null ? null : PurpleAgainst.fromJson(json["for"]),
      against: json["against"] == null
          ? null
          : PurpleAgainst.fromJson(json["against"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "for": goalsFor?.toJson(),
        "against": against?.toJson(),
      };

  @override
  String toString() {
    return "$goalsFor, $against, ";
  }
}

class PurpleAgainst {
  PurpleAgainst({
    required this.home,
    required this.away,
  });

  final int? home;
  final int? away;

  PurpleAgainst copyWith({
    int? home,
    int? away,
  }) {
    return PurpleAgainst(
      home: home ?? this.home,
      away: away ?? this.away,
    );
  }

  factory PurpleAgainst.fromJson(Map<String, dynamic> json) {
    return PurpleAgainst(
      home: json["home"],
      away: json["away"],
    );
  }

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
      };

  @override
  String toString() {
    return "$home, $away, ";
  }
}

class Loses {
  Loses({
    required this.home,
    required this.away,
  });

  final String? home;
  final String? away;

  Loses copyWith({
    String? home,
    String? away,
  }) {
    return Loses(
      home: home ?? this.home,
      away: away ?? this.away,
    );
  }

  factory Loses.fromJson(Map<String, dynamic> json) {
    return Loses(
      home: json["home"],
      away: json["away"],
    );
  }

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
      };

  @override
  String toString() {
    return "$home, $away, ";
  }
}

class Streak {
  Streak({
    required this.wins,
    required this.draws,
    required this.loses,
  });

  final int? wins;
  final int? draws;
  final int? loses;

  Streak copyWith({
    int? wins,
    int? draws,
    int? loses,
  }) {
    return Streak(
      wins: wins ?? this.wins,
      draws: draws ?? this.draws,
      loses: loses ?? this.loses,
    );
  }

  factory Streak.fromJson(Map<String, dynamic> json) {
    return Streak(
      wins: json["wins"],
      draws: json["draws"],
      loses: json["loses"],
    );
  }

  Map<String, dynamic> toJson() => {
        "wins": wins,
        "draws": draws,
        "loses": loses,
      };

  @override
  String toString() {
    return "$wins, $draws, $loses, ";
  }
}

class Cards {
  Cards({
    required this.yellow,
    required this.red,
  });

  final Map<String, Missed> yellow;
  final Map<String, Missed> red;

  Cards copyWith({
    Map<String, Missed>? yellow,
    Map<String, Missed>? red,
  }) {
    return Cards(
      yellow: yellow ?? this.yellow,
      red: red ?? this.red,
    );
  }

  factory Cards.fromJson(Map<String, dynamic> json) {
    return Cards(
      yellow: Map.from(json["yellow"])
          .map((k, v) => MapEntry<String, Missed>(k, Missed.fromJson(v))),
      red: Map.from(json["red"])
          .map((k, v) => MapEntry<String, Missed>(k, Missed.fromJson(v))),
    );
  }

  Map<String, dynamic> toJson() => {
        "yellow": Map.from(yellow)
            .map((k, v) => MapEntry<String, dynamic>(k, v?.toJson())),
        "red": Map.from(red)
            .map((k, v) => MapEntry<String, dynamic>(k, v?.toJson())),
      };

  @override
  String toString() {
    return "$yellow, $red, ";
  }
}

class Missed {
  Missed({
    required this.total,
    required this.percentage,
  });

  final int? total;
  final String? percentage;

  Missed copyWith({
    int? total,
    String? percentage,
  }) {
    return Missed(
      total: total ?? this.total,
      percentage: percentage ?? this.percentage,
    );
  }

  factory Missed.fromJson(Map<String, dynamic> json) {
    return Missed(
      total: json["total"],
      percentage: json["percentage"],
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total,
        "percentage": percentage,
      };

  @override
  String toString() {
    return "$total, $percentage, ";
  }
}

class CleanSheet {
  CleanSheet({
    required this.home,
    required this.away,
    required this.total,
  });

  final int? home;
  final int? away;
  final int? total;

  CleanSheet copyWith({
    int? home,
    int? away,
    int? total,
  }) {
    return CleanSheet(
      home: home ?? this.home,
      away: away ?? this.away,
      total: total ?? this.total,
    );
  }

  factory CleanSheet.fromJson(Map<String, dynamic> json) {
    return CleanSheet(
      home: json["home"],
      away: json["away"],
      total: json["total"],
    );
  }

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
        "total": total,
      };

  @override
  String toString() {
    return "$home, $away, $total, ";
  }
}

class Fixtures {
  Fixtures({
    required this.played,
    required this.wins,
    required this.draws,
    required this.loses,
  });

  final CleanSheet? played;
  final CleanSheet? wins;
  final CleanSheet? draws;
  final CleanSheet? loses;

  Fixtures copyWith({
    CleanSheet? played,
    CleanSheet? wins,
    CleanSheet? draws,
    CleanSheet? loses,
  }) {
    return Fixtures(
      played: played ?? this.played,
      wins: wins ?? this.wins,
      draws: draws ?? this.draws,
      loses: loses ?? this.loses,
    );
  }

  factory Fixtures.fromJson(Map<String, dynamic> json) {
    return Fixtures(
      played:
          json["played"] == null ? null : CleanSheet.fromJson(json["played"]),
      wins: json["wins"] == null ? null : CleanSheet.fromJson(json["wins"]),
      draws: json["draws"] == null ? null : CleanSheet.fromJson(json["draws"]),
      loses: json["loses"] == null ? null : CleanSheet.fromJson(json["loses"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "played": played?.toJson(),
        "wins": wins?.toJson(),
        "draws": draws?.toJson(),
        "loses": loses?.toJson(),
      };

  @override
  String toString() {
    return "$played, $wins, $draws, $loses, ";
  }
}

class ResponseGoals {
  ResponseGoals({
    required this.goalsFor,
    required this.against,
  });

  final FluffyAgainst? goalsFor;
  final FluffyAgainst? against;

  ResponseGoals copyWith({
    FluffyAgainst? goalsFor,
    FluffyAgainst? against,
  }) {
    return ResponseGoals(
      goalsFor: goalsFor ?? this.goalsFor,
      against: against ?? this.against,
    );
  }

  factory ResponseGoals.fromJson(Map<String, dynamic> json) {
    return ResponseGoals(
      goalsFor:
          json["for"] == null ? null : FluffyAgainst.fromJson(json["for"]),
      against: json["against"] == null
          ? null
          : FluffyAgainst.fromJson(json["against"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "for": goalsFor?.toJson(),
        "against": against?.toJson(),
      };

  @override
  String toString() {
    return "$goalsFor, $against, ";
  }
}

class FluffyAgainst {
  FluffyAgainst({
    required this.total,
    required this.average,
    required this.minute,
  });

  final CleanSheet? total;
  final Average? average;
  final Map<String, Missed> minute;

  FluffyAgainst copyWith({
    CleanSheet? total,
    Average? average,
    Map<String, Missed>? minute,
  }) {
    return FluffyAgainst(
      total: total ?? this.total,
      average: average ?? this.average,
      minute: minute ?? this.minute,
    );
  }

  factory FluffyAgainst.fromJson(Map<String, dynamic> json) {
    return FluffyAgainst(
      total: json["total"] == null ? null : CleanSheet.fromJson(json["total"]),
      average:
          json["average"] == null ? null : Average.fromJson(json["average"]),
      minute: Map.from(json["minute"])
          .map((k, v) => MapEntry<String, Missed>(k, Missed.fromJson(v))),
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total?.toJson(),
        "average": average?.toJson(),
        "minute": Map.from(minute)
            .map((k, v) => MapEntry<String, dynamic>(k, v?.toJson())),
      };

  @override
  String toString() {
    return "$total, $average, $minute, ";
  }
}

class Average {
  Average({
    required this.home,
    required this.away,
    required this.total,
  });

  final String? home;
  final String? away;
  final String? total;

  Average copyWith({
    String? home,
    String? away,
    String? total,
  }) {
    return Average(
      home: home ?? this.home,
      away: away ?? this.away,
      total: total ?? this.total,
    );
  }

  factory Average.fromJson(Map<String, dynamic> json) {
    return Average(
      home: json["home"],
      away: json["away"],
      total: json["total"],
    );
  }

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
        "total": total,
      };

  @override
  String toString() {
    return "$home, $away, $total, ";
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
  });

  final int? id;
  final String? name;
  final String? country;
  final String? logo;
  final String? flag;
  final int? season;

  League copyWith({
    int? id,
    String? name,
    String? country,
    String? logo,
    String? flag,
    int? season,
  }) {
    return League(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      logo: logo ?? this.logo,
      flag: flag ?? this.flag,
      season: season ?? this.season,
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
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
      };

  @override
  String toString() {
    return "$id, $name, $country, $logo, $flag, $season, ";
  }
}

class Lineup {
  Lineup({
    required this.formation,
    required this.played,
  });

  final String? formation;
  final int? played;

  Lineup copyWith({
    String? formation,
    int? played,
  }) {
    return Lineup(
      formation: formation ?? this.formation,
      played: played ?? this.played,
    );
  }

  factory Lineup.fromJson(Map<String, dynamic> json) {
    return Lineup(
      formation: json["formation"],
      played: json["played"],
    );
  }

  Map<String, dynamic> toJson() => {
        "formation": formation,
        "played": played,
      };

  @override
  String toString() {
    return "$formation, $played, ";
  }
}

class Penalty {
  Penalty({
    required this.scored,
    required this.missed,
    required this.total,
  });

  final Missed? scored;
  final Missed? missed;
  final int? total;

  Penalty copyWith({
    Missed? scored,
    Missed? missed,
    int? total,
  }) {
    return Penalty(
      scored: scored ?? this.scored,
      missed: missed ?? this.missed,
      total: total ?? this.total,
    );
  }

  factory Penalty.fromJson(Map<String, dynamic> json) {
    return Penalty(
      scored: json["scored"] == null ? null : Missed.fromJson(json["scored"]),
      missed: json["missed"] == null ? null : Missed.fromJson(json["missed"]),
      total: json["total"],
    );
  }

  Map<String, dynamic> toJson() => {
        "scored": scored?.toJson(),
        "missed": missed?.toJson(),
        "total": total,
      };

  @override
  String toString() {
    return "$scored, $missed, $total, ";
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
	"get": "teams/statistics",
	"parameters": {
		"team": "33",
		"season": "2019",
		"league": "39"
	},
	"errors": [],
	"results": 11,
	"paging": {
		"current": 1,
		"total": 1
	},
	"response": {
		"league": {
			"id": 39,
			"name": "Premier League",
			"country": "England",
			"logo": "https://media.api-sports.io/football/leagues/39.png",
			"flag": "https://media.api-sports.io/flags/gb.svg",
			"season": 2019
		},
		"team": {
			"id": 33,
			"name": "Manchester United",
			"logo": "https://media.api-sports.io/football/teams/33.png"
		},
		"form": "WDLDWLDLDWLWDDWWDLWWLWLLDWWDWDWWWWDWDW",
		"fixtures": {
			"played": {
				"home": 19,
				"away": 19,
				"total": 38
			},
			"wins": {
				"home": 10,
				"away": 8,
				"total": 18
			},
			"draws": {
				"home": 7,
				"away": 5,
				"total": 12
			},
			"loses": {
				"home": 2,
				"away": 6,
				"total": 8
			}
		},
		"goals": {
			"for": {
				"total": {
					"home": 40,
					"away": 26,
					"total": 66
				},
				"average": {
					"home": "2.1",
					"away": "1.4",
					"total": "1.7"
				},
				"minute": {
					"0-15": {
						"total": 4,
						"percentage": "6.06%"
					},
					"16-30": {
						"total": 17,
						"percentage": "25.76%"
					},
					"31-45": {
						"total": 11,
						"percentage": "16.67%"
					},
					"46-60": {
						"total": 13,
						"percentage": "19.70%"
					},
					"61-75": {
						"total": 10,
						"percentage": "15.15%"
					},
					"76-90": {
						"total": 8,
						"percentage": "12.12%"
					},
					"91-105": {
						"total": 3,
						"percentage": "4.55%"
					},
					"106-120": {
						"total": null,
						"percentage": null
					}
				}
			},
			"against": {
				"total": {
					"home": 17,
					"away": 19,
					"total": 36
				},
				"average": {
					"home": "0.9",
					"away": "1.0",
					"total": "0.9"
				},
				"minute": {
					"0-15": {
						"total": 6,
						"percentage": "16.67%"
					},
					"16-30": {
						"total": 3,
						"percentage": "8.33%"
					},
					"31-45": {
						"total": 7,
						"percentage": "19.44%"
					},
					"46-60": {
						"total": 9,
						"percentage": "25.00%"
					},
					"61-75": {
						"total": 3,
						"percentage": "8.33%"
					},
					"76-90": {
						"total": 5,
						"percentage": "13.89%"
					},
					"91-105": {
						"total": 3,
						"percentage": "8.33%"
					},
					"106-120": {
						"total": null,
						"percentage": null
					}
				}
			}
		},
		"biggest": {
			"streak": {
				"wins": 4,
				"draws": 2,
				"loses": 2
			},
			"wins": {
				"home": "4-0",
				"away": "0-3"
			},
			"loses": {
				"home": "0-2",
				"away": "2-0"
			},
			"goals": {
				"for": {
					"home": 5,
					"away": 3
				},
				"against": {
					"home": 2,
					"away": 3
				}
			}
		},
		"clean_sheet": {
			"home": 7,
			"away": 6,
			"total": 13
		},
		"failed_to_score": {
			"home": 2,
			"away": 6,
			"total": 8
		},
		"penalty": {
			"scored": {
				"total": 10,
				"percentage": "100.00%"
			},
			"missed": {
				"total": 0,
				"percentage": "0%"
			},
			"total": 10
		},
		"lineups": [
			{
				"formation": "4-2-3-1",
				"played": 32
			},
			{
				"formation": "3-4-1-2",
				"played": 4
			},
			{
				"formation": "3-4-2-1",
				"played": 1
			},
			{
				"formation": "4-3-1-2",
				"played": 1
			}
		],
		"cards": {
			"yellow": {
				"0-15": {
					"total": 5,
					"percentage": "6.85%"
				},
				"16-30": {
					"total": 5,
					"percentage": "6.85%"
				},
				"31-45": {
					"total": 16,
					"percentage": "21.92%"
				},
				"46-60": {
					"total": 12,
					"percentage": "16.44%"
				},
				"61-75": {
					"total": 14,
					"percentage": "19.18%"
				},
				"76-90": {
					"total": 21,
					"percentage": "28.77%"
				},
				"91-105": {
					"total": null,
					"percentage": null
				},
				"106-120": {
					"total": null,
					"percentage": null
				}
			},
			"red": {
				"0-15": {
					"total": null,
					"percentage": null
				},
				"16-30": {
					"total": null,
					"percentage": null
				},
				"31-45": {
					"total": null,
					"percentage": null
				},
				"46-60": {
					"total": null,
					"percentage": null
				},
				"61-75": {
					"total": null,
					"percentage": null
				},
				"76-90": {
					"total": null,
					"percentage": null
				},
				"91-105": {
					"total": null,
					"percentage": null
				},
				"106-120": {
					"total": null,
					"percentage": null
				}
			}
		}
	}
}*/
