// ignore_for_file: file_names

class SidelinedModel {
  SidelinedModel({
    required this.sidelinedModelGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  final String? sidelinedModelGet;
  final Parameters? parameters;
  final List<dynamic> errors;
  final int? results;
  final Paging? paging;
  final List<Response> response;

  SidelinedModel copyWith({
    String? sidelinedModelGet,
    Parameters? parameters,
    List<dynamic>? errors,
    int? results,
    Paging? paging,
    List<Response>? response,
  }) {
    return SidelinedModel(
      sidelinedModelGet: sidelinedModelGet ?? this.sidelinedModelGet,
      parameters: parameters ?? this.parameters,
      errors: errors ?? this.errors,
      results: results ?? this.results,
      paging: paging ?? this.paging,
      response: response ?? this.response,
    );
  }

  factory SidelinedModel.fromJson(Map<String, dynamic> json) {
    return SidelinedModel(
      sidelinedModelGet: json["get"],
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
        "get": sidelinedModelGet,
        "parameters": parameters?.toJson(),
        "errors": errors.map((x) => x).toList(),
        "results": results,
        "paging": paging?.toJson(),
        "response": response.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$sidelinedModelGet, $parameters, $errors, $results, $paging, $response, ";
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
    required this.player,
  });

  final String? player;

  Parameters copyWith({
    String? player,
  }) {
    return Parameters(
      player: player ?? this.player,
    );
  }

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      player: json["player"],
    );
  }

  Map<String, dynamic> toJson() => {
        "player": player,
      };

  @override
  String toString() {
    return "$player, ";
  }
}

class Response {
  Response({
    required this.type,
    required this.start,
    required this.end,
  });

  final String? type;
  final DateTime? start;
  final DateTime? end;

  Response copyWith({
    String? type,
    DateTime? start,
    DateTime? end,
  }) {
    return Response(
      type: type ?? this.type,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      type: json["type"],
      start: DateTime.tryParse(json["start"] ?? ""),
      end: DateTime.tryParse(json["end"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "start":
            "${start?.year.toString().padLeft(4, '0')}-${start?.month.toString().padLeft(2, '0')}-${start?.day.toString().padLeft(2, '0')}",
        "end":
            "${end?.year.toString().padLeft(4, '0')}-${end?.month.toString().padLeft(2, '0')}-${end?.day.toString().padLeft(2, '0')}",
      };

  @override
  String toString() {
    return "$type, $start, $end, ";
  }
}

/*
{
	"get": "sidelined",
	"parameters": {
		"player": "276"
	},
	"errors": [],
	"results": 27,
	"paging": {
		"current": 1,
		"total": 1
	},
	"response": [
		{
			"type": "Suspended",
			"start": "2020-02-26",
			"end": "2020-03-01"
		},
		{
			"type": "Hip/Thigh Injury",
			"start": "2020-02-02",
			"end": "2020-02-10"
		},
		{
			"type": "Groin/Pelvis Injury",
			"start": "2019-10-11",
			"end": "2019-11-20"
		},
		{
			"type": "Ankle/Foot Injury",
			"start": "2019-08-01",
			"end": "2019-08-23"
		},
		{
			"type": "Suspended",
			"start": "2019-05-15",
			"end": "2019-05-27"
		},
		{
			"type": "Ankle/Foot Injury",
			"start": "2019-01-24",
			"end": "2019-04-20"
		},
		{
			"type": "Groin Strain",
			"start": "2018-12-03",
			"end": "2019-01-02"
		},
		{
			"type": "Groin Strain",
			"start": "2018-11-21",
			"end": "2018-11-27"
		},
		{
			"type": "Broken Toe",
			"start": "2018-02-26",
			"end": "2018-05-20"
		},
		{
			"type": "Thigh Muscle Strain",
			"start": "2018-01-20",
			"end": "2018-01-25"
		},
		{
			"type": "Rib Injury",
			"start": "2018-01-11",
			"end": "2018-01-16"
		},
		{
			"type": "Suspended",
			"start": "2017-12-05",
			"end": "2017-12-11"
		},
		{
			"type": "Thigh Muscle Strain",
			"start": "2017-11-03",
			"end": "2017-11-15"
		},
		{
			"type": "Suspended",
			"start": "2017-10-23",
			"end": "2017-10-28"
		},
		{
			"type": "Ankle/Foot Injury",
			"start": "2017-09-21",
			"end": "2017-09-25"
		},
		{
			"type": "Suspended",
			"start": "2017-04-09",
			"end": "2017-04-27"
		},
		{
			"type": "Suspended",
			"start": "2016-12-04",
			"end": "2016-12-11"
		},
		{
			"type": "Suspended",
			"start": "2016-03-04",
			"end": "2016-03-07"
		},
		{
			"type": "Hamstring",
			"start": "2016-01-21",
			"end": "2016-01-26"
		},
		{
			"type": "Hamstring",
			"start": "2015-12-08",
			"end": "2015-12-16"
		},
		{
			"type": "Virus",
			"start": "2015-08-09",
			"end": "2015-08-26"
		},
		{
			"type": "Suspended",
			"start": "2015-03-01",
			"end": "2015-03-09"
		},
		{
			"type": "Sprained Ankle",
			"start": "2014-08-22",
			"end": "2014-08-29"
		},
		{
			"type": "Vertebral Fracture",
			"start": "2014-07-05",
			"end": "2014-08-05"
		},
		{
			"type": "Ankle/Foot Injury",
			"start": "2014-04-17",
			"end": "2014-05-10"
		},
		{
			"type": "Sprained Ankle",
			"start": "2014-01-17",
			"end": "2014-02-14"
		},
		{
			"type": "Suspended",
			"start": "2013-12-15",
			"end": "2013-12-23"
		}
	]
}*/


