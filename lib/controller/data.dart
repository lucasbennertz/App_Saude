import '../model/info_saude.dart';

class Data {
  List<InfoSaude> informacoes = [
    InfoSaude(1, "Ataque de Ansiedade", "Faça exercicios de respiração", [
      "Mantenha a calma",
      "Siga as vibrações do celular"
    ]),
    InfoSaude(2, "Engasgo", "Manobra de Heimlich", [
      "Mantenha a calma",
      "Fique atrás da pessoa",
      "posicione as pernas no meio das pernas da vítima",
      "Coloque os braços ao redor da pessoa",
      "Feche uma das mãos e coloque o polegar acima do umbigo da pessoa e abaixo do torax",
      "Segure a sua mão com a outra mão",
      "Puxe a pessoa para perto de você fazendo movimento de 'J'"
    ]),
    InfoSaude(3, "Queimadura", "passo-a-passo para ajudar", [
      "Mantenha a calma",
      "Coloque a queimadura em contato com água corrente",
      "Entre em contato com o posto de saúde mais próximo"
    ]),
    InfoSaude(4, "Peso", "Acompanhar a perda de peso", []),
    InfoSaude(5, "Parada Cardíaca", "Ritmo manobra de batida", [
      "Mantenha a calma",
      "Deite a pessoa no chão",
      "Posicione-se ao lado da pessoa",
      "Ponha a mão logo abaixo do fim da caixa toráxica da pessoa",
      "Faça impulsões para baixo no ritmo da música"
    ]),
    InfoSaude(6, "Diário de Sintomas", "Ponha registros atualizados", [])
  ];
}