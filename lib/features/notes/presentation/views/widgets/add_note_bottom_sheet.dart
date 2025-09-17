import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/app_colors.dart';
import 'package:notes_app/core/constants/app_styles.dart';
import 'package:notes_app/core/shared_widgets/custom_button.dart';
import 'package:notes_app/core/shared_widgets/custom_text_form_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightDark,
        borderRadius: BorderRadius.circular(19),
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .04),
          CustomTextField(
            hintText: 'Title',
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            onChanged: (value) {},
            keyboardType: TextInputType.text,
          ),
          CustomTextField(
            hintText: 'Content',
            contentPadding: EdgeInsets.symmetric(vertical: 80, horizontal: 16),
            onChanged: (value) {},
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .12),
          CustomButton(
            text: 'Add',
            backgroundColor: AppColors.lightBlue,
            style: AppStyles.boldBlackText,
            onPressed: () {},
            width: MediaQuery.of(context).size.width * .94,
            height: MediaQuery.of(context).size.height * .055,
          ),
        ],
      ),
    );
  }
}
