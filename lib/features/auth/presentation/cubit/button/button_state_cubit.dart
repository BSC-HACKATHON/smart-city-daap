
import 'package:bsc/features/auth/domain/usecases/usecase.dart';
import 'package:bsc/features/auth/presentation/cubit/button/button_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  void excute({dynamic params, required UseCase usecase}) async {

    emit(ButtonLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
     Either result = await usecase.call(param: params);

     result.fold(
      (error) {
        emit(
          ButtonFailureState(errorMessage: error)
        );
      },
      (data) {
        emit(ButtonSuccessState());
      }

     );
    } catch(e){
      emit(
        ButtonFailureState(errorMessage: e.toString())
      );
    }
  }
}