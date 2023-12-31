import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import '../../../features/chuck_jokes/data/data.dart';
import '../../../features/chuck_jokes/domain/domain.dart';
import '../../../features/chuck_jokes/presentation/presentation.dart';
import '../../core.dart';

class HomeBinding extends Module {
  @override
  void binds(Injector i) {
    // Joke Categories Injections.
    i.add<JokeCategoriesRemoteDataSource>(
      () => JokeCategoriesRemoteDataSourceImpl(i.get<Client>()),
    );

    i.add<JokeCategoriesRepository>(
      () => JokeCategoriesRepositoryImpl(
          i.get<JokeCategoriesRemoteDataSource>(), i.get<NetworkCheck>()),
    );

    i.add<JokeCategoriesUsecase>(
      () => JokeCategoriesUsecaseImpl(i.get<JokeCategoriesRepository>()),
    );

    // Joke by Category Injections.
    i.add<JokeByCategoryRemoteDataSource>(
      () => JokeByCategoryRemoteDataSourceImpl(i.get<Client>()),
    );

    i.add<JokeByCategoryRepository>(
      () => JokeByCategoryRepositoryImpl(
          i.get<JokeByCategoryRemoteDataSource>(), i.get<NetworkCheck>()),
    );

    i.add<JokeByCategoryUsecase>(
      () => JokeByCategoryUsecaseImpl(i.get<JokeByCategoryRepository>()),
    );

// HomeState Injections.
    i.add<HomeStateMobx>(
      () => HomeStateMobx(
          i.get<JokeCategoriesUsecase>(), i.get<JokeByCategoryUsecase>()),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomeView());
  }
}
