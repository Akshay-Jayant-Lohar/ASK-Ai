class HistoryTitleModel {
  final List<String> historyTitles;

  HistoryTitleModel({required this.historyTitles});

  factory HistoryTitleModel.fromJson(Map<String, dynamic> json) {
    // Check if 'History_title' is present and is a list
    if (json['History_title'] is List) {
      return HistoryTitleModel(
        historyTitles: List<String>.from(json['History_title']),
      );
    } else {
      // If the expected data is not found, return an empty list
      return HistoryTitleModel(historyTitles: []);
    }
  }
}
