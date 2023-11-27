// ignore_for_file: file_names

class MatchVideoModel {
  List<ResponseMV>? response;

  MatchVideoModel({this.response});

  MatchVideoModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <ResponseMV>[];
      json['response'].forEach((v) {
        response!.add(ResponseMV.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResponseMV {
  String? title;
  String? competition;
  String? matchviewUrl;
  String? competitionUrl;
  String? thumbnail;
  String? date;
  List<Videos>? videos;

  ResponseMV(
      {this.title,
      this.competition,
      this.matchviewUrl,
      this.competitionUrl,
      this.thumbnail,
      this.date,
      this.videos});

  ResponseMV.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    competition = json['competition'];
    matchviewUrl = json['matchviewUrl'];
    competitionUrl = json['competitionUrl'];
    thumbnail = json['thumbnail'];
    date = json['date'];
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['competition'] = competition;
    data['matchviewUrl'] = matchviewUrl;
    data['competitionUrl'] = competitionUrl;
    data['thumbnail'] = thumbnail;
    data['date'] = date;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Videos {
  String? title;
  String? embed;

  Videos({this.title, this.embed});

  Videos.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    embed = json['embed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['embed'] = embed;
    return data;
  }
}
