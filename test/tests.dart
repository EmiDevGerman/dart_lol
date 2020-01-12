import 'package:dart_lol/dart_lol.dart';

var apiToken = 'RGAPI-8fff7040-aebd-4540-b123-5f29b4646f65';

var summID = 'Gg7L1t2E8chqirSQGhg_M1PAtl52v-KAONcZUFeoBJAIhx1j';
var summName = 'Rengar Says MIAW';
var emre = 'Ÿurt';

void main() {
  final league = League(apiToken: apiToken);

  league.getSummonerInfo(summonerName: 'Ÿurt').then((summonerInfo) {
    print(summonerInfo.summonerName);
    // Outputs Ÿurt
    print(summonerInfo.level);
    // Outputs current summoner level
    // etc.
  });

  league.getSummonerInfo(summonerName: emre).then((id) {
    final game = league.getGameHistory(accountID: id.accID);
    game.then((gameStat) {
      gameStat[2].stats().then((ok) {
        print(ok.participants[1].summonerName);
        league
            .getRankInfos(summonerID: ok.participants[6].summonerID)
            .then((rankInfo) {
          print(rankInfo.leaguePoints);
          print(rankInfo.tier);
        });
      });
    });
  });

  //final summonerInfo = league.getSummonerInfo(summonerName: summName);
}
