// ignore_for_file: file_names

class PlayerModel {
  PlayerModel({
    required this.playerModelGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  final String? playerModelGet;
  final Parameters? parameters;
  final List<dynamic> errors;
  final int? results;
  final Paging? paging;
  final List<Response> response;

  PlayerModel copyWith({
    String? playerModelGet,
    Parameters? parameters,
    List<dynamic>? errors,
    int? results,
    Paging? paging,
    List<Response>? response,
  }) {
    return PlayerModel(
      playerModelGet: playerModelGet ?? this.playerModelGet,
      parameters: parameters ?? this.parameters,
      errors: errors ?? this.errors,
      results: results ?? this.results,
      paging: paging ?? this.paging,
      response: response ?? this.response,
    );
  }

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      playerModelGet: json["get"],
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
        "get": playerModelGet,
        "parameters": parameters?.toJson(),
        "errors": errors.map((x) => x).toList(),
        "results": results,
        "paging": paging?.toJson(),
        "response": response.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$playerModelGet, $parameters, $errors, $results, $paging, $response, ";
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
    required this.id,
    required this.season,
  });

  final String? id;
  final String? season;

  Parameters copyWith({
    String? id,
    String? season,
  }) {
    return Parameters(
      id: id ?? this.id,
      season: season ?? this.season,
    );
  }

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      id: json["id"],
      season: json["season"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "season": season,
      };

  @override
  String toString() {
    return "$id, $season, ";
  }
}

class Response {
  Response({
    required this.player,
    required this.statistics,
  });

  final Player? player;
  final List<Statistic> statistics;

  Response copyWith({
    Player? player,
    List<Statistic>? statistics,
  }) {
    return Response(
      player: player ?? this.player,
      statistics: statistics ?? this.statistics,
    );
  }

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      player: json["player"] == null ? null : Player.fromJson(json["player"]),
      statistics: json["statistics"] == null
          ? []
          : List<Statistic>.from(
              json["statistics"]!.map((x) => Statistic.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "player": player?.toJson(),
        "statistics": statistics.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$player, $statistics, ";
  }
}

class Player {
  Player({
    required this.id,
    required this.name,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.birth,
    required this.nationality,
    required this.height,
    required this.weight,
    required this.injured,
    required this.photo,
  });

  final int? id;
  final String? name;
  final String? firstname;
  final String? lastname;
  final int? age;
  final Birth? birth;
  final String? nationality;
  final String? height;
  final String? weight;
  final bool? injured;
  final String? photo;

  Player copyWith({
    int? id,
    String? name,
    String? firstname,
    String? lastname,
    int? age,
    Birth? birth,
    String? nationality,
    String? height,
    String? weight,
    bool? injured,
    String? photo,
  }) {
    return Player(
      id: id ?? this.id,
      name: name ?? this.name,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      age: age ?? this.age,
      birth: birth ?? this.birth,
      nationality: nationality ?? this.nationality,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      injured: injured ?? this.injured,
      photo: photo ?? this.photo,
    );
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json["id"],
      name: json["name"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      age: json["age"],
      birth: json["birth"] == null ? null : Birth.fromJson(json["birth"]),
      nationality: json["nationality"],
      height: json["height"],
      weight: json["weight"],
      injured: json["injured"],
      photo: json["photo"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "firstname": firstname,
        "lastname": lastname,
        "age": age,
        "birth": birth?.toJson(),
        "nationality": nationality,
        "height": height,
        "weight": weight,
        "injured": injured,
        "photo": photo,
      };

  @override
  String toString() {
    return "$id, $name, $firstname, $lastname, $age, $birth, $nationality, $height, $weight, $injured, $photo, ";
  }
}

class Birth {
  Birth({
    required this.date,
    required this.place,
    required this.country,
  });

  final DateTime? date;
  final String? place;
  final String? country;

  Birth copyWith({
    DateTime? date,
    String? place,
    String? country,
  }) {
    return Birth(
      date: date ?? this.date,
      place: place ?? this.place,
      country: country ?? this.country,
    );
  }

  factory Birth.fromJson(Map<String, dynamic> json) {
    return Birth(
      date: DateTime.tryParse(json["date"] ?? ""),
      place: json["place"],
      country: json["country"],
    );
  }

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "place": place,
        "country": country,
      };

  @override
  String toString() {
    return "$date, $place, $country, ";
  }
}

class Statistic {
  Statistic({
    required this.team,
    required this.league,
    required this.games,
    required this.substitutes,
    required this.shots,
    required this.goals,
    required this.passes,
    required this.tackles,
    required this.duels,
    required this.dribbles,
    required this.fouls,
    required this.cards,
    required this.penalty,
  });

