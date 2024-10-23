import '../../data/repository/api_repository.dart';

class MakeApiCallUseCase {
  final ApiRepository repository;

  MakeApiCallUseCase(this.repository);

  Future<void> execute() async {
    return await repository.makeApiCall();
  }
}