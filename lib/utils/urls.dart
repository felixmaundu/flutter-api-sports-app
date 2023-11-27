
// // ###############################################################################
// // fetch("https://v3.football.api-sports.io/leagues/seasons", {
// // 	"method": "GET",
// // 	"headers": {
// // 		"x-rapidapi-host": "v3.football.api-sports.io",
// // 		"x-rapidapi-key": "XxXxXxXxXxXxXxXxXxXxXxXx"
// // 	}
// // })
// // .then(response => {
// // 	console.log(response);
// // })
// // .catch(err => {
// // 	console.log(err);
// // });

// // VIDEO API ACCESS TOKEN
// // NDg3MjdfMTY5NTMzNDY0OV8xYTkxMTZhMTZjNjQ2OTU5M2VjYjkxYTkyZTgzMTRhZWZiODMxNDc3
// // EMBED TOKEN
// // NDg3MjdfMTY5NTMzNDY0OV8yYThhZDE0MWMxNzFkNDU3MDZhOWE5NTI2MjZkOTRlYzkxMWNlMmVh


// // https://www.scorebat.com/video-api/v3/team/real-madrid/?token=[YOUR_API_TOKEN]
// // https://www.scorebat.com/video-api/v3/competition/england-premier-league/?token=[YOUR_API_TOKEN]
// // https://www.scorebat.com/video-api/v3/feed/?token=[YOUR_API_TOKEN]
//############################################################################################
// odds url
// // Get all available odds
// get("https://v3.football.api-sports.io/odds/live");

// // Get all available odds from one {fixture}
// get("https://v3.football.api-sports.io/odds/live?fixture=164327");

// // Get all available odds from one {league}
// get("https://v3.football.api-sports.io/odds/live?league=39");

// // It’s possible to make requests by mixing the available parameters
// get("https://v3.football.api-sports.io/odds/live?bet=4&league=39");
// get("https://v3.football.api-sports.io/odds/live?bet=4&fixture=164327");

// pre match odds url
// // Get all available odds from one {fixture}
// get("https://v3.football.api-sports.io/odds?fixture=164327");

// // Get all available odds from one {league} & {season}
// get("https://v3.football.api-sports.io/odds?league=39&season=2019");

// // Get all available odds from one {date}
// get("https://v3.football.api-sports.io/odds?date=2020-05-15");

// // It’s possible to make requests by mixing the available parameters
// get("https://v3.football.api-sports.io/odds?bookmaker=1&bet=4&league=39&season=2019");
// get("https://v3.football.api-sports.io/odds?bet=4&fixture=164327");
// get("https://v3.football.api-sports.io/odds?bookmaker=1&league=39&season=2019");
// get("https://v3.football.api-sports.io/odds?date=2020-05-15&page=2&bet=4");

// //##############################################################################
// // Get all from one {player}
// get("https://v3.football.api-sports.io/sidelined?player=276");

// // Get all from one {coach}
// get("https://v3.football.api-sports.io/sidelined?coach=2");
// ##############################################################3
// // Get all players statistics from one player {id} & {season}
// get("https://v3.football.api-sports.io/players?id=19088&season=2018");

// // Get all players statistics from one {team} & {season}
// get("https://v3.football.api-sports.io/players?season=2018&team=33");
// get("https://v3.football.api-sports.io/players?season=2018&team=33&page=2");

// // Get all players statistics from one {league} & {season}
// get("https://v3.football.api-sports.io/players?season=2018&league=61");
// get("https://v3.football.api-sports.io/players?season=2018&league=61&page=4");

// // Get all players statistics from one {league}, {team} & {season}
// get("https://v3.football.api-sports.io/players?season=2018&league=61&team=33");
// get("https://v3.football.api-sports.io/players?season=2018&league=61&team=33&page=5");

// // Allows you to search for a player in relation to a player {name}
// get("https://v3.football.api-sports.io/players?team=85&search=cavani");
// get("https://v3.football.api-sports.io/players?league=61&search=cavani");
// get("https://v3.football.api-sports.io/players?team=85&search=cavani&season=2018");
// ######################################################################################3
// $client = new http\Client;
// $request = new http\Client\Request;

// $request->setRequestUrl('https://v3.football.api-sports.io/players/topscorers');
// $request->setRequestMethod('GET');
// $request->setQuery(new http\QueryString(array(
// 	'season' => '2018',
// 	'league' => '61'
// )));

// $request->setHeaders(array(
// 	'x-rapidapi-host' => 'v3.football.api-sports.io',
// 	'x-rapidapi-key' => 'XxXxXxXxXxXxXxXxXxXxXxXx'
// ));

// $client->enqueue($request)->send();
// $response = $client->getResponse();

// echo $response->getBody();
// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$444
// // Get all available injuries from one {league} & {season}
// get("https://v3.football.api-sports.io/injuries?league=2&season=2020");

// // Get all available injuries from one {fixture}
// get("https://v3.football.api-sports.io/injuries?fixture=686314");

// // Get all available injuries from one {team} & {season}
// get("https://v3.football.api-sports.io/injuries?team=85&season=2020");

// // Get all available injuries from one {player} & {season}
// get("https://v3.football.api-sports.io/injuries?player=865&season=2020");

// // Get all available injuries from one {date}
// get("https://v3.football.api-sports.io/injuries?date=2021-04-07");

// // It’s possible to make requests by mixing the available parameters
// get("https://v3.football.api-sports.io/injuries?league=2&season=2020&team=85");
// get("https://v3.football.api-sports.io/injuries?league=2&season=2020&player=865");
// get("https://v3.football.api-sports.io/injuries?date=2021-04-07&timezone=Europe/London&team=85");
// get("https://v3.football.api-sports.io/injuries?date=2021-04-07&league=61");
// ####################################################################################3
// // Get one team from one team {id}
// get("https://v3.football.api-sports.io/teams?id=33");

// // Get one team from one team {name}
// get("https://v3.football.api-sports.io/teams?name=manchester united");

// // Get all teams from one {league} & {season}
// get("https://v3.football.api-sports.io/teams?league=39&season=2019");

// // Get teams from one team {country}
// get("https://v3.football.api-sports.io/teams?country=england");

// // Get teams from one team {code}
// get("https://v3.football.api-sports.io/teams?code=FRA");

// // Get teams from one venue {id}
// get("https://v3.football.api-sports.io/teams?venue=789");

// // Allows you to search for a team in relation to a team {name} or {country}
// get("https://v3.football.api-sports.io/teams?search=manches");
// get("https://v3.football.api-sports.io/teams?search=England");
// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
// // Get all statistics for a {team} in a {league} & {season}
// get("https://v3.football.api-sports.io/teams/statistics?league=39&team=33&season=2019");

// //Get all statistics for a {team} in a {league} & {season} with a end {date}
// get("https://v3.football.api-sports.io/teams/statistics?league=39&team=33&season=2019&date=2019-10-08");
// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
// // Get all seasons available for a team from one team {id}
// get("https://v3.football.api-sports.io/teams/seasons?team=33");
// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$4
// // Get all countries available for the teams endpoints
// get("https://v3.football.api-sports.io/teams/countries");
// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$4444

// right click source, tick the check mark, ctrl +f then search ?channel_id
// https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=API_KEY
// api key = 17b28eaed4294ec7814df3217d156f76   sky sports channel id = UCcw05gGzjLIs5dnxGkQHMvw
// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