  final Team? team;
  final League? league;
  final Games? games;
  final Substitutes? substitutes;
  final Shots? shots;
  final Goals? goals;
  final Passes? passes;
  final Tackles? tackles;
  final Duels? duels;
  final Dribbles? dribbles;
  final Fouls? fouls;
  final Cards? cards;
  final Penalty? penalty;

  Statistic copyWith({
    Team? team,
    League? league,
    Games? games,
    Substitutes? substitutes,
    Shots? shots,
    Goals? goals,
    Passes? passes,
    Tackles? tackles,
    Duels? duels,
    Dribbles? dribbles,
    Fouls? fouls,
    Cards? cards,
    Penalty? penalty,
  }) {
    return Statistic(
      team: team ?? this.team,
      league: league ?? this.league,
      games: games ?? this.games,
      substitutes: substitutes ?? this.substitutes,
      shots: shots ?? this.shots,
      goals: goals ?? this.goals,
      passes: passes ?? this.passes,
      tackles: tackles ?? this.tackles,
      duels: duels ?? this.duels,
      dribbles: dribbles ?? this.dribbles,
      fouls: fouls ?? this.fouls,
      cards: cards ?? this.cards,
      penalty: penalty ?? this.penalty,
    );
  }

  factory Statistic.fromJson(Map<String, dynamic> json) {
    return Statistic(
      team: json["team"] == null ? null : Team.fromJson(json["team"]),
      league: json["league"] == null ? null : League.fromJson(json["league"]),
      games: json["games"] == null ? null : Games.fromJson(json["games"]),
      substitutes: json["substitutes"] == null
          ? null
          : Substitutes.fromJson(json["substitutes"]),
      shots: json["shots"] == null ? null : Shots.fromJson(json["shots"]),
      goals: json["goals"] == null ? null : Goals.fromJson(json["goals"]),
      passes: json["passes"] == null ? null : Passes.fromJson(json["passes"]),
      tackles:
          json["tackles"] == null ? null : Tackles.fromJson(json["tackles"]),
      duels: json["duels"] == null ? null : Duels.fromJson(json["duels"]),
      dribbles:
          json["dribbles"] == null ? null : Dribbles.fromJson(json["dribbles"]),
      fouls: json["fouls"] == null ? null : Fouls.fromJson(json["fouls"]),
      cards: json["cards"] == null ? null : Cards.fromJson(json["cards"]),
      penalty:
          json["penalty"] == null ? null : Penalty.fromJson(json["penalty"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "team": team?.toJson(),
        "league": league?.toJson(),
        "games": games?.toJson(),
        "substitutes": substitutes?.toJson(),
        "shots": shots?.toJson(),
        "goals": goals?.toJson(),
        "passes": passes?.toJson(),
        "tackles": tackles?.toJson(),
        "duels": duels?.toJson(),
        "dribbles": dribbles?.toJson(),
        "fouls": fouls?.toJson(),
        "cards": cards?.toJson(),
        "penalty": penalty?.toJson(),
      };

  @override
  String toString() {
    return "$team, $league, $games, $substitutes, $shots, $goals, $passes, $tackles, $duels, $dribbles, $fouls, $cards, $penalty, ";
  }
}

class Cards {
  Cards({
    required this.yellow,
    required this.yellowred,
    required this.red,
  });

  final int? yellow;
  final int? yellowred;
  final int? red;

  Cards copyWith({
    int? yellow,
    int? yellowred,
    int? red,
  }) {
    return Cards(
      yellow: yellow ?? this.yellow,
      yellowred: yellowred ?? this.yellowred,
      red: red ?? this.red,
    );
  }

  factory Cards.fromJson(Map<String, dynamic> json) {
    return Cards(
      yellow: json["yellow"],
      yellowred: json["yellowred"],
      red: json["red"],
    );
  }

  Map<String, dynamic> toJson() => {
        "yellow": yellow,
        "yellowred": yellowred,
        "red": red,
      };

  @override
  String toString() {
    return "$yellow, $yellowred, $red, ";
  }
}

class Dribbles {
  Dribbles({
    required this.attempts,
    required this.success,
    required this.past,
  });

  final int? attempts;
  final int? success;
  final dynamic past;

  Dribbles copyWith({
    int? attempts,
    int? success,
    dynamic past,
  }) {
    return Dribbles(
      attempts: attempts ?? this.attempts,
      success: success ?? this.success,
      past: past ?? this.past,
    );
  }

  factory Dribbles.fromJson(Map<String, dynamic> json) {
    return Dribbles(
      attempts: json["attempts"],
      success: json["success"],
      past: json["past"],
    );
  }

  Map<String, dynamic> toJson() => {
        "attempts": attempts,
        "success": success,
        "past": past,
      };

  @override
  String toString() {
    return "$attempts, $success, $past, ";
  }
}

class Duels {
  Duels({
    required this.total,
    required this.won,
  });

  final dynamic total;
  final dynamic won;

  Duels copyWith({
    dynamic total,
    dynamic won,
  }) {
    return Duels(
      total: total ?? this.total,
      won: won ?? this.won,
    );
  }

  factory Duels.fromJson(Map<String, dynamic> json) {
    return Duels(
      total: json["total"],
      won: json["won"],
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total,
        "won": won,
      };

  @override
  String toString() {
    return "$total, $won, ";
  }
}

class Fouls {
  Fouls({
    required this.drawn,
    required this.committed,
  });

  final int? drawn;
  final int? committed;

  Fouls copyWith({
    int? drawn,
    int? committed,
  }) {
    return Fouls(
      drawn: drawn ?? this.drawn,
      committed: committed ?? this.committed,
    );
  }

  factory Fouls.fromJson(Map<String, dynamic> json) {
    return Fouls(
      drawn: json["drawn"],
      committed: json["committed"],
    );
  }

  Map<String, dynamic> toJson() => {
        "drawn": drawn,
        "committed": committed,
      };

  @override
  String toString() {
    return "$drawn, $committed, ";
  }
}

class Games {
  Games({
    required this.appearences,
    required this.lineups,
    required this.minutes,
    required this.number,
    required this.position,
    required this.rating,
    required this.captain,
  });

  final int? appearences;
  final int? lineups;
  final int? minutes;
  final dynamic number;
  final String? position;
  final String? rating;
  final bool? captain;

  Games copyWith({
    int? appearences,
    int? lineups,
    int? minutes,
    dynamic number,
    String? position,
    String? rating,
    bool? captain,
  }) {
    return Games(
      appearences: appearences ?? this.appearences,
      lineups: lineups ?? this.lineups,
      minutes: minutes ?? this.minutes,
      number: number ?? this.number,
      position: position ?? this.position,
      rating: rating ?? this.rating,
      captain: captain ?? this.captain,
    );
  }

  factory Games.fromJson(Map<String, dynamic> json) {
    return Games(
      appearences: json["appearences"],
      lineups: json["lineups"],
      minutes: json["minutes"],
      number: json["number"],
      position: json["position"],
      rating: json["rating"],
      captain: json["captain"],
    );
  }

  Map<String, dynamic> toJson() => {
        "appearences": appearences,
        "lineups": lineups,
        "minutes": minutes,
        "number": number,
        "position": position,
        "rating": rating,
        "captain": captain,
      };

  @override
  String toString() {
    return "$appearences, $lineups, $minutes, $number, $position, $rating, $captain, ";
  }
}

class Goals {
  Goals({
    required this.total,
    required this.conceded,
    required this.assists,
    required this.saves,
  });

  final int? total;
  final dynamic conceded;
  final int? assists;
  final int? saves;

  Goals copyWith({
    int? total,
    dynamic conceded,
    int? assists,
    int? saves,
  }) {
    return Goals(
      total: total ?? this.total,
      conceded: conceded ?? this.conceded,
      assists: assists ?? this.assists,
      saves: saves ?? this.saves,
    );
  }

  factory Goals.fromJson(Map<String, dynamic> json) {
    return Goals(
      total: json["total"],
      conceded: json["conceded"],
      assists: json["assists"],
      saves: json["saves"],
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total,
        "conceded": conceded,
        "assists": assists,
        "saves": saves,
      };

  @override
  String toString() {
    return "$total, $conceded, $assists, $saves, ";
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

class Passes {
  Passes({
    required this.total,
    required this.key,
    required this.accuracy,
  });

  final int? total;
  final int? key;
  final int? accuracy;

  Passes copyWith({
    int? total,
    int? key,
    int? accuracy,
  }) {
    return Passes(
      total: total ?? this.total,
      key: key ?? this.key,
      accuracy: accuracy ?? this.accuracy,
    );
  }

  factory Passes.fromJson(Map<String, dynamic> json) {
    return Passes(
      total: json["total"],
      key: json["key"],
      accuracy: json["accuracy"],
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total,
        "key": key,
        "accuracy": accuracy,
      };

  @override
  String toString() {
    return "$total, $key, $accuracy, ";
  }
}

class Penalty {
  Penalty({
    required this.won,
    required this.commited,
    required this.scored,
    required this.missed,
    required this.saved,
  });

  final int? won;
  final dynamic commited;
  final int? scored;
  final int? missed;
  final dynamic saved;

  Penalty copyWith({
    int? won,
    dynamic commited,
    int? scored,
    int? missed,
    dynamic saved,
  }) {
    return Penalty(
      won: won ?? this.won,
      commited: commited ?? this.commited,
      scored: scored ?? this.scored,
      missed: missed ?? this.missed,
      saved: saved ?? this.saved,
    );
  }

  factory Penalty.fromJson(Map<String, dynamic> json) {
    return Penalty(
      won: json["won"],
      commited: json["commited"],
      scored: json["scored"],
      missed: json["missed"],
      saved: json["saved"],
    );
  }

  Map<String, dynamic> toJson() => {
        "won": won,
        "commited": commited,
        "scored": scored,
        "missed": missed,
        "saved": saved,
      };

  @override
  String toString() {
    return "$won, $commited, $scored, $missed, $saved, ";
  }
}

class Shots {
  Shots({
    required this.total,
    required this.on,
  });

  final int? total;
  final int? on;

  Shots copyWith({
    int? total,
    int? on,
  }) {
    return Shots(
      total: total ?? this.total,
      on: on ?? this.on,
    );
  }

  factory Shots.fromJson(Map<String, dynamic> json) {
    return Shots(
      total: json["total"],
      on: json["on"],
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total,
        "on": on,
      };

  @override
  String toString() {
    return "$total, $on, ";
  }
}

class Substitutes {
  Substitutes({
    required this.substitutesIn,
    required this.out,
    required this.bench,
  });

  final int? substitutesIn;
  final int? out;
  final int? bench;

  Substitutes copyWith({
    int? substitutesIn,
    int? out,
    int? bench,
  }) {
    return Substitutes(
      substitutesIn: substitutesIn ?? this.substitutesIn,
      out: out ?? this.out,
      bench: bench ?? this.bench,
    );
  }

  factory Substitutes.fromJson(Map<String, dynamic> json) {
    return Substitutes(
      substitutesIn: json["in"],
      out: json["out"],
      bench: json["bench"],
    );
  }

  Map<String, dynamic> toJson() => {
        "in": substitutesIn,
        "out": out,
        "bench": bench,
      };

  @override
  String toString() {
    return "$substitutesIn, $out, $bench, ";
  }
}

class Tackles {
  Tackles({
    required this.total,
    required this.blocks,
    required this.interceptions,
  });

  final int? total;
  final int? blocks;
  final int? interceptions;

  Tackles copyWith({
    int? total,
    int? blocks,
    int? interceptions,
  }) {
    return Tackles(
      total: total ?? this.total,
      blocks: blocks ?? this.blocks,
      interceptions: interceptions ?? this.interceptions,
    );
  }

  factory Tackles.fromJson(Map<String, dynamic> json) {
    return Tackles(
      total: json["total"],
      blocks: json["blocks"],
      interceptions: json["interceptions"],
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total,
        "blocks": blocks,
        "interceptions": interceptions,
      };

  @override
  String toString() {
    return "$total, $blocks, $interceptions, ";
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
	"get": "players",
	"parameters": {
		"id": "276",
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
			"player": {
				"id": 276,
				"name": "Neymar",
				"firstname": "Neymar",
				"lastname": "da Silva Santos Júnior",
				"age": 28,
				"birth": {
					"date": "1992-02-05",
					"place": "Mogi das Cruzes",
					"country": "Brazil"
				},
				"nationality": "Brazil",
				"height": "175 cm",
				"weight": "68 kg",
				"injured": false,
				"photo": "https://media.api-sports.io/football/players/276.png"
			},
			"statistics": [
				{
					"team": {
						"id": 85,
						"name": "Paris Saint Germain",
						"logo": "https://media.api-sports.io/football/teams/85.png"
					},
					"league": {
						"id": 61,
						"name": "Ligue 1",
						"country": "France",
						"logo": "https://media.api-sports.io/football/leagues/61.png",
						"flag": "https://media.api-sports.io/flags/fr.svg",
						"season": 2019
					},
					"games": {
						"appearences": 15,
						"lineups": 15,
						"minutes": 1322,
						"number": null,
						"position": "Attacker",
						"rating": "8.053333",
						"captain": false
					},
					"substitutes": {
						"in": 0,
						"out": 3,
						"bench": 0
					},
					"shots": {
						"total": 70,
						"on": 36
					},
					"goals": {
						"total": 13,
						"conceded": null,
						"assists": 6,
						"saves": 0
					},
					"passes": {
						"total": 704,
						"key": 39,
						"accuracy": 79
					},
					"tackles": {
						"total": 13,
						"blocks": 0,
						"interceptions": 4
					},
					"duels": {
						"total": null,
						"won": null
					},
					"dribbles": {
						"attempts": 143,
						"success": 88,
						"past": null
					},
					"fouls": {
						"drawn": 62,
						"committed": 14
					},
					"cards": {
						"yellow": 3,
						"yellowred": 1,
						"red": 0
					},
					"penalty": {
						"won": 1,
						"commited": null,
						"scored": 4,
						"missed": 1,
						"saved": null
					}
				}
			]
		}
	]
}*/
