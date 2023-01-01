import 'package:dutch_app/bloc/member/member_cubit.dart';
import 'package:dutch_app/bloc/total_amount/total_amount_cubit.dart';
import 'package:dutch_app/configuration/style.dart';
import 'package:dutch_app/model/total_amount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PricePerPersonCard extends StatelessWidget {
  const PricePerPersonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TotalAmountCubit, TotalAmount>(
        builder: ((context, state) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 80,
                child: Card(
                  color: cardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Price per person",
                        textAlign: TextAlign.left,
                        style: textStyle1,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Bill", style: textStyle2),
                          BlocBuilder<MemberCubit, List<String>>(
                            builder: ((context, memberList) => memberList
                                    .isNotEmpty
                                ? Text(
                                    "${context.read<TotalAmountCubit>().getPricePersonAmount(memberList.length).toString()} yen",
                                    style: textStyle3)
                                : Text(
                                    "${context.read<TotalAmountCubit>().getPricePersonAmount(1).toString()} yen",
                                    style: textStyle3)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
