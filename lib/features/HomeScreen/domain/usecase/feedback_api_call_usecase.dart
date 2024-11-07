import '../repository/api_repository_.dart';

class ApiCallUseCase {
  final ApiRepository repository;

  ApiCallUseCase(this.repository);

  Future<void> execute() async {
    return await repository.makeApiCall();
  }
}