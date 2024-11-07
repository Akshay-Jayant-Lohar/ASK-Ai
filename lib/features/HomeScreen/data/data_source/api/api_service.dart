import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://ai.mahindra.com/api/v1/department/askportal')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('/feedback')
  Future<void> submitFeedback(
      @Header("Access-Token") String token,
      @Body() Map<String, dynamic> body);
}
