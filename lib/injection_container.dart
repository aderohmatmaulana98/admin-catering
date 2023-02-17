import 'package:cathering_mobile/core/platform/network_info.dart';
import 'package:cathering_mobile/features/login/data/datasources/login_local_data_source.dart';
import 'package:cathering_mobile/features/login/data/datasources/login_remote_data_source.dart';
import 'package:cathering_mobile/features/login/data/repositories/login_repository_impl.dart';
import 'package:cathering_mobile/features/login/domain/repositories/login_repository.dart';
import 'package:cathering_mobile/features/login/domain/usecases/post_login_use_case.dart';
import 'package:cathering_mobile/features/login/presentation/bloc/login_bloc.dart';
import 'package:cathering_mobile/features/register/data/datasources/register_remote_data_source.dart';
import 'package:cathering_mobile/features/register/data/repositories/register_repository_impl..dart';
import 'package:cathering_mobile/features/register/domain/repositories/register_repository.dart';
import 'package:cathering_mobile/features/register/domain/usecases/post_register_use_case.dart';
import 'package:cathering_mobile/features/register/presentation/bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //!features
  //!login
  //bloc
  sl.registerFactory(() => LoginBloc(useCase: sl()));

  //usecases
  sl.registerLazySingleton(() => PostLoginUseCase(repository: sl()));

  //repositories
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      networkInfo: sl(), 
      remoteDataSource: sl(), 
      localDataSource: sl()
    )
  );

  //datasources
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(client: sl())
  );
  sl.registerLazySingleton<LoginLocalDataSource>(
    () => LoginLocalDataSourceImpl(preferences: sl())
  );


  //!register
  //bloc
  sl.registerFactory(() => RegisterBloc(useCase: sl()));

  //usecases
  sl.registerLazySingleton(() => PostRegisterUseCase(repository: sl()));

  //respotiroies
  sl.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(networkInfo: sl(), remoteDataSource: sl())
  );

  //datasources
  sl.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSourceImpl(client: sl())
  );




  //!external
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => prefs);
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl())
  );
}