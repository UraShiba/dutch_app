import 'package:dutch_app/bloc/highway_tool/highway_tool_cubit.dart';
import 'package:dutch_app/bloc/total_amount/total_amount_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HighwayToolInputCard extends StatelessWidget {
  const HighwayToolInputCard({Key? key, required this.listView})
      : super(key: key);

  final Widget listView;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _editingController = TextEditingController();

    return Card(
      color: const Color((0xFFF6F9FC)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Highway tool",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Fare"),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                      key: _formKey,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: _editingController,
                      onFieldSubmitted: (value) {
                        final totalAmount =
                            context.read<TotalAmountCubit>().getTotalAmount();

                        context
                            .read<HighwayToolCubit>()
                            .addHighwayTool((int.parse(value)));
                        context.read<TotalAmountCubit>().addFeeList(totalAmount
                            .copyWith(sumHighwayTool: int.parse(value)));
                        context.read<TotalAmountCubit>().calculateTotalAmount();
                      }),
                ),
              ],
            ),
            listView
          ],
        ),
      ),
    );
  }
}
