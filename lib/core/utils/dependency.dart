import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/task_add/data/remote/task_add_remote.dart';
import '../../features/task_add/data/repository_impl/task_add_repository_impl.dart';
import '../../features/task_add/domain/repository/task_add_repository.dart';
import '../../features/task_add/domain/usecase/task_add_usecase.dart';
import '../../features/task_add/presentation/cubit/task_add_cubit.dart';
import '../../features/task_list/data/remote/task_list_remote.dart';
import '../../features/task_list/data/repository_impl/task_list_repository_impl.dart';
import '../../features/task_list/domain/repository/task_list_repository.dart';
import '../../features/task_list/domain/usecase/task_list_usecase.dart';
import '../../features/task_list/presentation/cubit/task_list_cubit.dart';
import '../../features/task_update_status/data/remote/task_update_status_remote.dart';
import '../../features/task_update_status/data/repository_impl/task_update_status_repository_impl.dart';
import '../../features/task_update_status/domain/repository/task_update_status_repository.dart';
import '../../features/task_update_status/domain/usecase/task_update_status_usecase.dart';
import '../../features/task_update_status/presentation/cubit/task_update_status_cubit.dart';

class Dependency {
  static final sl = GetIt.instance;
  Dependency._init();

  static Future<void> init() async {
    // ---------------------------TaskList Start-------------------------------//

    sl.registerLazySingleton<TaskListRemote>(
      () => TaskListRemoteImpl(),
    );

    sl.registerLazySingleton<TaskListRepository>(
      () => TaskListRepositoryImpl(sl()),
    );
    sl.registerLazySingleton(() => TaskListUsecase(sl()));
    sl.registerFactory(() => TaskListCubit(taskListUsecase: sl()));

    //---------------------------TaskList End-------------------------------//

    // ---------------------------TaskAdd Start-------------------------------//

    sl.registerLazySingleton<TaskAddRemote>(
      () => TaskAddRemoteImpl(),
    );

    sl.registerLazySingleton<TaskAddRepository>(
      () => TaskAddRepositoryImpl(sl()),
    );
    sl.registerLazySingleton(() => TaskAddUsecase(sl()));
    sl.registerFactory(() => TaskAddCubit(taskAddUsecase: sl()));

    //---------------------------TaskAdd End-------------------------------//

    // ---------------------------TaskUpdateStatus Start-------------------------------//

    sl.registerLazySingleton<TaskUpdateStatusRemote>(
      () => TaskUpdateStatusRemoteImpl(),
    );

    sl.registerLazySingleton<TaskUpdateStatusRepository>(
      () => TaskUpdateStatusRepositoryImpl(sl()),
    );
    sl.registerLazySingleton(() => TaskUpdateStatusUsecase(sl()));
    sl.registerFactory(
        () => TaskUpdateStatusCubit(taskUpdateStatusUsecase: sl()));

    //---------------------------TaskUpdateStatus End-------------------------------//
  }

  static final providers = <BlocProvider>[
    BlocProvider<TaskListCubit>(
      create: (context) => Dependency.sl<TaskListCubit>(),
    ),
    BlocProvider<TaskUpdateStatusCubit>(
      create: (context) => Dependency.sl<TaskUpdateStatusCubit>(),
    ),
    BlocProvider<TaskAddCubit>(
      create: (context) => Dependency.sl<TaskAddCubit>(),
    ),
  ];
}
