// ignore_for_file: file_names

class PredictionModel {
  PredictionModel({
    required this.predictionsModelGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  final String? predictionsModelGet;
  static const String predictionsModelGetKey = "get";

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

  PredictionModel copyWith({
    String? predictionsModelGet,
    Parameters? parameters,
    List<dynamic>? errors,
    int? results,
    Paging? paging,
    List<Response>? response,
  }) {
    return PredictionModel(
      predictionsModelGet: predictionsModelGet ?? this.predictionsModelGet,
      parameters: parameters ?? this.parameters,
      errors: errors ?? this.errors,
      results: results ?? this.results,
      paging: paging ?? this.paging,
      response: response ?? this.response,
    );
  }

  factory PredictionModel.fromJson(Map<String, dynamic> json) {
    return PredictionModel(
      predictionsModelGet: json["get"],
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
        "get": predictionsModelGet,
        "parameters": parameters?.toJson(),
        "errors": errors.map((x) => x).toList(),
        "results": results,
        "paging": paging?.toJson(),
        "response": response.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$predictionsModelGet, $parameters, $errors, $results, $paging, $response, ";
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
    required this.predictions,
    required this.league,
    required this.teams,
    required this.comparison,
    required this.h2H,
  });

  final Predictions? predictions;
  static const String predictionsKey = "predictions";

  final H2HLeague? league;
  static const String leagueKey = "league";

  final Teams? teams;
  static const String teamsKey = "teams";

  final Comparison? comparison;
  static const String comparisonKey = "comparison";

  final List<H2H> h2H;
  static const String h2HKey = "h2h";

  Response copyWith({
    Predictions? predictions,
    H2HLeague? league,
    Teams? teams,
    Comparison? comparison,
    List<H2H>? h2H,
  }) {
    return Response(
      predictions: predictions ?? this.predictions,
      league: league ?? this.league,
      teams: teams ?? this.teams,
      comparison: comparison ?? this.comparison,
      h2H: h2H ?? this.h2H,
    );
  }

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      predictions: json["predictions"] == null
          ? null
          : Predictions.fromJson(json["predictions"]),
      league:
          json["league"] == null ? null : H2HLeague.fromJson(json["league"]),
      teams: json["teams"] == null ? null : Teams.fromJson(json["teams"]),
      comparison: json["comparison"] == null
          ? null
          : Comparison.fromJson(json["comparison"]),
      h2H: json["h2h"] == null
          ? []
          : List<H2H>.from(json["h2h"]!.map((x) => H2H.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "predictions": predictions?.toJson(),
        "league": league?.toJson(),
        "teams": teams?.toJson(),
        "comparison": comparison?.toJson(),
        "h2h": h2H.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$predictions, $league, $teams, $comparison, $h2H, ";
  }
}

class Comparison {
  Comparison({
    required this.form,
    required this.att,
    required this.def,
    required this.poissonDistribution,
    required this.h2H,
    required this.goals,
    required this.total,
  });

  final Teams? form;
  static const String formKey = "form";

  final Teams? att;
  static const String attKey = "att";

  final Teams? def;
  static const String defKey = "def";

  final Teams? poissonDistribution;
  static const String poissonDistributionKey = "poisson_distribution";

  final Teams? h2H;
  static const String h2HKey = "h2h";

  final Teams? goals;
  static const String goalsKey = "goals";

  final Teams? total;
  static const String totalKey = "total";

  Comparison copyWith({
    Teams? form,
    Teams? att,
    Teams? def,
    Teams? poissonDistribution,
    Teams? h2H,
    Teams? goals,
    Teams? total,
  }) {
    return Comparison(
      form: form ?? this.form,
      att: att ?? this.att,
      def: def ?? this.def,
      poissonDistribution: poissonDistribution ?? this.poissonDistribution,
      h2H: h2H ?? this.h2H,
      goals: goals ?? this.goals,
      total: total ?? this.total,
    );
  }

  factory Comparison.fromJson(Map<String, dynamic> json) {
    return Comparison(
      form: json["form"] == null ? null : Teams.fromJson(json["form"]),
      att: json["att"] == null ? null : Teams.fromJson(json["att"]),
      def: json["def"] == null ? null : Teams.fromJson(json["def"]),
      poissonDistribution: json["poisson_distribution"] == null
          ? null
          : Teams.fromJson(json["poisson_distribution"]),
      h2H: json["h2h"] == null ? null : Teams.fromJson(json["h2h"]),
      goals: json["goals"] == null ? null : Teams.fromJson(json["goals"]),
      total: json["total"] == null ? null : Teams.fromJson(json["total"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "form": form?.toJson(),
        "att": att?.toJson(),
        "def": def?.toJson(),
        "poisson_distribution": poissonDistribution?.toJson(),
        "h2h": h2H?.toJson(),
        "goals": goals?.toJson(),
        "total": total?.toJson(),
      };

  @override
  String toString() {
    return "$form, $att, $def, $poissonDistribution, $h2H, $goals, $total, ";
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
  static const String streakKey = "streak";

  final Teams? wins;
  static const String winsKey = "wins";

  final Teams? loses;
  static const String losesKey = "loses";

  final BiggestGoals? goals;
  static const String goalsKey = "goals";

  Biggest copyWith({
    Streak? streak,
    Teams? wins,
    Teams? loses,
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
      wins: json["wins"] == null ? null : Teams.fromJson(json["wins"]),
      loses: json["loses"] == null ? null : Teams.fromJson(json["loses"]),
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

class AwayLeague {
  AwayLeague({
    required this.form,
    required this.fixtures,
    required this.goals,
    required this.biggest,
    required this.cleanSheet,
    required this.failedToScore,
  });

  final String? form;
  static const String formKey = "form";

  final Fixtures? fixtures;
  static const String fixturesKey = "fixtures";

  final LeagueGoals? goals;
  static const String goalsKey = "goals";

  final Biggest? biggest;
  static const String biggestKey = "biggest";

  final CleanSheet? cleanSheet;
  static const String cleanSheetKey = "clean_sheet";

  final CleanSheet? failedToScore;
  static const String failedToScoreKey = "failed_to_score";

  AwayLeague copyWith({
    String? form,
    Fixtures? fixtures,
    LeagueGoals? goals,
    Biggest? biggest,
    CleanSheet? cleanSheet,
    CleanSheet? failedToScore,
  }) {
    return AwayLeague(
      form: form ?? this.form,
      fixtures: fixtures ?? this.fixtures,
      goals: goals ?? this.goals,
      biggest: biggest ?? this.biggest,
      cleanSheet: cleanSheet ?? this.cleanSheet,
      failedToScore: failedToScore ?? this.failedToScore,
    );
  }

  factory AwayLeague.fromJson(Map<String, dynamic> json) {
    return AwayLeague(
      form: json["form"],
      fixtures:
          json["fixtures"] == null ? null : Fixtures.fromJson(json["fixtures"]),
      goals: json["goals"] == null ? null : LeagueGoals.fromJson(json["goals"]),
      biggest:
          json["biggest"] == null ? null : Biggest.fromJson(json["biggest"]),
      cleanSheet: json["clean_sheet"] == null
          ? null
          : CleanSheet.fromJson(json["clean_sheet"]),
      failedToScore: json["failed_to_score"] == null
          ? null
          : CleanSheet.fromJson(json["failed_to_score"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "form": form,
        "fixtures": fixtures?.toJson(),
        "goals": goals?.toJson(),
        "biggest": biggest?.toJson(),
        "clean_sheet": cleanSheet?.toJson(),
        "failed_to_score": failedToScore?.toJson(),
      };

  @override
  String toString() {
    return "$form, $fixtures, $goals, $biggest, $cleanSheet, $failedToScore, ";
  }
}

class AwayClass {
  AwayClass({
    required this.id,
    required this.name,
    required this.logo,
    required this.winner,
    required this.last5,
    required this.league,
  });

  final int? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final String? logo;
  static const String logoKey = "logo";

  final bool? winner;
  static const String winnerKey = "winner";

  final Last5? last5;
  static const String last5Key = "last_5";

  final AwayLeague? league;
  static const String leagueKey = "league";

  AwayClass copyWith({
    int? id,
    String? name,
    String? logo,
    bool? winner,
    Last5? last5,
    AwayLeague? league,
  }) {
    return AwayClass(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      winner: winner ?? this.winner,
      last5: last5 ?? this.last5,
      league: league ?? this.league,
    );
  }

  factory AwayClass.fromJson(Map<String, dynamic> json) {
    return AwayClass(
      id: json["id"],
      name: json["name"],
      logo: json["logo"],
      winner: json["winner"],
      last5: json["last_5"] == null ? null : Last5.fromJson(json["last_5"]),
      league:
          json["league"] == null ? null : AwayLeague.fromJson(json["league"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "winner": winner,
        "last_5": last5?.toJson(),
        "league": league?.toJson(),
      };

  @override
  String toString() {
    return "$id, $name, $logo, $winner, $last5, $league, ";
  }
}

class Teams {
  Teams({
    required this.home,
    required this.away,
  });

  final dynamic home;
  static const String homeKey = "home";

  final dynamic away;
  static const String awayKey = "away";

  Teams copyWith({
    dynamic home,
    dynamic away,
  }) {
    return Teams(
      home: home ?? this.home,
      away: away ?? this.away,
    );
  }

  factory Teams.fromJson(Map<String, dynamic> json) {
    return Teams(
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

class BiggestGoals {
  BiggestGoals({
    required this.goalsFor,
    required this.against,
  });

  final FulltimeClass? goalsFor;
  static const String goalsForKey = "for";

  final FulltimeClass? against;
  static const String againstKey = "against";

  BiggestGoals copyWith({
    FulltimeClass? goalsFor,
    FulltimeClass? against,
  }) {
    return BiggestGoals(
      goalsFor: goalsFor ?? this.goalsFor,
      against: against ?? this.against,
    );
  }

  factory BiggestGoals.fromJson(Map<String, dynamic> json) {
    return BiggestGoals(
      goalsFor:
          json["for"] == null ? null : FulltimeClass.fromJson(json["for"]),
      against: json["against"] == null
          ? null
          : FulltimeClass.fromJson(json["against"]),
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

class FulltimeClass {
  FulltimeClass({
    required this.home,
    required this.away,
  });

  final int? home;
  static const String homeKey = "home";

  final int? away;
  static const String awayKey = "away";

  FulltimeClass copyWith({
    int? home,
    int? away,
  }) {
    return FulltimeClass(
      home: home ?? this.home,
      away: away ?? this.away,
    );
  }

  factory FulltimeClass.fromJson(Map<String, dynamic> json) {
    return FulltimeClass(
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
  static const String winsKey = "wins";

  final int? draws;
  static const String drawsKey = "draws";

  final int? loses;
  static const String losesKey = "loses";

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

class CleanSheet {
  CleanSheet({
    required this.home,
    required this.away,
    required this.total,
  });

  final int? home;
  static const String homeKey = "home";

  final int? away;
  static const String awayKey = "away";

  final int? total;
  static const String totalKey = "total";

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
  static const String playedKey = "played";

  final CleanSheet? wins;
  static const String winsKey = "wins";

  final CleanSheet? draws;
  static const String drawsKey = "draws";

  final CleanSheet? loses;
  static const String losesKey = "loses";

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

class LeagueGoals {
  LeagueGoals({
    required this.goalsFor,
    required this.against,
  });

  final FluffyAgainst? goalsFor;
  static const String goalsForKey = "for";

  final FluffyAgainst? against;
  static const String againstKey = "against";

  LeagueGoals copyWith({
    FluffyAgainst? goalsFor,
    FluffyAgainst? against,
  }) {
    return LeagueGoals(
      goalsFor: goalsFor ?? this.goalsFor,
      against: against ?? this.against,
    );
  }

  factory LeagueGoals.fromJson(Map<String, dynamic> json) {
    return LeagueGoals(
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
  });

  final CleanSheet? total;
  static const String totalKey = "total";

  final Average? average;
  static const String averageKey = "average";

  FluffyAgainst copyWith({
    CleanSheet? total,
    Average? average,
  }) {
    return FluffyAgainst(
      total: total ?? this.total,
      average: average ?? this.average,
    );
  }

  factory FluffyAgainst.fromJson(Map<String, dynamic> json) {
    return FluffyAgainst(
      total: json["total"] == null ? null : CleanSheet.fromJson(json["total"]),
      average:
          json["average"] == null ? null : Average.fromJson(json["average"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total?.toJson(),
        "average": average?.toJson(),
      };

  @override
  String toString() {
    return "$total, $average, ";
  }
}

class Average {
  Average({
    required this.home,
    required this.away,
    required this.total,
  });

  final String? home;
  static const String homeKey = "home";

  final String? away;
  static const String awayKey = "away";

  final String? total;
  static const String totalKey = "total";

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

class Last5 {
  Last5({
    required this.form,
    required this.att,
    required this.def,
    required this.goals,
  });

  final String? form;
  static const String formKey = "form";

  final String? att;
  static const String attKey = "att";

  final String? def;
  static const String defKey = "def";

  final Last5Goals? goals;
  static const String goalsKey = "goals";

  Last5 copyWith({
    String? form,
    String? att,
    String? def,
    Last5Goals? goals,
  }) {
    return Last5(
      form: form ?? this.form,
      att: att ?? this.att,
      def: def ?? this.def,
      goals: goals ?? this.goals,
    );
  }

  factory Last5.fromJson(Map<String, dynamic> json) {
    return Last5(
      form: json["form"],
      att: json["att"],
      def: json["def"],
      goals: json["goals"] == null ? null : Last5Goals.fromJson(json["goals"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "form": form,
        "att": att,
        "def": def,
        "goals": goals?.toJson(),
      };

  @override
  String toString() {
    return "$form, $att, $def, $goals, ";
  }
}

class Last5Goals {
  Last5Goals({
    required this.goalsFor,
    required this.against,
  });

  final PurpleAgainst? goalsFor;
  static const String goalsForKey = "for";

  final PurpleAgainst? against;
  static const String againstKey = "against";

  Last5Goals copyWith({
    PurpleAgainst? goalsFor,
    PurpleAgainst? against,
  }) {
    return Last5Goals(
      goalsFor: goalsFor ?? this.goalsFor,
      against: against ?? this.against,
    );
  }

  factory Last5Goals.fromJson(Map<String, dynamic> json) {
    return Last5Goals(
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
    required this.total,
    required this.average,
  });

  final int? total;
  static const String totalKey = "total";

  final double? average;
  static const String averageKey = "average";

  PurpleAgainst copyWith({
    int? total,
    double? average,
  }) {
    return PurpleAgainst(
      total: total ?? this.total,
      average: average ?? this.average,
    );
  }

  factory PurpleAgainst.fromJson(Map<String, dynamic> json) {
    return PurpleAgainst(
      total: json["total"],
      average: json["average"],
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total,
        "average": average,
      };

  @override
  String toString() {
    return "$total, $average, ";
  }
}

class H2H {
  H2H({
    required this.fixture,
    required this.league,
    required this.teams,
    required this.goals,
    required this.score,
  });

  final Fixture? fixture;
  static const String fixtureKey = "fixture";

  final H2HLeague? league;
  static const String leagueKey = "league";

  final Teams? teams;
  static const String teamsKey = "teams";

  final FulltimeClass? goals;
  static const String goalsKey = "goals";

  final Score? score;
  static const String scoreKey = "score";

  H2H copyWith({
    Fixture? fixture,
    H2HLeague? league,
    Teams? teams,
    FulltimeClass? goals,
    Score? score,
  }) {
    return H2H(
      fixture: fixture ?? this.fixture,
      league: league ?? this.league,
      teams: teams ?? this.teams,
      goals: goals ?? this.goals,
      score: score ?? this.score,
    );
  }

  factory H2H.fromJson(Map<String, dynamic> json) {
    return H2H(
      fixture:
          json["fixture"] == null ? null : Fixture.fromJson(json["fixture"]),
      league:
          json["league"] == null ? null : H2HLeague.fromJson(json["league"]),
      teams: json["teams"] == null ? null : Teams.fromJson(json["teams"]),
      goals:
          json["goals"] == null ? null : FulltimeClass.fromJson(json["goals"]),
      score: json["score"] == null ? null : Score.fromJson(json["score"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "fixture": fixture?.toJson(),
        "league": league?.toJson(),
        "teams": teams?.toJson(),
        "goals": goals?.toJson(),
        "score": score?.toJson(),
      };

  @override
  String toString() {
    return "$fixture, $league, $teams, $goals, $score, ";
  }
}

class Fixture {
  Fixture({
    required this.id,
    required this.referee,
    required this.timezone,
    required this.date,
    required this.timestamp,
    required this.periods,
    required this.venue,
    required this.status,
  });

  final int? id;
  static const String idKey = "id";

  final String? referee;
  static const String refereeKey = "referee";

  final String? timezone;
  static const String timezoneKey = "timezone";

  final DateTime? date;
  static const String dateKey = "date";

  final int? timestamp;
  static const String timestampKey = "timestamp";

  final Periods? periods;
  static const String periodsKey = "periods";

  final Venue? venue;
  static const String venueKey = "venue";

  final Status? status;
  static const String statusKey = "status";

  Fixture copyWith({
    int? id,
    String? referee,
    String? timezone,
    DateTime? date,
    int? timestamp,
    Periods? periods,
    Venue? venue,
    Status? status,
  }) {
    return Fixture(
      id: id ?? this.id,
      referee: referee ?? this.referee,
      timezone: timezone ?? this.timezone,
      date: date ?? this.date,
      timestamp: timestamp ?? this.timestamp,
      periods: periods ?? this.periods,
      venue: venue ?? this.venue,
      status: status ?? this.status,
    );
  }

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(
      id: json["id"],
      referee: json["referee"],
      timezone: json["timezone"],
      date: DateTime.tryParse(json["date"] ?? ""),
      timestamp: json["timestamp"],
      periods:
          json["periods"] == null ? null : Periods.fromJson(json["periods"]),
      venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
      status: json["status"] == null ? null : Status.fromJson(json["status"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "referee": referee,
        "timezone": timezone,
        "date": date?.toIso8601String(),
        "timestamp": timestamp,
        "periods": periods?.toJson(),
        "venue": venue?.toJson(),
        "status": status?.toJson(),
      };

  @override
  String toString() {
    return "$id, $referee, $timezone, $date, $timestamp, $periods, $venue, $status, ";
  }
}

class Periods {
  Periods({
    required this.first,
    required this.second,
  });

  final int? first;
  static const String firstKey = "first";

  final int? second;
  static const String secondKey = "second";

  Periods copyWith({
    int? first,
    int? second,
  }) {
    return Periods(
      first: first ?? this.first,
      second: second ?? this.second,
    );
  }

  factory Periods.fromJson(Map<String, dynamic> json) {
    return Periods(
      first: json["first"],
      second: json["second"],
    );
  }

  Map<String, dynamic> toJson() => {
        "first": first,
        "second": second,
      };

  @override
  String toString() {
    return "$first, $second, ";
  }
}

class Status {
  Status({
    required this.long,
    required this.short,
    required this.elapsed,
  });

  final String? long;
  static const String longKey = "long";

  final String? short;
  static const String shortKey = "short";

  final int? elapsed;
  static const String elapsedKey = "elapsed";

  Status copyWith({
    String? long,
    String? short,
    int? elapsed,
  }) {
    return Status(
      long: long ?? this.long,
      short: short ?? this.short,
      elapsed: elapsed ?? this.elapsed,
    );
  }

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      long: json["long"],
      short: json["short"],
      elapsed: json["elapsed"],
    );
  }

  Map<String, dynamic> toJson() => {
        "long": long,
        "short": short,
        "elapsed": elapsed,
      };

  @override
  String toString() {
    return "$long, $short, $elapsed, ";
  }
}

class Venue {
  Venue({
    required this.id,
    required this.name,
    required this.city,
  });

  final dynamic id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final dynamic city;
  static const String cityKey = "city";

  Venue copyWith({
    dynamic id,
    String? name,
    dynamic city,
  }) {
    return Venue(
      id: id ?? this.id,
      name: name ?? this.name,
      city: city ?? this.city,
    );
  }

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json["id"],
      name: json["name"],
      city: json["city"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
      };

  @override
  String toString() {
    return "$id, $name, $city, ";
  }
}

class H2HLeague {
  H2HLeague({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.round,
  });

  final int? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final String? country;
  static const String countryKey = "country";

  final String? logo;
  static const String logoKey = "logo";

  final String? flag;
  static const String flagKey = "flag";

  final int? season;
  static const String seasonKey = "season";

  final String? round;
  static const String roundKey = "round";

  H2HLeague copyWith({
    int? id,
    String? name,
    String? country,
    String? logo,
    String? flag,
    int? season,
    String? round,
  }) {
    return H2HLeague(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      logo: logo ?? this.logo,
      flag: flag ?? this.flag,
      season: season ?? this.season,
      round: round ?? this.round,
    );
  }

  factory H2HLeague.fromJson(Map<String, dynamic> json) {
    return H2HLeague(
      id: json["id"],
      name: json["name"],
      country: json["country"],
      logo: json["logo"],
      flag: json["flag"],
      season: json["season"],
      round: json["round"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
        "round": round,
      };

  @override
  String toString() {
    return "$id, $name, $country, $logo, $flag, $season, $round, ";
  }
}

class Score {
  Score({
    required this.halftime,
    required this.fulltime,
    required this.extratime,
    required this.penalty,
  });

  final FulltimeClass? halftime;
  static const String halftimeKey = "halftime";

  final FulltimeClass? fulltime;
  static const String fulltimeKey = "fulltime";

  final Teams? extratime;
  static const String extratimeKey = "extratime";

  final Teams? penalty;
  static const String penaltyKey = "penalty";

  Score copyWith({
    FulltimeClass? halftime,
    FulltimeClass? fulltime,
    Teams? extratime,
    Teams? penalty,
  }) {
    return Score(
      halftime: halftime ?? this.halftime,
      fulltime: fulltime ?? this.fulltime,
      extratime: extratime ?? this.extratime,
      penalty: penalty ?? this.penalty,
    );
  }

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      halftime: json["halftime"] == null
          ? null
          : FulltimeClass.fromJson(json["halftime"]),
      fulltime: json["fulltime"] == null
          ? null
          : FulltimeClass.fromJson(json["fulltime"]),
      extratime:
          json["extratime"] == null ? null : Teams.fromJson(json["extratime"]),
      penalty: json["penalty"] == null ? null : Teams.fromJson(json["penalty"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "halftime": halftime?.toJson(),
        "fulltime": fulltime?.toJson(),
        "extratime": extratime?.toJson(),
        "penalty": penalty?.toJson(),
      };

  @override
  String toString() {
    return "$halftime, $fulltime, $extratime, $penalty, ";
  }
}

class Predictions {
  Predictions({
    required this.winner,
    required this.winOrDraw,
    required this.underOver,
    required this.goals,
    required this.advice,
    required this.percent,
  });

  final Winner? winner;
  static const String winnerKey = "winner";

  final bool? winOrDraw;
  static const String winOrDrawKey = "win_or_draw";

  final String? underOver;
  static const String underOverKey = "under_over";

  final Teams? goals;
  static const String goalsKey = "goals";

  final String? advice;
  static const String adviceKey = "advice";

  final Percent? percent;
  static const String percentKey = "percent";

  Predictions copyWith({
    Winner? winner,
    bool? winOrDraw,
    String? underOver,
    Teams? goals,
    String? advice,
    Percent? percent,
  }) {
    return Predictions(
      winner: winner ?? this.winner,
      winOrDraw: winOrDraw ?? this.winOrDraw,
      underOver: underOver ?? this.underOver,
      goals: goals ?? this.goals,
      advice: advice ?? this.advice,
      percent: percent ?? this.percent,
    );
  }

  factory Predictions.fromJson(Map<String, dynamic> json) {
    return Predictions(
      winner: json["winner"] == null ? null : Winner.fromJson(json["winner"]),
      winOrDraw: json["win_or_draw"],
      underOver: json["under_over"],
      goals: json["goals"] == null ? null : Teams.fromJson(json["goals"]),
      advice: json["advice"],
      percent:
          json["percent"] == null ? null : Percent.fromJson(json["percent"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "winner": winner?.toJson(),
        "win_or_draw": winOrDraw,
        "under_over": underOver,
        "goals": goals?.toJson(),
        "advice": advice,
        "percent": percent?.toJson(),
      };

  @override
  String toString() {
    return "$winner, $winOrDraw, $underOver, $goals, $advice, $percent, ";
  }
}

class Percent {
  Percent({
    required this.home,
    required this.draw,
    required this.away,
  });

  final String? home;
  static const String homeKey = "home";

  final String? draw;
  static const String drawKey = "draw";

  final String? away;
  static const String awayKey = "away";

  Percent copyWith({
    String? home,
    String? draw,
    String? away,
  }) {
    return Percent(
      home: home ?? this.home,
      draw: draw ?? this.draw,
      away: away ?? this.away,
    );
  }

  factory Percent.fromJson(Map<String, dynamic> json) {
    return Percent(
      home: json["home"],
      draw: json["draw"],
      away: json["away"],
    );
  }

  Map<String, dynamic> toJson() => {
        "home": home,
        "draw": draw,
        "away": away,
      };

  @override
  String toString() {
    return "$home, $draw, $away, ";
  }
}

class Winner {
  Winner({
    required this.id,
    required this.name,
    required this.comment,
  });

  final int? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  final String? comment;
  static const String commentKey = "comment";

  Winner copyWith({
    int? id,
    String? name,
    String? comment,
  }) {
    return Winner(
      id: id ?? this.id,
      name: name ?? this.name,
      comment: comment ?? this.comment,
    );
  }

  factory Winner.fromJson(Map<String, dynamic> json) {
    return Winner(
      id: json["id"],
      name: json["name"],
      comment: json["comment"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "comment": comment,
      };

  @override
  String toString() {
    return "$id, $name, $comment, ";
  }
}

/*
{
	"get": "predictions",
	"parameters": {
		"fixture": "198772"
	},
	"errors": [],
	"results": 1,
	"paging": {
		"current": 1,
		"total": 1
	},
	"response": [
		{
			"predictions": {
				"winner": {
					"id": 1189,
					"name": "Deportivo Santani",
					"comment": "Win or draw"
				},
				"win_or_draw": true,
				"under_over": "-3.5",
				"goals": {
					"home": "-2.5",
					"away": "-1.5"
				},
				"advice": "Combo Double chance : Deportivo Santani or draw and -3.5 goals",
				"percent": {
					"home": "45%",
					"draw": "45%",
					"away": "10%"
				}
			},
			"league": {
				"id": 252,
				"name": "Primera Division - Clausura",
				"country": "Paraguay",
				"logo": "https://media.api-sports.io/football/leagues/252.png",
				"flag": "https://media.api-sports.io/flags/py.svg",
				"season": 2019
			},
			"teams": {
				"home": {
					"id": 1189,
					"name": "Deportivo Santani",
					"logo": "https://media.api-sports.io/football/teams/1189.png",
					"last_5": {
						"form": "60%",
						"att": "60%",
						"def": "0%",
						"goals": {
							"for": {
								"total": 3,
								"average": 0.6
							},
							"against": {
								"total": 5,
								"average": 1
							}
						}
					},
					"league": {
						"form": "LDLDLDLWLWWLW",
						"fixtures": {
							"played": {
								"home": 6,
								"away": 7,
								"total": 13
							},
							"wins": {
								"home": 2,
								"away": 2,
								"total": 4
							},
							"draws": {
								"home": 3,
								"away": 0,
								"total": 3
							},
							"loses": {
								"home": 1,
								"away": 5,
								"total": 6
							}
						},
						"goals": {
							"for": {
								"total": {
									"home": 7,
									"away": 4,
									"total": 11
								},
								"average": {
									"home": "1.2",
									"away": "0.6",
									"total": "0.8"
								}
							},
							"against": {
								"total": {
									"home": 6,
									"away": 14,
									"total": 20
								},
								"average": {
									"home": "1.0",
									"away": "2.0",
									"total": "1.5"
								}
							}
						},
						"biggest": {
							"streak": {
								"wins": 2,
								"draws": 1,
								"loses": 1
							},
							"wins": {
								"home": "3-1",
								"away": "0-1"
							},
							"loses": {
								"home": "0-2",
								"away": "4-0"
							},
							"goals": {
								"for": {
									"home": 3,
									"away": 1
								},
								"against": {
									"home": 2,
									"away": 4
								}
							}
						},
						"clean_sheet": {
							"home": 1,
							"away": 2,
							"total": 3
						},
						"failed_to_score": {
							"home": 1,
							"away": 3,
							"total": 4
						}
					}
				},
				"away": {
					"id": 1180,
					"name": "Deportivo Capiata",
					"logo": "https://media.api-sports.io/football/teams/1180.png",
					"last_5": {
						"form": "40%",
						"att": "80%",
						"def": "0%",
						"goals": {
							"for": {
								"total": 4,
								"average": 0.8
							},
							"against": {
								"total": 8,
								"average": 1.6
							}
						}
					},
					"league": {
						"form": "WLWLDLDLLLLWW",
						"fixtures": {
							"played": {
								"home": 7,
								"away": 6,
								"total": 13
							},
							"wins": {
								"home": 3,
								"away": 1,
								"total": 4
							},
							"draws": {
								"home": 0,
								"away": 2,
								"total": 2
							},
							"loses": {
								"home": 4,
								"away": 3,
								"total": 7
							}
						},
						"goals": {
							"for": {
								"total": {
									"home": 8,
									"away": 3,
									"total": 11
								},
								"average": {
									"home": "1.1",
									"away": "0.5",
									"total": "0.8"
								}
							},
							"against": {
								"total": {
									"home": 14,
									"away": 10,
									"total": 24
								},
								"average": {
									"home": "2.0",
									"away": "1.7",
									"total": "1.8"
								}
							}
						},
						"biggest": {
							"streak": {
								"wins": 1,
								"draws": 1,
								"loses": 4
							},
							"wins": {
								"home": "3-1",
								"away": "0-1"
							},
							"loses": {
								"home": "0-6",
								"away": "3-0"
							},
							"goals": {
								"for": {
									"home": 3,
									"away": 1
								},
								"against": {
									"home": 6,
									"away": 3
								}
							}
						},
						"clean_sheet": {
							"home": 1,
							"away": 1,
							"total": 2
						},
						"failed_to_score": {
							"home": 3,
							"away": 3,
							"total": 6
						}
					}
				}
			},
			"comparison": {
				"form": {
					"home": "60%",
					"away": "40%"
				},
				"att": {
					"home": "43%",
					"away": "57%"
				},
				"def": {
					"home": "62%",
					"away": "38%"
				},
				"poisson_distribution": {
					"home": "75%",
					"away": "25%"
				},
				"h2h": {
					"home": "29%",
					"away": "71%"
				},
				"goals": {
					"home": "40%",
					"away": "60%"
				},
				"total": {
					"home": "51.5%",
					"away": "48.5%"
				}
			},
			"h2h": [
				{
					"fixture": {
						"id": 198706,
						"referee": "J. Méndez",
						"timezone": "UTC",
						"date": "2019-07-27T19:30:00+00:00",
						"timestamp": 1564255800,
						"periods": {
							"first": 1564255800,
							"second": 1564259400
						},
						"venue": {
							"id": null,
							"name": "Estadio Lic. Erico Galeano Segovia (Capiatá)",
							"city": null
						},
						"status": {
							"long": "Match Finished",
							"short": "FT",
							"elapsed": 90
						}
					},
					"league": {
						"id": 252,
						"name": "Primera Division - Clausura",
						"country": "Paraguay",
						"logo": "https://media.api-sports.io/football/leagues/252.png",
						"flag": "https://media.api-sports.io/flags/py.svg",
						"season": 2019,
						"round": "Clausura - 3"
					},
					"teams": {
						"home": {
							"id": 1180,
							"name": "Deportivo Capiata",
							"logo": "https://media.api-sports.io/football/teams/1180.png",
							"winner": true
						},
						"away": {
							"id": 1189,
							"name": "Deportivo Santani",
							"logo": "https://media.api-sports.io/football/teams/1189.png",
							"winner": false
						}
					},
					"goals": {
						"home": 3,
						"away": 1
					},
					"score": {
						"halftime": {
							"home": 1,
							"away": 1
						},
						"fulltime": {
							"home": 3,
							"away": 1
						},
						"extratime": {
							"home": null,
							"away": null
						},
						"penalty": {
							"home": null,
							"away": null
						}
					}
				},
				{
					"fixture": {
						"id": 144182,
						"referee": null,
						"timezone": "UTC",
						"date": "2019-03-25T23:15:00+00:00",
						"timestamp": 1553555700,
						"periods": {
							"first": 1553555700,
							"second": 1553559300
						},
						"venue": {
							"id": null,
							"name": "Estadio Lic. Erico Galeano Segovia (Capiatá)",
							"city": null
						},
						"status": {
							"long": "Match Finished",
							"short": "FT",
							"elapsed": 90
						}
					},
					"league": {
						"id": 250,
						"name": "Primera Division - Apertura",
						"country": "Paraguay",
						"logo": "https://media.api-sports.io/football/leagues/250.png",
						"flag": "https://media.api-sports.io/flags/py.svg",
						"season": 2019,
						"round": "Regular Season - 12"
					},
					"teams": {
						"home": {
							"id": 1180,
							"name": "Deportivo Capiata",
							"logo": "https://media.api-sports.io/football/teams/1180.png",
							"winner": true
						},
						"away": {
							"id": 1189,
							"name": "Deportivo Santani",
							"logo": "https://media.api-sports.io/football/teams/1189.png",
							"winner": false
						}
					},
					"goals": {
						"home": 2,
						"away": 1
					},
					"score": {
						"halftime": {
							"home": 2,
							"away": 1
						},
						"fulltime": {
							"home": 2,
							"away": 1
						},
						"extratime": {
							"home": null,
							"away": null
						},
						"penalty": {
							"home": null,
							"away": null
						}
					}
				},
				{
					"fixture": {
						"id": 144113,
						"referee": null,
						"timezone": "UTC",
						"date": "2019-01-23T21:00:00+00:00",
						"timestamp": 1548277200,
						"periods": {
							"first": 1548277200,
							"second": 1548280800
						},
						"venue": {
							"id": null,
							"name": "Estadio Juan José Vázquez (San Estanislao)",
							"city": null
						},
						"status": {
							"long": "Match Finished",
							"short": "FT",
							"elapsed": 90
						}
					},
					"league": {
						"id": 250,
						"name": "Primera Division - Apertura",
						"country": "Paraguay",
						"logo": "https://media.api-sports.io/football/leagues/250.png",
						"flag": "https://media.api-sports.io/flags/py.svg",
						"season": 2019,
						"round": "Regular Season - 1"
					},
					"teams": {
						"home": {
							"id": 1189,
							"name": "Deportivo Santani",
							"logo": "https://media.api-sports.io/football/teams/1189.png",
							"winner": null
						},
						"away": {
							"id": 1180,
							"name": "Deportivo Capiata",
							"logo": "https://media.api-sports.io/football/teams/1180.png",
							"winner": null
						}
					},
					"goals": {
						"home": 0,
						"away": 0
					},
					"score": {
						"halftime": {
							"home": 0,
							"away": 0
						},
						"fulltime": {
							"home": 0,
							"away": 0
						},
						"extratime": {
							"home": null,
							"away": null
						},
						"penalty": {
							"home": null,
							"away": null
						}
					}
				},
				{
					"fixture": {
						"id": 144745,
						"referee": null,
						"timezone": "UTC",
						"date": "2018-11-12T20:45:00+00:00",
						"timestamp": 1542055500,
						"periods": {
							"first": 1542055500,
							"second": 1542059100
						},
						"venue": {
							"id": null,
							"name": "Estadio Lic. Erico Galeano Segovia (Capiatá)",
							"city": null
						},
						"status": {
							"long": "Match Finished",
							"short": "FT",
							"elapsed": 90
						}
					},
					"league": {
						"id": 252,
						"name": "Primera Division - Clausura",
						"country": "Paraguay",
						"logo": "https://media.api-sports.io/football/leagues/252.png",
						"flag": "https://media.api-sports.io/flags/py.svg",
						"season": 2018,
						"round": "Regular Season - 18"
					},
					"teams": {
						"home": {
							"id": 1180,
							"name": "Deportivo Capiata",
							"logo": "https://media.api-sports.io/football/teams/1180.png",
							"winner": false
						},
						"away": {
							"id": 1189,
							"name": "Deportivo Santani",
							"logo": "https://media.api-sports.io/football/teams/1189.png",
							"winner": true
						}
					},
					"goals": {
						"home": 0,
						"away": 2
					},
					"score": {
						"halftime": {
							"home": 0,
							"away": 1
						},
						"fulltime": {
							"home": 0,
							"away": 2
						},
						"extratime": {
							"home": null,
							"away": null
						},
						"penalty": {
							"home": null,
							"away": null
						}
					}
				},
				{
					"fixture": {
						"id": 144679,
						"referee": null,
						"timezone": "UTC",
						"date": "2018-08-26T19:30:00+00:00",
						"timestamp": 1535311800,
						"periods": {
							"first": 1535311800,
							"second": 1535315400
						},
						"venue": {
							"id": null,
							"name": "Estadio Juan José Vázquez (San Estanislao)",
							"city": null
						},
						"status": {
							"long": "Match Finished",
							"short": "FT",
							"elapsed": 90
						}
					},
					"league": {
						"id": 252,
						"name": "Primera Division - Clausura",
						"country": "Paraguay",
						"logo": "https://media.api-sports.io/football/leagues/252.png",
						"flag": "https://media.api-sports.io/flags/py.svg",
						"season": 2018,
						"round": "Regular Season - 7"
					},
					"teams": {
						"home": {
							"id": 1189,
							"name": "Deportivo Santani",
							"logo": "https://media.api-sports.io/football/teams/1189.png",
							"winner": false
						},
						"away": {
							"id": 1180,
							"name": "Deportivo Capiata",
							"logo": "https://media.api-sports.io/football/teams/1180.png",
							"winner": true
						}
					},
					"goals": {
						"home": 0,
						"away": 1
					},
					"score": {
						"halftime": {
							"home": 0,
							"away": 1
						},
						"fulltime": {
							"home": 0,
							"away": 1
						},
						"extratime": {
							"home": null,
							"away": null
						},
						"penalty": {
							"home": null,
							"away": null
						}
					}
				},
				{
					"fixture": {
						"id": 144330,
						"referee": null,
						"timezone": "UTC",
						"date": "2018-05-05T21:30:00+00:00",
						"timestamp": 1525555800,
						"periods": {
							"first": 1525555800,
							"second": 1525559400
						},
						"venue": {
							"id": null,
							"name": "Estadio Juan José Vázquez (San Estanislao)",
							"city": null
						},
						"status": {
							"long": "Match Finished",
							"short": "FT",
							"elapsed": 90
						}
					},
					"league": {
						"id": 250,
						"name": "Primera Division - Apertura",
						"country": "Paraguay",
						"logo": "https://media.api-sports.io/football/leagues/250.png",
						"flag": "https://media.api-sports.io/flags/py.svg",
						"season": 2018,
						"round": "Regular Season - 15"
					},
					"teams": {
						"home": {
							"id": 1189,
							"name": "Deportivo Santani",
							"logo": "https://media.api-sports.io/football/teams/1189.png",
							"winner": null
						},
						"away": {
							"id": 1180,
							"name": "Deportivo Capiata",
							"logo": "https://media.api-sports.io/football/teams/1180.png",
							"winner": null
						}
					},
					"goals": {
						"home": 3,
						"away": 3
					},
					"score": {
						"halftime": {
							"home": 2,
							"away": 1
						},
						"fulltime": {
							"home": 3,
							"away": 3
						},
						"extratime": {
							"home": null,
							"away": null
						},
						"penalty": {
							"home": null,
							"away": null
						}
					}
				},
				{
					"fixture": {
						"id": 144264,
						"referee": null,
						"timezone": "UTC",
						"date": "2018-02-25T20:45:00+00:00",
						"timestamp": 1519591500,
						"periods": {
							"first": 1519591500,
							"second": 1519595100
						},
						"venue": {
							"id": null,
							"name": "Estadio Lic. Erico Galeano Segovia (Capiatá)",
							"city": null
						},
						"status": {
							"long": "Match Finished",
							"short": "FT",
							"elapsed": 90
						}
					},
					"league": {
						"id": 250,
						"name": "Primera Division - Apertura",
						"country": "Paraguay",
						"logo": "https://media.api-sports.io/football/leagues/250.png",
						"flag": "https://media.api-sports.io/flags/py.svg",
						"season": 2018,
						"round": "Regular Season - 4"
					},
					"teams": {
						"home": {
							"id": 1180,
							"name": "Deportivo Capiata",
							"logo": "https://media.api-sports.io/football/teams/1180.png",
							"winner": true
						},
						"away": {
							"id": 1189,
							"name": "Deportivo Santani",
							"logo": "https://media.api-sports.io/football/teams/1189.png",
							"winner": false
						}
					},
					"goals": {
						"home": 2,
						"away": 1
					},
					"score": {
						"halftime": {
							"home": 1,
							"away": 1
						},
						"fulltime": {
							"home": 2,
							"away": 1
						},
						"extratime": {
							"home": null,
							"away": null
						},
						"penalty": {
							"home": null,
							"away": null
						}
					}
				}
			]
		}
	]
}*/
