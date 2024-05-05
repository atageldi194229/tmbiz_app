// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_cubit.dart';

enum AppSource {
  masters,
  store,
}

enum AppStatus {
  idle,
  loading,
  success,
  failure,
}

class AppState extends Equatable {
  const AppState({
    required this.status,
    required this.appSource,
    required this.currentBottomNavigationBarType,
  });

  const AppState.initial()
      : this(
          status: AppStatus.idle,
          appSource: AppSource.store,
          currentBottomNavigationBarType: BottomNavigationBarItemType.home,
        );

  final AppStatus status;
  final AppSource appSource;
  final BottomNavigationBarItemType currentBottomNavigationBarType;

  @override
  List<Object> get props => [
        status,
        appSource,
        currentBottomNavigationBarType,
      ];

  AppState copyWith({
    AppStatus? status,
    AppSource? appSource,
    BottomNavigationBarItemType? currentBottomNavigationBarType,
  }) {
    return AppState(
      status: status ?? this.status,
      appSource: appSource ?? this.appSource,
      currentBottomNavigationBarType: currentBottomNavigationBarType ?? this.currentBottomNavigationBarType,
    );
  }
}
