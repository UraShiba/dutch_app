import 'package:flutter_bloc/flutter_bloc.dart';

class MemberCubit extends Cubit<List<String>> {
  MemberCubit() : super([]);

  void addMember(String member) {
    state.add(member);
    emit(List.of(state));
  }

  List<String> getMember() {
    return state;
  }

  void removePerson(int number) {
// To be implemented
  }
}
