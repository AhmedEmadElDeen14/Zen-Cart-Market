import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';

class GenderSelectionScreen extends StatelessWidget {
  String? _selectedGender = 'Male';
  final List<String> _genderOptions = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gender",
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
              'Choose Gender',
              style: HeadingTextStyle.h4.copyWith(
                color: AppColors.neutralDark,
              ),
            ),
            SizedBox(height: 8.0),
            Container(

              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryBlue),
                borderRadius: BorderRadius.circular(7)
              ),
              child: DropdownButtonFormField<String>(
                value: _selectedGender,
                items: _genderOptions.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
                decoration: InputDecoration(
                  hintStyle: FormTextStyle.fill.copyWith(
                    color: AppColors.neutralGrey,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
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
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
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
