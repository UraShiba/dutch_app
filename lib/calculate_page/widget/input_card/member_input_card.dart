import 'package:dutch_app/bloc/button_enable/button_enable_cubit.dart';
import 'package:dutch_app/bloc/member/member_cubit.dart';
import 'package:dutch_app/configuration/style.dart';
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
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Member",
              textAlign: TextAlign.left,
              style: titleLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Name of member", style: bodyLarge),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      cursorColor: orangeColor,
                      decoration: inputDecoration,
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
                      backgroundColor: buttonColor,
                    ),
                    onPressed: _isEnable
                        ? () =>
                            buttonAction(context, _formKey, _editingController)
                        : null,
                    child: const Text(
                      "Add member",
                      style: bodyMedium,
                    ));
              }),
            ),
            listView
          ],
        ),
      ),
    );
  }
}

void buttonAction(BuildContext context, GlobalKey<FormState> globalKey,
    TextEditingController controller) {
  globalKey.currentState!.save();
  context.read<MemberCubit>().addMember(controller.value.text);
  context.read<ButtonEnableCubit>().updateSaveButton(true);
}
