import 'package:dutch_app/feature/payment_management/presentation/bloc/member/member_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/entered_item_card.dart';

class MemberListView extends StatelessWidget {
  const MemberListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return BlocBuilder<MemberCubit, List<String>>(
      builder: ((context, state) => state.isNotEmpty
          ? ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: state.length,
              itemBuilder: (context, index) =>
                  EnteredItemCard(number: index, value: state[index]))
          : Container()),
    );
  }
}
