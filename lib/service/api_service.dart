import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon_detailmodel.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';
  static const String id = 'id';
  static const String episodes = 'episodes';

  static Future<List<WebtoonModel>> getTodayToons() async {
    List<WebtoonModel> webtooninstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtooninstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtooninstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailmodel> getDetailinfo(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoonInfo = jsonDecode(response.body);
      return WebtoonDetailmodel.fromJson(webtoonInfo);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodemodel>> getEpisode(String id) async {
    List<WebtoonEpisodemodel> episodesInstance = [];
    final url = Uri.parse('$baseUrl/$id/$episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodeInfo = jsonDecode(response.body);
      for (var episode in episodeInfo) {
        episodesInstance.add(WebtoonEpisodemodel.fromJson(episode));
      }
      return episodesInstance;
    }
    throw Error();
  }
}
