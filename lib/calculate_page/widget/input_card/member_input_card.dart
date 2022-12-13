import 'package:dutch_app/bloc/button_enable/button_enable_cubit.dart';
import 'package:dutch_app/bloc/member/member_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberInputCard extends StatelessWidget {
  const MemberInputCard({Key? key, required this.listView}) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Member",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Name of member"),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _editingController,
                      onChanged: (value) => context
                          .read<ButtonEnableCubit>()
                          .updateMemberButton(true),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: BlocBuilder<ButtonEnableCubit, IsButtonEnable>(
                  builder: (context, state) {
                bool _isEnable =
                    context.read<ButtonEnableCubit>().isMemberButtonEnable();
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: _isEnable
                        ? () {
                            _formKey.currentState!.save();
                            context
                                .read<MemberCubit>()
                                .addMember(_editingController.value.text);
                          }
                        : null,
                    child: const Text("Add member"));
              }),
            ),
            listView
          ],
        ),
      ),
    );
  }
}
