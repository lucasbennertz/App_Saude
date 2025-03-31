import 'package:flutter/material.dart';
import 'package:health_application/model/info_saude.dart';
import 'package:health_application/view/components/my_app_bar.dart';
import 'package:health_application/view/components/card_infos.dart';
import 'package:just_audio/just_audio.dart';

class InfosScreens extends StatefulWidget {
  const InfosScreens({super.key});

  @override
  State<InfosScreens> createState() => _InfosScreensState();
}

class _InfosScreensState extends State<InfosScreens> {
  late AudioPlayer _player;
  InfoSaude? saude;


  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

  }

  void _initializeAudio() async {
    if(saude != null && saude!.nomeInfoSaude.toLowerCase() == "parada cardíaca"){
      try {
        await _player.setAsset("assets/audios/musica-parada-cardiaca.mp3");
        _player.setLoopMode(LoopMode.one);
        _player.setVolume(1);
        _player.play();
      } catch (e) {
        debugPrint("Error loading audio: $e");
      }
    }

  }

  @override
  void dispose() {
    _player.dispose(); // Properly releasing resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is! InfoSaude) {
      return Scaffold(
        appBar: MyAppBar(title: "Informação"),
        body: const Center(child: Text("Nenhuma informação disponível")),
      );
    }

    saude = args;
    String saudeTitle = saude!.nomeInfoSaude;
    List<String> saudePassos = saude!.passos;
    _initializeAudio();
    return Scaffold(
      appBar: MyAppBar(title: saudeTitle),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: saudePassos.length,
              itemBuilder: (context, index) {
                return CardInfos(
                  cardNumber: index,
                  descricao: saudePassos[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
