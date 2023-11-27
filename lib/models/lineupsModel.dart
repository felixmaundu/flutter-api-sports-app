// https://dart-quicktype.netlify.app/
// ignore_for_file: file_names

class LineupsModel {
  LineupsModel({
    required this.lineupsModelGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  final String? lineupsModelGet;
  static const String lineupsModelGetKey = "get";

  final Parameters? parameters;
  static const String parametersKey = "parameters";

  final List<dynamic> errors;
  static const String errorsKey = "errors";

  final int? results;
  static const String resultsKey = "results";

  final Paging? paging;
  static const String pagingKey = "paging";

  final List<Response> response;
  static const String responseKey = "response";

  LineupsModel copyWith({
    String? lineupsModelGet,
    Parameters? parameters,
    List<dynamic>? errors,
    int? results,
    Paging? paging,
    List<Response>? response,
  }) {
    return LineupsModel(
      lineupsModelGet: lineupsModelGet ?? this.lineupsModelGet,
      parameters: parameters ?? this.parameters,
      errors: errors ?? this.errors,
      results: results ?? this.results,
      paging: paging ?? this.paging,
      response: response ?? this.response,
    );
  }

  factory LineupsModel.fromJson(Map<String, dynamic> json) {
    return LineupsModel(
      lineupsModelGet: json["get"],
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
        "get": lineupsModelGet,
        "parameters": parameters?.toJson(),
        "errors": errors.map((x) => x).toList(),
        "results": results,
        "paging": paging?.toJson(),
        "response": response.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$lineupsModelGet, $parameters, $errors, $results, $paging, $response, ";
  }
}

class Paging {
  Paging({
    required this.current,
    required this.total,
  });

  final int? current;
  static const String currentKey = "current";

  final int? total;
  static const String totalKey = "total";

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
  static const String fixtureKey = "fixture";

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
    required this.team,
    required this.formation,
    required this.startXi,
    required this.substitutes,
    required this.coach,
  });

  final Team? team;
  static const String teamKey = "team";

  final String? formation;
  static const String formationKey = "formation";

  final List<StartXi> startXi;
  static const String startXiKey = "startXI";

  final List<StartXi> substitutes;
  static const String substitutesKey = "substitutes";

  final Coach? coach;
  static const String coachKey = "coach";

  Response copyWith({
    Team? team,
    String? formation,
    List<StartXi>? startXi,
    List<StartXi>? substitutes,
    Coach? coach,
  }) {
    return Response(
      team: team ?? this.team,
      formation: formation ?? this.formation,
      startXi: startXi ?? this.startXi,
      substitutes: substitutes ?? this.substitutes,
      coach: coach ?? this.coach,
    );
  }

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      team: json["team"] == null ? null : Team.fromJson(json["team"]),
      formation: json["formation"],
      startXi: json["startXI"] == null
          ? []
          : List<StartXi>.from(
              json["startXI"]!.map((x) => StartXi.fromJson(x))),
      substitutes: json["substitutes"] == null
          ? []
          : List<StartXi>.from(
              json["substitutes"]!.map((x) => StartXi.fromJson(x))),
      coach: json["coach"] == null ? null : Coach.fromJson(json["coach"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "team": team?.toJson(),
        "formation": formation,
        "startXI": startXi.map((x) => x.toJson()).toList(),
        "substitutes": substitutes.map((x) => x.toJson()).toList(),
        "coach": coach?.toJson(),
      };

  @override
  String toString() {
    return "$team, $formation, $startXi, $substitutes, $coach, ";
  }
}

class Coach {
  Coach({
    required this.id,
    required this.name,
    required this.photo,
  });

  final int? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final String? photo;
  static const String photoKey = "photo";

  Coach copyWith({
    int? id,
    String? name,
    String? photo,
  }) {
    return Coach(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      id: json["id"],
      name: json["name"],
      photo: json["photo"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo,
      };

  @override
  String toString() {
    return "$id, $name, $photo, ";
  }
}

class StartXi {
  StartXi({
    required this.player,
  });

  final Player? player;
  static const String playerKey = "player";

  StartXi copyWith({
    Player? player,
  }) {
    return StartXi(
      player: player ?? this.player,
    );
  }

  factory StartXi.fromJson(Map<String, dynamic> json) {
    return StartXi(
      player: json["player"] == null ? null : Player.fromJson(json["player"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "player": player?.toJson(),
      };

  @override
  String toString() {
    return "$player, ";
  }
}

class Player {
  Player({
    required this.id,
    required this.name,
    required this.number,
    required this.pos,
    required this.grid,
  });

  final int? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final int? number;
  static const String numberKey = "number";

  final String? pos;
  static const String posKey = "pos";

  final String? grid;
  static const String gridKey = "grid";

  Player copyWith({
    int? id,
    String? name,
    int? number,
    String? pos,
    String? grid,
  }) {
    return Player(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      pos: pos ?? this.pos,
      grid: grid ?? this.grid,
    );
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json["id"],
      name: json["name"],
      number: json["number"],
      pos: json["pos"],
      grid: json["grid"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "number": number,
        "pos": pos,
        "grid": grid,
      };

  @override
  String toString() {
    return "$id, $name, $number, $pos, $grid, ";
  }
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.logo,
    required this.colors,
  });

  final int? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final String? logo;
  static const String logoKey = "logo";

  final Colors? colors;
  static const String colorsKey = "colors";

  Team copyWith({
    int? id,
    String? name,
    String? logo,
    Colors? colors,
  }) {
    return Team(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      colors: colors ?? this.colors,
    );
  }

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json["id"],
      name: json["name"],
      logo: json["logo"],
      colors: json["colors"] == null ? null : Colors.fromJson(json["colors"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "colors": colors?.toJson(),
      };

  @override
  String toString() {
    return "$id, $name, $logo, $colors, ";
  }
}

class Colors {
  Colors({
    required this.player,
    required this.goalkeeper,
  });

  final Goalkeeper? player;
  static const String playerKey = "player";

  final Goalkeeper? goalkeeper;
  static const String goalkeeperKey = "goalkeeper";

  Colors copyWith({
    Goalkeeper? player,
    Goalkeeper? goalkeeper,
  }) {
    return Colors(
      player: player ?? this.player,
      goalkeeper: goalkeeper ?? this.goalkeeper,
    );
  }

  factory Colors.fromJson(Map<String, dynamic> json) {
    return Colors(
      player:
          json["player"] == null ? null : Goalkeeper.fromJson(json["player"]),
      goalkeeper: json["goalkeeper"] == null
          ? null
          : Goalkeeper.fromJson(json["goalkeeper"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "player": player?.toJson(),
        "goalkeeper": goalkeeper?.toJson(),
      };

  @override
  String toString() {
    return "$player, $goalkeeper, ";
  }
}

class Goalkeeper {
  Goalkeeper({
    required this.primary,
    required this.number,
    required this.border,
  });

  final String? primary;
  static const String primaryKey = "primary";

  final String? number;
  static const String numberKey = "number";

  final String? border;
  static const String borderKey = "border";

  Goalkeeper copyWith({
    String? primary,
    String? number,
    String? border,
  }) {
    return Goalkeeper(
      primary: primary ?? this.primary,
      number: number ?? this.number,
      border: border ?? this.border,
    );
  }

  factory Goalkeeper.fromJson(Map<String, dynamic> json) {
    return Goalkeeper(
      primary: json["primary"],
      number: json["number"],
      border: json["border"],
    );
  }

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "number": number,
        "border": border,
      };

  @override
  String toString() {
    return "$primary, $number, $border, ";
  }
}

/*
{
	"get": "fixtures/lineups",
	"parameters": {
		"fixture": "592872"
	},
	"errors": [],
	"results": 2,
	"paging": {
		"current": 1,
		"total": 1
	},
	"response": [
		{
			"team": {
				"id": 50,
				"name": "Manchester City",
				"logo": "https://media.api-sports.io/football/teams/50.png",
				"colors": {
					"player": {
						"primary": "5badff",
						"number": "ffffff",
						"border": "99ff99"
					},
					"goalkeeper": {
						"primary": "99ff99",
						"number": "000000",
						"border": "99ff99"
					}
				}
			},
			"formation": "4-3-3",
			"startXI": [
				{
					"player": {
						"id": 617,
						"name": "Ederson",
						"number": 31,
						"pos": "G",
						"grid": "1:1"
					}
				},
				{
					"player": {
						"id": 627,
						"name": "Kyle Walker",
						"number": 2,
						"pos": "D",
						"grid": "2:4"
					}
				},
				{
					"player": {
						"id": 626,
						"name": "John Stones",
						"number": 5,
						"pos": "D",
						"grid": "2:3"
					}
				},
				{
					"player": {
						"id": 567,
						"name": "Rúben Dias",
						"number": 3,
						"pos": "D",
						"grid": "2:2"
					}
				},
				{
					"player": {
						"id": 641,
						"name": "Oleksandr Zinchenko",
						"number": 11,
						"pos": "D",
						"grid": "2:1"
					}
				},
				{
					"player": {
						"id": 629,
						"name": "Kevin De Bruyne",
						"number": 17,
						"pos": "M",
						"grid": "3:3"
					}
				},
				{
					"player": {
						"id": 640,
						"name": "Fernandinho",
						"number": 25,
						"pos": "M",
						"grid": "3:2"
					}
				},
				{
					"player": {
						"id": 631,
						"name": "Phil Foden",
						"number": 47,
						"pos": "M",
						"grid": "3:1"
					}
				},
				{
					"player": {
						"id": 635,
						"name": "Riyad Mahrez",
						"number": 26,
						"pos": "F",
						"grid": "4:3"
					}
				},
				{
					"player": {
						"id": 643,
						"name": "Gabriel Jesus",
						"number": 9,
						"pos": "F",
						"grid": "4:2"
					}
				},
				{
					"player": {
						"id": 645,
						"name": "Raheem Sterling",
						"number": 7,
						"pos": "F",
						"grid": "4:1"
					}
				}
			],
			"substitutes": [
				{
					"player": {
						"id": 50828,
						"name": "Zack Steffen",
						"number": 13,
						"pos": "G",
						"grid": null
					}
				},
				{
					"player": {
						"id": 623,
						"name": "Benjamin Mendy",
						"number": 22,
						"pos": "D",
						"grid": null
					}
				},
				{
					"player": {
						"id": 18861,
						"name": "Nathan Aké",
						"number": 6,
						"pos": "D",
						"grid": null
					}
				},
				{
					"player": {
						"id": 622,
						"name": "Aymeric Laporte",
						"number": 14,
						"pos": "D",
						"grid": null
					}
				},
				{
					"player": {
						"id": 633,
						"name": "İlkay Gündoğan",
						"number": 8,
						"pos": "M",
						"grid": null
					}
				},
				{
					"player": {
						"id": 44,
						"name": "Rodri",
						"number": 16,
						"pos": "M",
						"grid": null
					}
				},
				{
					"player": {
						"id": 931,
						"name": "Ferrán Torres",
						"number": 21,
						"pos": "F",
						"grid": null
					}
				},
				{
					"player": {
						"id": 636,
						"name": "Bernardo Silva",
						"number": 20,
						"pos": "M",
						"grid": null
					}
				},
				{
					"player": {
						"id": 642,
						"name": "Sergio Agüero",
						"number": 10,
						"pos": "F",
						"grid": null
					}
				}
			],
			"coach": {
				"id": 4,
				"name": "Guardiola",
				"photo": "https://media.api-sports.io/football/coachs/4.png"
			}
		},
		{
			"team": {
				"id": 45,
				"name": "Everton",
				"logo": "https://media.api-sports.io/football/teams/45.png",
				"colors": {
					"player": {
						"primary": "070707",
						"number": "ffffff",
						"border": "66ff00"
					},
					"goalkeeper": {
						"primary": "66ff00",
						"number": "000000",
						"border": "66ff00"
					}
				}
			},
			"formation": "4-3-1-2",
			"startXI": [
				{
					"player": {
						"id": 2932,
						"name": "Jordan Pickford",
						"number": 1,
						"pos": "G",
						"grid": "1:1"
					}
				},
				{
					"player": {
						"id": 19150,
						"name": "Mason Holgate",
						"number": 4,
						"pos": "D",
						"grid": "2:4"
					}
				},
				{
					"player": {
						"id": 2934,
						"name": "Michael Keane",
						"number": 5,
						"pos": "D",
						"grid": "2:3"
					}
				},
				{
					"player": {
						"id": 19073,
						"name": "Ben Godfrey",
						"number": 22,
						"pos": "D",
						"grid": "2:2"
					}
				},
				{
					"player": {
						"id": 2724,
						"name": "Lucas Digne",
						"number": 12,
						"pos": "D",
						"grid": "2:1"
					}
				},
				{
					"player": {
						"id": 18805,
						"name": "Abdoulaye Doucouré",
						"number": 16,
						"pos": "M",
						"grid": "3:3"
					}
				},
				{
					"player": {
						"id": 326,
						"name": "Allan",
						"number": 6,
						"pos": "M",
						"grid": "3:2"
					}
				},
				{
					"player": {
						"id": 18762,
						"name": "Tom Davies",
						"number": 26,
						"pos": "M",
						"grid": "3:1"
					}
				},
				{
					"player": {
						"id": 2795,
						"name": "Gylfi Sigurðsson",
						"number": 10,
						"pos": "M",
						"grid": "4:1"
					}
				},
				{
					"player": {
						"id": 18766,
						"name": "Dominic Calvert-Lewin",
						"number": 9,
						"pos": "F",
						"grid": "5:2"
					}
				},
				{
					"player": {
						"id": 2413,
						"name": "Richarlison",
						"number": 7,
						"pos": "F",
						"grid": "5:1"
					}
				}
			],
			"substitutes": [
				{
					"player": {
						"id": 18755,
						"name": "João Virgínia",
						"number": 31,
						"pos": "G",
						"grid": null
					}
				},
				{
					"player": {
						"id": 766,
						"name": "Robin Olsen",
						"number": 33,
						"pos": "G",
						"grid": null
					}
				},
				{
					"player": {
						"id": 156490,
						"name": "Niels Nkounkou",
						"number": 18,
						"pos": "D",
						"grid": null
					}
				},
				{
					"player": {
						"id": 18758,
						"name": "Séamus Coleman",
						"number": 23,
						"pos": "D",
						"grid": null
					}
				},
				{
					"player": {
						"id": 138849,
						"name": "Kyle John",
						"number": 48,
						"pos": "D",
						"grid": null
					}
				},
				{
					"player": {
						"id": 18765,
						"name": "André Gomes",
						"number": 21,
						"pos": "M",
						"grid": null
					}
				},
				{
					"player": {
						"id": 1455,
						"name": "Alex Iwobi",
						"number": 17,
						"pos": "F",
						"grid": null
					}
				},
				{
					"player": {
						"id": 18761,
						"name": "Bernard",
						"number": 20,
						"pos": "F",
						"grid": null
					}
				}
			],
			"coach": {
				"id": 2407,
				"name": "C. Ancelotti",
				"photo": "https://media.api-sports.io/football/coachs/2407.png"
			}
		}
	]
}*/