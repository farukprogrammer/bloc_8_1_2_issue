import 'package:bloc_issue/bloc/simple_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleCubit extends Cubit<SimpleState> {
  SimpleCubit() : super(SimpleStateInitial());

  Future<void> simulateApiCall() async {
    emit(SimpleStateLoading());
    await Future.delayed(const Duration(seconds: 5));
    emit(SimpleStateLoaded());
  }
}
