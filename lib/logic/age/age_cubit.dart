import 'package:bloc/bloc.dart';

part 'age_state.dart';

class AgeCubit extends Cubit<AgeState> {
  AgeCubit() : super(AgeInitial());
  void ageIncrement()=>emit(AgeState(age: state.age+1));
  void ageDecrement()=>emit(AgeState(age: state.age-1));
}
