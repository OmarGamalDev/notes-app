import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/app_colors.dart';
import 'package:notes_app/core/constants/app_styles.dart';
import 'package:notes_app/core/shared_widgets/custom_button.dart';
import 'package:notes_app/core/shared_widgets/custom_text_form_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AddNoteForm(),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightDark,
          borderRadius: BorderRadius.circular(19),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            CustomTextFormField(
              hintText: 'Title',
              onSaved: (value) => title = value,
              contentPadding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              keyboardType: TextInputType.text,
            ),
            CustomTextFormField(
              hintText: 'Content',
              onSaved: (value) => subTitle = value,
              contentPadding: EdgeInsets.symmetric(
                vertical: 80,
                horizontal: 16,
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .12),
            CustomButton(
              text: 'Add',
              backgroundColor: AppColors.lightBlue,
              style: AppStyles.boldBlackText,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  Navigator.of(context).pop({'title': title, 'subTitle': subTitle});
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              width: MediaQuery.of(context).size.width * .94,
              height: MediaQuery.of(context).size.height * .055,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .12),
          ],
        ),
      ),
    );
  }
}
