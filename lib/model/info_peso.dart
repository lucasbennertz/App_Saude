class InfoPeso {
  late int pesoID;
  double peso;
  double altura;
  DateTime data = DateTime.now();
  late double IMC;

  InfoPeso(this.peso, this.altura);

  void calcularIMC() {
    this.IMC = this.peso / (this.altura * this.altura);
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
