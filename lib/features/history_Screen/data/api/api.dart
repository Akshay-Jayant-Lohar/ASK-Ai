import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> postHistoryTitle() async {
  
  final tokenResponse = await http.post(
    Uri.parse('https://ai.mahindra.com/api/v1/department/askportal/token'),
    headers: {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'department_name': 'askportal',
      'description': 'token for askportal',
      'expires_in': 36000,
    }),
  );

  if (tokenResponse.statusCode == 200) {
    final tokenData = jsonDecode(tokenResponse.body);
    final accessToken = tokenData['token'];
    final historyTitles = {
      'History_title': [
        'SARPANCH-ENGINE OVERHEATING in tractor',
        'Bhoomiputra-engine overheating',
        'Bhoomiputra-Excessive Blow By'
      ]
    };

    final historyResponse = await http.post(
      Uri.parse(
          'https://ai.mahindra.com/api/v1/department/askportal/blob/shirke.mithilesh/histlist'),
      headers: {
        'accept': 'application/json',
        'Access-Token': accessToken,
      },
      body: jsonEncode(historyTitles),
    );

    if (historyResponse.statusCode == 200) {
      print('History posted successfully');
    } else {
      print('Failed to post history: ${historyResponse.statusCode}');
    }
  } else {
    print('Failed to fetch token: ${tokenResponse.statusCode}');
  }
}

