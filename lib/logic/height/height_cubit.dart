import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'height_state.dart';

class HeightCubit extends Cubit<HeightState> {
  HeightCubit() : super(HeightInitial());
  void heightIncrement()=>emit(HeightState(height: state.height+1));
  void heightDecrement()=>emit(HeightState(height: state.height-1));
}
