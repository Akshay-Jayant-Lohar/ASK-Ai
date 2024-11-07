import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/HomeScreen/data/data_source/api/api_service.dart';
import 'features/HomeScreen/data/repository/api_repository_impl.dart';
import 'features/HomeScreen/domain/usecase/feedback_api_call_usecase.dart';
import 'features/HomeScreen/presentation/bloc/bottomBar_cubit.dart';
import 'features/HomeScreen/presentation/pages/home_screen.dart';
import 'features/HomeScreen/presentation/bloc/home_cubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
       final dio = Dio();
    final apiService = ApiService(dio);
    final apiRepository = ApiRepositoryImpl(apiService);
    final apiCallUseCase = ApiCallUseCase(apiRepository);
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<BottomBarCubit>(
          create: (context) => BottomBarCubit(apiCallUseCase),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
