part of 'kurangi_stok_cubit.dart';

abstract class KurangiStokState extends Equatable {
  const KurangiStokState();

  @override
  List<Object> get props => [];
}

class KurangiStokInitial extends KurangiStokState {}

class KurangiStokLoading extends KurangiStokState {}

class KurangiStokSuccess extends KurangiStokState {}

class KurangiStokError extends KurangiStokState {
  final String message;

  const KurangiStokError({required this.message});
}
