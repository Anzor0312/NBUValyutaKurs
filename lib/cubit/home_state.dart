
import 'package:amaliyot/models/currency_model.dart';
import 'package:amaliyot/repository/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

// ignore: must_be_immutable
class HomeErrorState extends HomeState {
  String error;
 HomeErrorState(this.error);
}

// ignore: must_be_immutable
class HomeCompleteState extends HomeState {
  List<CurrencyModel> currency;
  HomeCompleteState(this.currency);
}
