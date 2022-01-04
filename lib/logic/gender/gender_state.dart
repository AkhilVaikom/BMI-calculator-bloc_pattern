part of 'gender_cubit.dart';

class GenderState {
  Gender gender;
  GenderState({
    required this.gender,
  });
 
}
 class GenderInitial extends GenderState{
  GenderInitial() : super(gender: Gender.male);
}