import 'dart:convert';
import 'dart:developer';
import 'package:ask/features/history_Screen/data/model/model_class.dart';
import 'package:http/http.dart' as http;

// // class ApiService {
// //   final String url =
// //       'https://ai.mahindra.com/api/v1/department/askportal/blob/shirke.mithilesh/histlist';

// //   Future<ModelClass?> fetchHistory() async {
// //     try {
// //       final response = await http.get(Uri.parse(url));
// //       if (response.statusCode == 200) {
// //         final jsonData = json.decode(response.body);
// //         log('API response: $jsonData');
// //         log('Full API Response: ${jsonData.toString()}');
// //         return ModelClass.fromJson(jsonData[0]);
// //       } else {
// //         log('Failed to load history data. Status code: ${response.statusCode}');
// //         throw Exception('Failed to load history data');
// //       }
// //     } catch (error) {
// //       log('Error fetching data: $error');
// //       return null;
// //     }
// //   }
// // }
// import 'package:http/http.dart' as http;
// import '../../data/model/model_class.dart';

// class GetApiData {
//   // final String tokenUrl =
//   //     'https://ai.mahindra.com/api/v1/department/askportal/blob/shirke.mithilesh/histlist';
//   final String tokenUrl =
//       'https://ai.mahindra.com/api/v1/department/askportal/token';
//   final String historyUrl =
//       'https://ai.mahindra.com/api/v1/department/askportal/blob/shirke.mithilesh/histlist';

//   Future<String?> fetchToken() async {
//     try {
//       final response = await http.post(
//         Uri.parse(tokenUrl),
//         headers: {
//           'Content-Type': 'application/json',
//           'accept': 'application/json',
//         },
//         body: jsonEncode({
//           "department_name": "askportal",
//           "description": "token for askportal",
//           "expires_in": 36000,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         log('Token API response: $jsonData');
//         return jsonData['token'];
//       } else {
//         throw Exception('Failed to fetch token');
//       }
//     } catch (error) {
//       log('Error fetching token: $error');
//       return null;
//     }
//   }

//   Future<ModelClass?> fetchHistory() async {
//     try {
//       final token = await fetchToken();
//       if (token == null) {
//         throw Exception('Failed to get token');
//       }

//       final response = await http.get(
//         Uri.parse(historyUrl),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'accept': 'application/json',
//         },
//       );
//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         log('History API response: $jsonData');
//         return ModelClass.fromJson(jsonData[0]);
//       } else {
//         throw Exception('Failed to load history data');
//       }
//     } catch (error) {
//       log('Error fetching history: $error');
//       return null;
//     }
//   }
// }
// Latest class GetApiData {
//   Future<String> fetchToken() async {
//     final response = await http.post(
//       Uri.parse('https://ai.mahindra.com/api/v1/department/askportal/token'),
//       headers: {
//         'accept': 'application/json',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         "department_name": "askportal",
//         "description": "token for askportal",
//         "expires_in": 36000,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       print('Decoded JSON Response: $jsonResponse');
//       if (jsonResponse is List && jsonResponse.length == 2) {
//         final tokenData = jsonResponse[0];
//         if (tokenData != null && tokenData.containsKey('token')) {
//           return tokenData['token'];
//         } else {
//           throw Exception('Token not found in response');
//         }
//       } else {
//         throw Exception('Unexpected response format');
//       }
//     } else {
//       print('Failed to fetch token, Status code: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       throw Exception('Failed to fetch token');
//     }
//   }

//   Future<ModelClass?> fetchHistory() async {
//     try {
//       final token = await fetchToken();
//       final response = await http.get(
//         Uri.parse(
//             'https://ai.mahindra.com/api/v1/department/askportal/history'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'accept': 'application/json',
//           // 'Access-Token': '$2a$10$hi8Zg5zHy9bF920YWYGdeeH9UfhaAu98sqxGABpl0dfH91PUQVhju',
//           // 'Access-Token:$2a$10$lZDXWFRyGI7xAmQmMHQQ.elu1ymzhJkc7pJ4.QRRgZoa79WlVvWrG',
//         },
//       );
//       if (response.statusCode == 200) {
//         print('History Response Body: ${response.body}');
//         final jsonResponse = json.decode(response.body);
//         if (jsonResponse is Map && jsonResponse.containsKey('History_title')) {
//           final historyTitles = jsonResponse['History_title'];
//           return ModelClass(historyTitle: List<String>.from(historyTitles));
//         } else {
//           print('Unexpected response format: ${response.body}');
//           throw Exception('History data not found');
//         }
//       } else {
//         throw Exception('Failed to load history data');
//       }
//     } catch (e) {
//       print('Error fetching history: $e');
//       throw Exception('Failed to fetch history');
//     }
//   }
// }
class GetApiData {
  Future<String> fetchToken() async {
    final response = await http.post(
      Uri.parse('https://ai.mahindra.com/api/v1/department/askportal/token'),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "department_name": "askportal",
        "description": "token for askportal",
        "expires_in": 36000,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      log('Decoded JSON Response: $jsonResponse');
      print('Response body: ${response.body}');
      if (jsonResponse is List && jsonResponse.length == 2) {
        final tokenData = jsonResponse[0];
        return tokenData['token']; // ?? '';
        // if (tokenData != null && tokenData.containsKey('token')) {
        //   return tokenData['token'];
        // }
        //  }else {
        //   throw Exception('Token not found in response');
        // }
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      print('Failed to fetch token, Status code: ${response.statusCode}');
      // print('Response body: ${response.body}');
      throw Exception('Failed to fetch token');
    }
  }

  // Future<ModelClass?> fetchHistory() async {
  //   try {
  //     final token = await fetchToken();
  //     final response = await http.get(
  //       Uri.parse(
  //           'https://ai.mahindra.com/api/v1/department/askportal/history'),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //         'accept': 'application/json',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       print('History Response Body: ${response.body}');
  //       final jsonResponse = json.decode(response.body);
  //       if (jsonResponse is List && jsonResponse.length == 2) {
  //         final historyData = jsonResponse[0];
  //         final statusCode = jsonResponse[1];
  //         // return ModelClass.fromJson(jsonResponse);
  //         log("Status code is : $statusCode");
  //         if (historyData is Map && historyData.containsKey('History_title')) {
  //           final historyTitles = historyData['History_title'];
  //           print(historyTitles);
  //           return ModelClass(historyTitle: List<String>.from(historyTitles));
  //         } else {
  //           print('Unexpected response format: ${response.body}');
  //           throw Exception('History data not found');
  //         }
  //       } else {
  //         throw Exception('Unexpected response format');
  //       }
  //     } else {
  //       throw Exception('Failed to load history data');
  //     }
  //   } catch (e) {
  //     print('Error fetching history: $e');
  //     throw Exception('Failed to fetch history');
  //   }
  // }Future<ModelClass?> fetchHistory() async {
  Future<ModelClass?> fetchHistory() async {
    try {
      final token = await fetchToken();
      final response = await http.get(
        Uri.parse(
            'https://ai.mahindra.com/api/v1/department/askportal/history'),
        headers: {
          'Access-Token': token,
          'accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print(response.body);
        if (jsonResponse is List &&
            jsonResponse.length == 2 &&
            jsonResponse[0] is Map) {
          return ModelClass.fromJson(jsonResponse);
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception(
            'Failed to load history data, Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching history: $e');
      return null;
    }
  }
}
