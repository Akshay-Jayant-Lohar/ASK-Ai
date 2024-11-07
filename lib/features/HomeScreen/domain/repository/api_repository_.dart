import '../entity/feedback_entity.dart';

abstract class ApiRepository {
  Future<void> submitFeedback(FeedbackEntity feedback);
  makeApiCall();
}
