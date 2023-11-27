// ignore_for_file: file_names

class SportsNewModel {
  SportsNewModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String? status;
  final int? totalResults;
  final List<Article> articles;

  SportsNewModel copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) {
    return SportsNewModel(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  factory SportsNewModel.fromJson(Map<String, dynamic> json) {
    return SportsNewModel(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: json["articles"] == null
          ? []
          : List<Article>.from(
              json["articles"]!.map((x) => Article.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$status, $totalResults, $articles, ";
  }
}

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  Article copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) {
    return Article(
      source: source ?? this.source,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: json["source"] == null ? null : Source.fromJson(json["source"]),
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: DateTime.tryParse(json["publishedAt"] ?? ""),
      content: json["content"],
    );
  }

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };

  @override
  String toString() {
    return "$source, $author, $title, $description, $url, $urlToImage, $publishedAt, $content, ";
  }
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  Source copyWith({
    String? id,
    String? name,
  }) {
    return Source(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  String toString() {
    return "$id, $name, ";
  }
}

/*
{
	"status": "ok",
	"totalResults": 10,
	"articles": [
		{
			"source": {
				"id": "bbc-news",
				"name": "BBC News"
			},
			"author": "BBC News",
			"title": "Israel Gaza live news: Gaza being 'pushed into abyss', UN says, as Israel prepares ground offensive",
			"description": "A mass evacuation from north to south Gaza is taking place. Israel says it is planning to attack by air, land and sea.",
			"url": "http://www.bbc.co.uk/news/live/world-middle-east-67108364",
			"urlToImage": "https://m.files.bbci.co.uk/modules/bbc-morph-news-waf-page-meta/5.3.0/bbc_news_logo.png",
			"publishedAt": "2023-10-15T16:07:19.6603503Z",
			"content": "West Bank mourners carry the body of 16-year-old Mohamed Odwan who died during clashes with Israeli forces, Palestinian authorities saidImage caption: West Bank mourners carry the body of 16-year-old… [+1253 chars]"
		},
		{
			"source": {
				"id": "bbc-news",
				"name": "BBC News"
			},
			"author": "BBC News",
			"title": "Ecuador chooses president during wave of violence",
			"description": "Ecuadoreans are casting their votes in the presidential run-off overshadowed by a violent crime wave.",
			"url": "http://www.bbc.co.uk/news/world-latin-america-67088284",
			"urlToImage": "https://ichef.bbci.co.uk/news/1024/branded_news/16F2F/production/_131399939_equador_2panel_getty.jpg",
			"publishedAt": "2023-10-15T13:37:21.7077038Z",
			"content": "Ecuadoreans are voting in the run-off of a presidential election that has been overshadowed by a crime wave which has turned the country into one of the most violent in the region. \r\nThe first round … [+3269 chars]"
		},
		{
			"source": {
				"id": "bbc-news",
				"name": "BBC News"
			},
			"author": "BBC Sport",
			"title": "Qatar's Sheikh Jassim withdraws from bid to buy Man Utd",
			"description": "Qatari banker Sheikh Jassim bin Hamad Al Thani withdraws from the process to buy Manchester United.",
			"url": "http://www.bbc.co.uk/sport/football/67107688",
			"urlToImage": "https://ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/137EE/production/_127745897_gettyimages-1433808804.jpg",
			"publishedAt": "2023-10-15T10:22:19.3098562Z",
			"content": "Fan protests have continued at Old Trafford this season against the Glazer family\r\nQatari banker Sheikh Jassim bin Hamad Al Thani has withdrawn from the process to buy Manchester United, BBC Sport ha… [+4491 chars]"
		},
		{
			"source": {
				"id": "bbc-news",
				"name": "BBC News"
			},
			"author": "BBC News",
			"title": "US actress Piper Laurie, star of The Hustler and Carrie, dies at 91",
			"description": "The three-time Oscar nominee was also known for her campaigning for the civil rights movement.",
			"url": "http://www.bbc.co.uk/news/world-us-canada-67114331",
			"urlToImage": "https://ichef.bbci.co.uk/news/1024/branded_news/8127/production/_131436033_gettyimages-614814372.jpg",
			"publishedAt": "2023-10-15T06:52:17.2700714Z",
			"content": "US actress Piper Laurie - best known for her roles in The Hustler and Carrie films - has died aged 91, her manager has said.\r\nMarion Rosenberg told the Associated Press that the three-time Oscar nomi… [+1083 chars]"
		},
		{
			"source": {
				"id": "bbc-news",
				"name": "BBC News"
			},
			"author": "BBC Sport",
			"title": "All Blacks beat Ireland to set up Pumas semi-final",
			"description": "New Zealand end Ireland's World Cup dream and set up a semi-final against Argentina with a 28-24 win at Stade de France.",
			"url": "http://www.bbc.co.uk/sport/rugby-union/67105292",
			"urlToImage": "https://ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/112D1/production/_131435307_gettyimages-1735788583.jpg",
			"publishedAt": "2023-10-15T06:37:23.8952953Z",
			"content": "<table><tr><th>Rugby World Cup quarter-final: Ireland v New Zealand</th></tr>\r\n<tr><td>Ireland: (17) 24</td></tr><tr><td>Tries: Aki, Gibson-Park, penalty try Cons: Sexton 2 Pen: Sexton</td></tr><tr><… [+5832 chars]"
		},
		{
			"source": {
				"id": "bbc-news",
				"name": "BBC News"
			},
			"author": "BBC Sport",
			"title": "Fury outpoints KSI in unlicensed grudge match",
			"description": "Tommy Fury beats fellow social media star KSI on points in their unlicensed boxing fight in front of a capacity 20,000 crowd at Manchester's AO Arena.",
			"url": "http://www.bbc.co.uk/sport/boxing/67113845",
			"urlToImage": "https://ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/1345F/production/_131434987_a4ec86534bf606e9a0f1dae6d0a366aaecf12368.jpg",
			"publishedAt": "2023-10-15T06:37:22.8955436Z",
			"content": "KSI didn't come to fight - Tommy Fury\r\nTommy Fury claimed bragging rights over fellow social media star KSI with a win on points in their unlicensed boxing fight in front of a capacity crowd of 20,00… [+6212 chars]"
		},
		{
			"source": {
				"id": "bbc-news",
				"name": "BBC News"
			},
			"author": "BBC News",
			"title": "Madonna's Celebration Tour reviewed: The Queen of pop brings out her crown jewels",
			"description": "The star is joined on stage by four of her children, who she thanks for saving her life this summer.",
			"url": "http://www.bbc.co.uk/news/entertainment-arts-67098882",
			"urlToImage": "https://ichef.bbci.co.uk/news/1024/branded_news/2A65/production/_131435801_1736168717.jpg",
			"publishedAt": "2023-10-15T06:37:19.6451186Z",
			"content": "She's known as the Queen of Pop and, on the opening night of her Celebration World Tour, Madonna brought out her crown jewels.\r\nThe star played more than 40 hits, including era-defining anthems like … [+10535 chars]"
		},
		{
			"source": {
				"id": "bbc-news",
				"name": "BBC News"
			},
			"author": "BBC News",
			"title": "Watch: Skies darken during annular solar eclipse",
			"description": "Stargazers witness a spectacular celestial event in parts of the US, Central and South America.",
			"url": "http://www.bbc.co.uk/news/science-environment-67113146",
			"urlToImage": "https://ichef.bbci.co.uk/news/1024/branded_news/12FAF/production/_131434777_p0glkvl5.jpg",
			"publishedAt": "2023-10-15T06:37:16.5990011Z",
			"content": "Stargazers and astronomers witnessed an annular solar eclipse in parts of the US, Central and South America.\r\nThe celestial event occurs when the Moon passes between the Earth and the Sun, blocking o… [+255 chars]"
		},
		{
			"source": {
				"id": "bbc-news",
				"name": "BBC News"
			},
			"author": "BBC News",
			"title": "New earthquake hits western Afghanistan",
			"description": "US seismologists say the magnitude 6.3 quake was in the Herat province already devastated by recent tremors.",
			"url": "http://www.bbc.co.uk/news/world-asia-67114332",
			"urlToImage": "https://ichef.bbci.co.uk/news/1024/branded_news/83B3/production/_115651733_breaking-large-promo-nc.png",
			"publishedAt": "2023-10-15T04:37:14.3179144Z",
			"content": "The 2,500-year-old sport that still flourishes in India. VideoThe 2,500-year-old sport that still flourishes in India"
		},
		{
			"source": {
				"id": "bbc-news",
				"name": "BBC News"
			},
			"author": "BBC News",
			"title": "New Zealand election: National party's Chris Luxon wins",
			"description": "New Zealand election won by centre-right opposition as Labour PM Chris Hipkins concedes",
			"url": "http://www.bbc.co.uk/news/world-asia-67110387",
			"urlToImage": "https://ichef.bbci.co.uk/news/1024/branded_news/83B3/production/_115651733_breaking-large-promo-nc.png",
			"publishedAt": "2023-10-14T10:07:19.4978628Z",
			"content": "Centre-right opposition leader Christopher Luxon has won the 2023 New Zealand election. \r\nLabour prime minister Chris Hipkins phoned the National party leader to concede defeat on Saturday night.\r\nHe… [+639 chars]"
		}
	]
}*/
