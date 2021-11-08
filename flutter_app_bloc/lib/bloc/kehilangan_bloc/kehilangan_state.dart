import 'package:equatable/equatable.dart';
import 'package:flutter_app_bloc/data/model/model_kehilangan.dart';
// import 'package:meta/meta.dart';

abstract class KehilanganState extends Equatable {
  const KehilanganState();
}

class KehilanganFetchLoading extends KehilanganState {
  @override
  List<Object> get props => [];
}

class KehilanganFetchSuccess extends KehilanganState {
  final List<Kehilangan> kehilangan;

  const KehilanganFetchSuccess({this.kehilangan});

  @override
  List<Object> get props => [kehilangan];
}

class KehilanganFetchError extends KehilanganState {
  final String error;

  const KehilanganFetchError({this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => '{error: $error}';
}
