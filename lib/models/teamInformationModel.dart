// ignore_for_file: file_names

class TeamInformationModel {
  TeamInformationModel({
    required this.teamInformationModelGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  final String? teamInformationModelGet;
  static const String teamInformationModelGetKey = "get";

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

  TeamInformationModel copyWith({
    String? teamInformationModelGet,
    Parameters? parameters,
    List<dynamic>? errors,
    int? results,
    Paging? paging,
    List<Response>? response,
  }) {
    return TeamInformationModel(
      teamInformationModelGet:
          teamInformationModelGet ?? this.teamInformationModelGet,
      parameters: parameters ?? this.parameters,
      errors: errors ?? this.errors,
      results: results ?? this.results,
      paging: paging ?? this.paging,
      response: response ?? this.response,
    );
  }

  factory TeamInformationModel.fromJson(Map<String, dynamic> json) {
    return TeamInformationModel(
      teamInformationModelGet: json["get"],
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
        "get": teamInformationModelGet,
        "parameters": parameters?.toJson(),
        "errors": errors.map((x) => x).toList(),
        "results": results,
        "paging": paging?.toJson(),
        "response": response.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$teamInformationModelGet, $parameters, $errors, $results, $paging, $response, ";
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
    required this.id,
  });

  final String? id;
  static const String idKey = "id";

  Parameters copyWith({
    String? id,
  }) {
    return Parameters(
      id: id ?? this.id,
    );
  }

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
      };

  @override
  String toString() {
    return "$id, ";
  }
}

class Response {
  Response({
    required this.team,
    required this.venue,
  });

  final Team? team;
  static const String teamKey = "team";

  final Venue? venue;
  static const String venueKey = "venue";

  Response copyWith({
    Team? team,
    Venue? venue,
  }) {
    return Response(
      team: team ?? this.team,
      venue: venue ?? this.venue,
    );
  }

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      team: json["team"] == null ? null : Team.fromJson(json["team"]),
      venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "team": team?.toJson(),
        "venue": venue?.toJson(),
      };

  @override
  String toString() {
    return "$team, $venue, ";
  }
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.code,
    required this.country,
    required this.founded,
    required this.national,
    required this.logo,
  });

  final int? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final String? code;
  static const String codeKey = "code";

  final String? country;
  static const String countryKey = "country";

  final int? founded;
  static const String foundedKey = "founded";

  final bool? national;
  static const String nationalKey = "national";

  final String? logo;
  static const String logoKey = "logo";

  Team copyWith({
    int? id,
    String? name,
    String? code,
    String? country,
    int? founded,
    bool? national,
    String? logo,
  }) {
    return Team(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      country: country ?? this.country,
      founded: founded ?? this.founded,
      national: national ?? this.national,
      logo: logo ?? this.logo,
    );
  }

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json["id"],
      name: json["name"],
      code: json["code"],
      country: json["country"],
      founded: json["founded"],
      national: json["national"],
      logo: json["logo"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "country": country,
        "founded": founded,
        "national": national,
        "logo": logo,
      };

  @override
  String toString() {
    return "$id, $name, $code, $country, $founded, $national, $logo, ";
  }
}

class Venue {
  Venue({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.capacity,
    required this.surface,
    required this.image,
  });

  final int? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final String? address;
  static const String addressKey = "address";

  final String? city;
  static const String cityKey = "city";

  final int? capacity;
  static const String capacityKey = "capacity";

  final String? surface;
  static const String surfaceKey = "surface";

  final String? image;
  static const String imageKey = "image";

  Venue copyWith({
    int? id,
    String? name,
    String? address,
    String? city,
    int? capacity,
    String? surface,
    String? image,
  }) {
    return Venue(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      capacity: capacity ?? this.capacity,
      surface: surface ?? this.surface,
      image: image ?? this.image,
    );
  }

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json["id"],
      name: json["name"],
      address: json["address"],
      city: json["city"],
      capacity: json["capacity"],
      surface: json["surface"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "city": city,
        "capacity": capacity,
        "surface": surface,
        "image": image,
      };

  @override
  String toString() {
    return "$id, $name, $address, $city, $capacity, $surface, $image, ";
  }
}

/*
{
	"get": "teams",
	"parameters": {
		"id": "33"
	},
	"errors": [],
	"results": 1,
	"paging": {
		"current": 1,
		"total": 1
	},
	"response": [
		{
			"team": {
				"id": 33,
				"name": "Manchester United",
				"code": "MUN",
				"country": "England",
				"founded": 1878,
				"national": false,
				"logo": "https://media.api-sports.io/football/teams/33.png"
			},
			"venue": {
				"id": 556,
				"name": "Old Trafford",
				"address": "Sir Matt Busby Way",
				"city": "Manchester",
				"capacity": 76212,
				"surface": "grass",
				"image": "https://media.api-sports.io/football/venues/556.png"
			}
		}
	]
}*/