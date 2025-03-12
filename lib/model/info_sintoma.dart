class InfoSintoma{
  String sintoma;
  int? sintomaId;
  DateTime data = DateTime.now();
  InfoSintoma(this.sintoma);

  Map<String, dynamic> toMap(){
    return {
      "sintoma" : sintoma,
      "dataSintoma" : data.toIso8601String()
    };
  }

}