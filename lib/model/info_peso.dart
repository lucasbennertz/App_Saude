class InfoPeso {
  late int pesoID;
  double peso;
  double altura;
  DateTime data = DateTime.now();
  late double IMC = 0;

  InfoPeso(this.peso, this.altura);

  double calcularIMC() {
    IMC = peso / (altura * altura);
    return IMC;
  }

  Map<String, dynamic> toMap(){
    return{
      'peso_id' : pesoID,
      'peso' : peso,
      'altura' : altura,
      'data' : data.toIso8601String(),
      'IMC' : IMC
    };
  }
}
