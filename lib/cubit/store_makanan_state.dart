part of 'store_makanan_cubit.dart';

abstract class StoreMakananState extends Equatable {
  const StoreMakananState();

  @override
  List<Object> get props => [];
}

class StoreMakananInitial extends StoreMakananState {}

class StoreMakananLoading extends StoreMakananState {}

class StoreMakananSuccess extends StoreMakananState {}

class StoreMakananError extends StoreMakananState {
  final String message;

  const StoreMakananError({required this.message});
}
