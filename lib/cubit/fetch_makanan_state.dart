part of 'fetch_makanan_cubit.dart';

abstract class FetchMakananState extends Equatable {
  const FetchMakananState();

  @override
  List<Object> get props => [];
}

class FetchMakananInitial extends FetchMakananState {}

class FetchMakananLoading extends FetchMakananState {}

class FetchMakananSuccess extends FetchMakananState {
  final List<MakananModel> data;

  const FetchMakananSuccess({required this.data});
}

class FetchMakananError extends FetchMakananState {
  final String message;

  const FetchMakananError({required this.message});
}
