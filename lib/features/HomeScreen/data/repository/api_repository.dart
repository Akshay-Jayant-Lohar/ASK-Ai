import 'dart:developer';

import 'package:http/http.dart' as http;

abstract class ApiRepository {
  Future<void> makeApiCall();
}

class ApiRepositoryImpl implements ApiRepository {
  final String apiUrl =
      'https://ai.mahindra.com/api/v1/department/askportal/feedback';
  final String token =
      "\$2a\$10\$kz6CKb6Mg./BGXNmI8FnGu21GLdHDDx8xOnTUB9PD7REJPvA0ZNc2";

  @override
  Future<void> makeApiCall() async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Access-Token': token,
        'Content-Type': 'application/json',
      },
      body: '{"done": true}',
    );
    log("Response Status Code: ${response.statusCode}");
    log("Response Body: ${response.body}");
    if (response.statusCode != 200) {
      throw Exception("API call failed with status: ${response.statusCode}");
    }
  }
}
