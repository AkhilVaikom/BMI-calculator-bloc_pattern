import 'package:bloc/bloc.dart';
import 'package:bmi_calculator_bloc/constants/enum_constants.dart';

part 'gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderInitial());
  void selectGenderMale()=>emit(GenderState(gender: state.gender= Gender.male));
  void selectGenderFemale()=>emit(GenderState(gender: state.gender=Gender.female));
}
