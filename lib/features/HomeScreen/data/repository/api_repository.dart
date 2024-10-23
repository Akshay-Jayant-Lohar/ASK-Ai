import 'package:http/http.dart' as http;

abstract class ApiRepository {
  Future<void> makeApiCall();
}

class ApiRepositoryImpl implements ApiRepository {
  final String apiUrl =
      'https://ai.mahindra.com/api/v1/department/askportal/feedback';
  final String token =
      "\$2a\$10\$3lt1eS9bvGDs.zyVfeeaFeki7Uv1SLrzBr4AqnuYK8.YpBqQfsn7m";

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
    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode != 200) {
      throw Exception("API call failed with status: ${response.statusCode}");
    }
  }
}
