part of 'splash_view_model.dart';

enum SplashStatus { initial, loading, completed }

class SplashState extends Equatable {
  const SplashState({
    this.status = SplashStatus.initial,
    this.progress = 0.0,
  });

  final SplashStatus status;
  final double progress;

  SplashState copyWith({
    SplashStatus? status,
    double? progress,
  }) {
    return SplashState(
      status: status ?? this.status,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object?> get props => [status, progress];
}
