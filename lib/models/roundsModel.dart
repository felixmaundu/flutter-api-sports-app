// ignore_for_file: file_names

class RoundsModel {
  String? get;
  Parameters? parameters;

  int? results;
  Paging? paging;
  List<String>? response;

  RoundsModel(
      {this.get, this.parameters, this.results, this.paging, this.response});

  RoundsModel.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    parameters = json['parameters'] != null
        ? Parameters.fromJson(json['parameters'])
        : null;

    results = json['results'];
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
    response = json['response'].cast<String>();
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
    data['response'] = response;
    return data;
  }
}

class Parameters {
  String? league;
  String? season;

  Parameters({this.league, this.season});

  Parameters.fromJson(Map<String, dynamic> json) {
    league = json['league'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['league'] = league;
    data['season'] = season;
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
