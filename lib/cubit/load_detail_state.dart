part of 'load_detail_cubit.dart';

abstract class LoadDetailState extends Equatable {
  const LoadDetailState();

  @override
  List<Object> get props => [];
}

class LoadDetailInitial extends LoadDetailState {}

class LoadDetailLoading extends LoadDetailState {}

class LoadDetailSuccess extends LoadDetailState {
  final MakananModel data;

  const LoadDetailSuccess({required this.data});
}

class LoadDetailError extends LoadDetailState {
  final String message;

  const LoadDetailError({required this.message});
}
