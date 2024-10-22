class ModelClass {
  final List<dynamic> historyTitle;
  final int statusCode;

  ModelClass({ required this.historyTitle,required this.statusCode,});

  // factory ModelClass.fromJson(Map<String, dynamic> json) {
   factory ModelClass.fromJson(List<dynamic> json) {
    // if (json.length != 2) {
    //   throw Exception('Invalid JSON structure for ModelClass');
    // }
     final historyTitle = List<dynamic>.from(json[0]['History_title']);
    final statusCode = json[1] as int;
    return ModelClass(
      // historyTitle: List<String>.from(json['History_title']),
      historyTitle: historyTitle,
      statusCode: statusCode
    );
  }
}
