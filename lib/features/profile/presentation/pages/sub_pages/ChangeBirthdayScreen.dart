import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';



class ChangeBirthdayScreen extends StatelessWidget {
  final TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('MM/dd/yyyy');

  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      _dateController.text = _dateFormat.format(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Birthday",
          style: HeadingTextStyle.h3.copyWith(
            color: AppColors.neutralDark,
          ),
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.neutralGrey,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        shape: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.neutralLight,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Birthday',
              style: HeadingTextStyle.h3.copyWith(
                color: AppColors.neutralDark,
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryBlue),
                  borderRadius: BorderRadius.circular(7)
              ),
              child: GestureDetector(
                onTap: () => _pickDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      hintText: 'Select your birthday',
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      alignment: Alignment.center,
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor:
                      MaterialStatePropertyAll(AppColors.primaryBlue),
                      shape: MaterialStatePropertyAll(
                          ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)))),
                  child: Container(
                    alignment: Alignment.center,
                    height: 57.h,
                    width: 343.w,
                    child: Text(
                      "Save",
                      style: FormTextStyle.buttonText.copyWith(
                        color: AppColors.backgroundColor,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
