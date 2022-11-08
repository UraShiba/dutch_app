import 'package:equatable/equatable.dart';

class History extends Equatable {
  final DateTime dateTime;
  final List<String> memberName;
  final int money;

  const History(
      {required this.dateTime, required this.memberName, required this.money});
  @override
  List<Object> get props => [dateTime, memberName, money];
}
