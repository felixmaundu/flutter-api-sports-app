// ignore_for_file: file_names

class TeamSeasonsModel {
  TeamSeasonsModel({
    required this.teamSeasonsModelGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  final String? teamSeasonsModelGet;
  final Parameters? parameters;
  final List<dynamic> errors;
  final int? results;
  final Paging? paging;
  final List<int> response;

  TeamSeasonsModel copyWith({
    String? teamSeasonsModelGet,
    Parameters? parameters,
    List<dynamic>? errors,
    int? results,
    Paging? paging,
    List<int>? response,
  }) {
    return TeamSeasonsModel(
      teamSeasonsModelGet: teamSeasonsModelGet ?? this.teamSeasonsModelGet,
      parameters: parameters ?? this.parameters,
      errors: errors ?? this.errors,
      results: results ?? this.results,
      paging: paging ?? this.paging,
      response: response ?? this.response,
    );
  }

  factory TeamSeasonsModel.fromJson(Map<String, dynamic> json) {
    return TeamSeasonsModel(
      teamSeasonsModelGet: json["get"],
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
          : List<int>.from(json["response"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "get": teamSeasonsModelGet,
        "parameters": parameters?.toJson(),
        "errors": errors.map((x) => x).toList(),
        "results": results,
        "paging": paging?.toJson(),
        "response": response.map((x) => x).toList(),
      };

  @override
  String toString() {
    return "$teamSeasonsModelGet, $parameters, $errors, $results, $paging, $response, ";
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
  });

  final String? team;

  Parameters copyWith({
    String? team,
  }) {
    return Parameters(
      team: team ?? this.team,
    );
  }

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      team: json["team"],
    );
  }

  Map<String, dynamic> toJson() => {
        "team": team,
      };

  @override
  String toString() {
    return "$team, ";
  }
}

/*
{
	"get": "teams/seasons",
	"parameters": {
		"team": "33"
	},
	"errors": [],
	"results": 1,
	"paging": {
		"current": 1,
		"total": 1
	},
	"response": [
		2010,
		2011,
		2012,
		2013,
		2014,
		2015,
		2016,
		2017,
		2018,
		2019,
		2020,
		2021
	]
}*/
