import 'package:ask/features/HomeScreen/domain/entity/feedback_entity.dart';

import '../../domain/repository/api_repository_.dart';
import '../data_source/api/api_service.dart';

class ApiRepositoryImpl implements ApiRepository {
  final ApiService apiService;
  final String token = "\$2a\$10\$syI5F2LbrgGylrvt5rGhi.3WY1oXJqsDmHcXDjjiWhFdcwcm2/B6K";

  ApiRepositoryImpl(this.apiService);

  @override
  Future<void> makeApiCall() async {
    await apiService.submitFeedback(
      token,
      {"done": true},
    );   
   
  }

  @override
  Future<void> submitFeedback(FeedbackEntity feedback) {
    // TODO: implement submitFeedback
    throw UnimplementedError();
  }
}
