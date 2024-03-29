import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonEnableCubit extends Cubit<IsButtonEnable> {
  ButtonEnableCubit()
      : super(IsButtonEnable(
            fuelConsumption: false,
            startTrip: false,
            endTrip: false,
            litter: false,
            member: false,
            save: false));

  void updateFuelConsumption(bool isEnable) {
    emit(state.copyWith(fuelConsumption: isEnable));
  }

  void updateStartTrip(bool isEnable) {
    emit(state.copyWith(startTrip: isEnable));
  }

  void updateEndTrip(bool isEnable) {
    emit(state.copyWith(endTrip: isEnable));
  }

  void updateLitter(bool isEnable) {
    emit(state.copyWith(litter: isEnable));
  }

  void updateMemberButton(bool isEnable) {
    emit(state.copyWith(member: isEnable));
  }

  void updateSaveButton(bool isEnable) {
    emit(state.copyWith(save: isEnable));
  }

  bool isGasFeeButtonEnable() {
    if (state.fuelConsumption &&
        state.startTrip &&
        state.endTrip &&
        state.litter) {
      return true;
    } else {
      return false;
    }
  }

  bool isMemberButtonEnable() {
    if (state.member) {
      return true;
    } else {
      return false;
    }
  }

  bool isSaveButtonEnable() {
    if (state.save) {
      return true;
    } else {
      return false;
    }
  }
}

class IsButtonEnable {
  final bool fuelConsumption;
  final bool startTrip;
  final bool endTrip;
  final bool litter;
  final bool member;
  final bool save;

  IsButtonEnable(
      {required this.fuelConsumption,
      required this.startTrip,
      required this.endTrip,
      required this.litter,
      required this.member,
      required this.save});

  IsButtonEnable copyWith(
          {bool? fuelConsumption,
          bool? startTrip,
          bool? endTrip,
          bool? litter,
          bool? member,
          bool? save}) =>
      IsButtonEnable(
          fuelConsumption: fuelConsumption ?? this.fuelConsumption,
          startTrip: startTrip ?? this.startTrip,
          endTrip: endTrip ?? this.endTrip,
          litter: litter ?? this.litter,
          member: member ?? this.member,
          save: save ?? this.save);
}
