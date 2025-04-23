import 'package:flutter/material.dart';
import 'package:health_application/model/info_saude.dart';
import 'package:health_application/view/components/my_app_bar.dart';
import 'package:health_application/view/components/card_infos.dart';
import 'package:vibration/vibration.dart';

class RespirationScreen extends StatefulWidget {
  const RespirationScreen({super.key});

  @override
  State<RespirationScreen> createState() => _RespirationScreenState();
}

class _RespirationScreenState extends State<RespirationScreen> {
  InfoSaude? saude;
  String textoRespiracao = "fique parado aí";
  double circleSize = 200;
  int animationSeconds = 2;

  void setTexto(String texto, {double? size, int? seconds}) {
    if (!mounted) return;
    setState(() {
      textoRespiracao = texto;
      if (size != null) circleSize = size;
      if (seconds != null) animationSeconds = seconds;
    });
  }

  void vibrationControl() async {
    if (!mounted) return;
    bool? amplitude = await Vibration.hasAmplitudeControl();

    await vibrar(amplitude!);
    if (!mounted) return;

    await vibrar(amplitude);
    if (!mounted) return;

    await vibrar(amplitude);
    if (!mounted) return;

    setTexto("Acabou!");
  }

  Future<void> vibrar(bool temAmplitude) async {
    await Future.delayed(Duration(seconds: 2));
    if (!mounted) return;
    setTexto("Inspire", size: 300, seconds: 4);
    Vibration.vibrate(duration: 500, amplitude: temAmplitude ? 255 : 0);

    await Future.delayed(Duration(seconds: 4));
    if (!mounted) return;
    setTexto("Segure");
    Vibration.vibrate(duration: 500, amplitude: temAmplitude ? 255 : 0);

    await Future.delayed(Duration(seconds: 7));
    if (!mounted) return;
    setTexto("Expire", size: 150, seconds: 7);
    Vibration.vibrate(duration: 500, amplitude: temAmplitude ? 255 : 0);

    await Future.delayed(Duration(seconds: 8));
  }

  @override
  void initState() {
    super.initState();
    vibrationControl();
  }

  @override
  void dispose() {
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

    return Scaffold(
      appBar: MyAppBar(title: saudeTitle),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
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
          Text(
            textoRespiracao,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(seconds: animationSeconds),
              child: AnimatedContainer(
                duration: Duration(seconds: animationSeconds),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade200,
                ),
                width: circleSize,
                height: circleSize,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
