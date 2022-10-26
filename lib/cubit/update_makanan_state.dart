part of 'update_makanan_cubit.dart';

abstract class UpdateMakananState extends Equatable {
  const UpdateMakananState();

  @override
  List<Object> get props => [];
}

class UpdateMakananInitial extends UpdateMakananState {}

class UpdateMakananLoading extends UpdateMakananState {}

class UpdateMakananSuccess extends UpdateMakananState {}

class UpdateMakananError extends UpdateMakananState {
  final String message;

  const UpdateMakananError({required this.message});
}
