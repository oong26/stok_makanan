part of 'delete_makanan_cubit.dart';

abstract class DeleteMakananState extends Equatable {
  const DeleteMakananState();

  @override
  List<Object> get props => [];
}

class DeleteMakananInitial extends DeleteMakananState {}

class DeleteMakananLoading extends DeleteMakananState {}

class DeleteMakananSuccess extends DeleteMakananState {}

class DeleteMakananError extends DeleteMakananState {
  final String message;

  const DeleteMakananError({required this.message});
}
