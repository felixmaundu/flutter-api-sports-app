// ignore_for_file: file_names

class PlayerStatisticsModel {
  String? get;
  Parameters? parameters;

  int? results;
  Paging? paging;
  List<Response>? response;

  PlayerStatisticsModel(
      {this.get, this.parameters, this.results, this.paging, this.response});

  PlayerStatisticsModel.fromJson(Map<String, dynamic> json) {
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
  String? fixture;

  Parameters({this.fixture});

  Parameters.fromJson(Map<String, dynamic> json) {
    fixture = json['fixture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fixture'] = fixture;
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
  Team? team;
  List<Players>? players;

  Response({this.team, this.players});

  Response.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (team != null) {
      data['team'] = team!.toJson();
    }
    if (players != null) {
      data['players'] = players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? logo;
  String? update;

  Team({this.id, this.name, this.logo, this.update});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    update = json['update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['update'] = update;
    return data;
  }
}

class Players {
  Player? player;
  List<Statistics>? statistics;

  Players({this.player, this.statistics});

  Players.fromJson(Map<String, dynamic> json) {
    player = json['player'] != null ? Player.fromJson(json['player']) : null;
    if (json['statistics'] != null) {
      statistics = <Statistics>[];
      json['statistics'].forEach((v) {
        statistics!.add(Statistics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (player != null) {
      data['player'] = player!.toJson();
    }
    if (statistics != null) {
      data['statistics'] = statistics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Player {
  int? id;
  String? name;
  String? photo;

  Player({this.id, this.name, this.photo});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}

class Statistics {
  Games? games;
  int? offsides;
  Shots? shots;
  Goals? goals;
  Passes? passes;
  Tackles? tackles;
  Duels? duels;
  Dribbles? dribbles;
  Fouls? fouls;
  Cards? cards;
  Penalty? penalty;

  Statistics(
      {this.games,
      this.offsides,
      this.shots,
      this.goals,
      this.passes,
      this.tackles,
      this.duels,
      this.dribbles,
      this.fouls,
      this.cards,
      this.penalty});

  Statistics.fromJson(Map<String, dynamic> json) {
    games = json['games'] != null ? Games.fromJson(json['games']) : null;
    offsides = json['offsides'];
    shots = json['shots'] != null ? Shots.fromJson(json['shots']) : null;
    goals = json['goals'] != null ? Goals.fromJson(json['goals']) : null;
    passes = json['passes'] != null ? Passes.fromJson(json['passes']) : null;
    tackles =
        json['tackles'] != null ? Tackles.fromJson(json['tackles']) : null;
    duels = json['duels'] != null ? Duels.fromJson(json['duels']) : null;
    dribbles =
        json['dribbles'] != null ? Dribbles.fromJson(json['dribbles']) : null;
    fouls = json['fouls'] != null ? Fouls.fromJson(json['fouls']) : null;
    cards = json['cards'] != null ? Cards.fromJson(json['cards']) : null;
    penalty =
        json['penalty'] != null ? Penalty.fromJson(json['penalty']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (games != null) {
      data['games'] = games!.toJson();
    }
    data['offsides'] = offsides;
    if (shots != null) {
      data['shots'] = shots!.toJson();
    }
    if (goals != null) {
      data['goals'] = goals!.toJson();
    }
    if (passes != null) {
      data['passes'] = passes!.toJson();
    }
    if (tackles != null) {
      data['tackles'] = tackles!.toJson();
    }
    if (duels != null) {
      data['duels'] = duels!.toJson();
    }
    if (dribbles != null) {
      data['dribbles'] = dribbles!.toJson();
    }
    if (fouls != null) {
      data['fouls'] = fouls!.toJson();
    }
    if (cards != null) {
      data['cards'] = cards!.toJson();
    }
    if (penalty != null) {
      data['penalty'] = penalty!.toJson();
    }
    return data;
  }
}

class Games {
  int? minutes;
  int? number;
  String? position;
  String? rating;
  bool? captain;
  bool? substitute;

  Games(
      {this.minutes,
      this.number,
      this.position,
      this.rating,
      this.captain,
      this.substitute});

  Games.fromJson(Map<String, dynamic> json) {
    minutes = json['minutes'];
    number = json['number'];
    position = json['position'];
    rating = json['rating'];
    captain = json['captain'];
    substitute = json['substitute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['minutes'] = minutes;
    data['number'] = number;
    data['position'] = position;
    data['rating'] = rating;
    data['captain'] = captain;
    data['substitute'] = substitute;
    return data;
  }
}

class Shots {
  int? total;
  int? on;

  Shots({this.total, this.on});

  Shots.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    on = json['on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['on'] = on;
    return data;
  }
}

class Goals {
  int? total;
  int? conceded;
  int? assists;
  int? saves;

  Goals({this.total, this.conceded, this.assists, this.saves});

  Goals.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    conceded = json['conceded'];
    assists = json['assists'];
    saves = json['saves'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['conceded'] = conceded;
    data['assists'] = assists;
    data['saves'] = saves;
    return data;
  }
}

class Passes {
  int? total;
  int? key;
  String? accuracy;

  Passes({this.total, this.key, this.accuracy});

  Passes.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    key = json['key'];
    accuracy = json['accuracy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['key'] = key;
    data['accuracy'] = accuracy;
    return data;
  }
}

class Tackles {
  int? total;
  int? blocks;
  int? interceptions;

  Tackles({this.total, this.blocks, this.interceptions});

  Tackles.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    blocks = json['blocks'];
    interceptions = json['interceptions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['blocks'] = blocks;
    data['interceptions'] = interceptions;
    return data;
  }
}

class Duels {
  int? total;
  int? won;

  Duels({this.total, this.won});

  Duels.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    won = json['won'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['won'] = won;
    return data;
  }
}

class Dribbles {
  int? attempts;
  int? success;
  int? past;

  Dribbles({this.attempts, this.success, this.past});

  Dribbles.fromJson(Map<String, dynamic> json) {
    attempts = json['attempts'];
    success = json['success'];
    past = json['past'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attempts'] = attempts;
    data['success'] = success;
    data['past'] = past;
    return data;
  }
}

class Fouls {
  int? drawn;
  int? committed;

  Fouls({this.drawn, this.committed});

  Fouls.fromJson(Map<String, dynamic> json) {
    drawn = json['drawn'];
    committed = json['committed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['drawn'] = drawn;
    data['committed'] = committed;
    return data;
  }
}

class Cards {
  int? yellow;
  int? red;

  Cards({this.yellow, this.red});

  Cards.fromJson(Map<String, dynamic> json) {
    yellow = json['yellow'];
    red = json['red'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['yellow'] = yellow;
    data['red'] = red;
    return data;
  }
}

class Penalty {
  int? won;
  int? commited;
  int? scored;
  int? missed;
  int? saved;

  Penalty({this.won, this.commited, this.scored, this.missed, this.saved});

  Penalty.fromJson(Map<String, dynamic> json) {
    won = json['won'];
    commited = json['commited'];
    scored = json['scored'];
    missed = json['missed'];
    saved = json['saved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['won'] = won;
    data['commited'] = commited;
    data['scored'] = scored;
    data['missed'] = missed;
    data['saved'] = saved;
    return data;
  }
}
