import 'package:flutter_bloc/flutter_bloc.dart';

class DatePickCubit extends Cubit<DateTime> {
  DatePickCubit() : super(DateTime.now());

  void setDateTime(DateTime dateTime) {
    emit(dateTime);
  }

  DateTime getDateTime() {
    return state;
  }
}
