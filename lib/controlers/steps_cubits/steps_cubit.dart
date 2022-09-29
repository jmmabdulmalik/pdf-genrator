import 'package:flutter_bloc/flutter_bloc.dart';

class StepsCubit extends Cubit<int>{
  StepsCubit(super.initialState);
  getState({required state}){
    emit(state);
  }
}