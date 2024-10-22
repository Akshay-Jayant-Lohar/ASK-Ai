class ModelClass {
  List<String> historyTitle;

  ModelClass({
    required this.historyTitle,
  });
  factory ModelClass.fromJson(Map<String, dynamic> json) {
    return ModelClass(
      historyTitle: List<String>.from(json['History_title']),
    );
  }
}
