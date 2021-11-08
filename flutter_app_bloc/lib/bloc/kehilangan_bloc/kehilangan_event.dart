import 'package:equatable/equatable.dart';

abstract class KehilanganEvent extends Equatable {
  const KehilanganEvent();

  @override
  List<Object> get props => null;
}

class KehilanganFetching extends KehilanganEvent {}
