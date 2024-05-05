import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbiz/navigation/navigation.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  void loadConfig() async {
    if (state.status != AppStatus.idle) return;

    try {
      emit(state.copyWith(status: AppStatus.loading));
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(state.copyWith(status: AppStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AppStatus.failure));
      addError(error, stackTrace);
    }
  }

  void updateAppSource(AppSource appSource) {
    emit(state.copyWith(appSource: appSource));
  }

  void updateAppBottomNavigationBarItemType(BottomNavigationBarItemType type) {
    emit(state.copyWith(currentBottomNavigationBarType: type));
  }
}
