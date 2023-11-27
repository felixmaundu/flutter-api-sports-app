// ignore_for_file: file_names

class TeamCountriesModel {
  TeamCountriesModel({
    required this.teamCountriesModelGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  final String? teamCountriesModelGet;
  final List<dynamic> parameters;
  final List<dynamic> errors;
  final int? results;
  final Paging? paging;
  final List<Response> response;

  TeamCountriesModel copyWith({
    String? teamCountriesModelGet,
    List<dynamic>? parameters,
    List<dynamic>? errors,
    int? results,
    Paging? paging,
    List<Response>? response,
  }) {
    return TeamCountriesModel(
      teamCountriesModelGet:
          teamCountriesModelGet ?? this.teamCountriesModelGet,
      parameters: parameters ?? this.parameters,
      errors: errors ?? this.errors,
      results: results ?? this.results,
      paging: paging ?? this.paging,
      response: response ?? this.response,
    );
  }

  factory TeamCountriesModel.fromJson(Map<String, dynamic> json) {
    return TeamCountriesModel(
      teamCountriesModelGet: json["get"],
      parameters: json["parameters"] == null
          ? []
          : List<dynamic>.from(json["parameters"]!.map((x) => x)),
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
        "get": teamCountriesModelGet,
        "parameters": parameters.map((x) => x).toList(),
        "errors": errors.map((x) => x).toList(),
        "results": results,
        "paging": paging?.toJson(),
        "response": response.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$teamCountriesModelGet, $parameters, $errors, $results, $paging, $response, ";
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

class Response {
  Response({
    required this.name,
    required this.code,
    required this.flag,
  });

  final String? name;
  final String? code;
  final String? flag;

  Response copyWith({
    String? name,
    String? code,
    String? flag,
  }) {
    return Response(
      name: name ?? this.name,
      code: code ?? this.code,
      flag: flag ?? this.flag,
    );
  }

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      name: json["name"],
      code: json["code"],
      flag: json["flag"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "flag": flag,
      };

  @override
  String toString() {
    return "$name, $code, $flag, ";
  }
}

/*
{
	"get": "teams/countries",
	"parameters": [],
	"errors": [],
	"results": 258,
	"paging": {
		"current": 1,
		"total": 1
	},
	"response": [
		{
			"name": "England",
			"code": "GB",
			"flag": "https://media.api-sports.io/flags/gb.svg"
		}
	]
}*/
