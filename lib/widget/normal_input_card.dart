import 'package:dutch_app/bloc/highway_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NormalInputCard extends StatelessWidget {
  const NormalInputCard({Key? key, required this.itemName}) : super(key: key);

  final String itemName;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _editingController = TextEditingController();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(itemName),
            SizedBox(
              width: 50,
              height: 50,
              child: TextFormField(
                key: _formKey,
                controller: _editingController,
                onFieldSubmitted: (value) =>
                    context.read<HighwayItemsCubit>().addHighwayTool(
                          (int.parse(value)),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
