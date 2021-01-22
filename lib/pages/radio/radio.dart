import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_music/models/radio.dart';
import 'package:flutter_music/pages/utils/ai_util.dart';
import 'package:velocity_x/velocity_x.dart';

class RadioFm extends StatefulWidget {
  @override
  _RadioFmState createState() => _RadioFmState();
}

class _RadioFmState extends State<RadioFm> {
  List<MyRadio> radios;
  MyRadio _selectedRadio;
  Color _selectedColor;
  bool _isPlaying = false;

  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    fetchRadios();

    _audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == AudioPlayerState.PLAYING) {
        _isPlaying = true;
      } else {
        _isPlaying = false;
      }
      setState(() {});
    });
  }

  fetchRadios() async {
    final radioJson = await rootBundle.loadString('assets/radio.json');
    radios = MyRadioList.fromJson(radioJson).radios;
    setState(() {});
  }

  _playMusic(String url) {
    _audioPlayer.play(url);
    _selectedRadio = radios.firstWhere((element) => element.url == url);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Stack(
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(LinearGradient(
                  colors: [AIColors.primaryColor1, AIColors.primaryColor2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight))
              .make(),
          AppBar(
            title: 'AI Radio'.text.xl4.bold.white.make().shimmer(
                primaryColor: Vx.purple300, secondaryColor: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ).h(100.0).p16(),
          VxSwiper.builder(
              itemCount: radios.length,
              aspectRatio: 1.0,
              enlargeCenterPage: true,
              itemBuilder: (context, index) {
                final rad = radios[index];
                return VxBox(
                        child: ZStack(
                  [
                    Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: VxBox(
                                child: rad.category.text.uppercase.white
                                    .make()
                                    .px16())
                            .height(40.0)
                            .black
                            .alignCenter
                            .withRounded(value: 10.0)
                            .make()),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: VStack(
                        [
                          rad.name.text.xl3.white.bold.make(),
                          5.heightBox,
                          rad.tagline.text.sm.white.semiBold.make()
                        ],
                        crossAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: [
                          Icon(CupertinoIcons.play_circle, color: Colors.white),
                          10.heightBox,
                          'Double tab to play'.text.gray300.make()
                        ].vStack())
                  ],
                ))
                    .clip(Clip.antiAlias)
                    .bgImage(DecorationImage(
                        image: NetworkImage(rad.image),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken)))
                    .border(color: Colors.black, width: 5.0)
                    .withRounded(value: 60.0)
                    .make()
                    .onInkDoubleTap(() {
                  _playMusic(rad.url);
                }).p16();
              }).centered(),
          Align(
                  alignment: Alignment.bottomCenter,
                  child: [
                    if (_isPlaying)
                      'Playing Now - ${_selectedRadio.name} FM'
                          .text
                          .makeCentered(),
                    Icon(
                            _isPlaying
                                ? CupertinoIcons.stop_circle
                                : CupertinoIcons.play_circle,
                            color: Colors.white,
                            size: 50.0)
                        .onInkTap(() {
                      if (_isPlaying) {
                        _audioPlayer.stop();
                      } else {
                        _playMusic(_selectedRadio.url);
                      }
                    })
                  ].vStack())
              .pOnly(bottom: context.percentHeight * 12)
        ],
        fit: StackFit.expand,
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
}
