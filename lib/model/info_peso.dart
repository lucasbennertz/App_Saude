class InfoPeso {
  int? pesoID;
  double peso;
  double altura;
  DateTime data = DateTime.now();
  late double imc = 0;

  InfoPeso(this.peso, this.altura);

  double calcularimc() {
    imc = peso / (altura * altura);
    return imc;
  }

  Map<String, dynamic> toMap(){
    return{
      'peso' : peso,
      'altura' : altura,
      'data' : data.toIso8601String(),
      'imc' : imc
    };
  }
}
