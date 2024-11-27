import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webtoon/models/webtoon_detailmodel.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/service/api_service.dart';
import 'package:webtoon/widget/webtoon_widget.dart';

class Episodetab extends StatelessWidget {
  final String webtoonId;
  final dynamic episode;

  const Episodetab({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  onButtontap() async {
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}&week=wed");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtontap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black,
                offset: Offset(3, 3),
              ),
            ],
            color: Colors.green.shade400.withOpacity(0.9),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Text(episode.title),
              const Icon(Icons.chevron_right_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
