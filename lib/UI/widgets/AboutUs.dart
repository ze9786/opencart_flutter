import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key key, @required this.lang});
  final String lang;
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String videoID;
  YoutubePlayerController _controller;
  @override
  void initState() {
    videoID = YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=d6oqXO0xBPE');
    _controller = YoutubePlayerController(
      initialVideoId: videoID,
      flags: YoutubePlayerFlags(
        hideControls: false,
        controlsVisibleAtStart: true,
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        widget.lang == 'eng'
            ? Column(
                children: [
                  Text(
                    'About Us',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                      'Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet, consectetur, adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?'),
                ],
              )
            : widget.lang == 'simp'
                ? Column(
                    children: [
                      Text(
                        '关于我们',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                          '这是一个关于烟囱的故事，也是关于地球的故事透过故事，倾听并发掘内心最真实的需要从前从前，有一位有钱人住在大大的房子里，他有好多的烟囱，可以生产东西、让生活变得很方便。但是，烟囱不断排出的黑烟实在太臭...')
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        '關於我們',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                          '這是一個關於煙囪的故事，也是關於地球的故事透過故事，傾聽並發掘內心最真實的需要從前從前，有一位有錢人住在大大的房子裡，他有好多的煙囪，可以生產東西、讓生活變得很方便。但是，煙囪不斷排出的黑煙實在太臭...')
                    ],
                  ),
        SizedBox(
          height: 5,
        ),
        Center(child: Image.asset('images/poster.jpeg')),
        SizedBox(
          height: 5,
        ),
        Container(
          child: YoutubePlayer(
            controller: _controller,
          ),
        ),
      ],
    );
  }
}
