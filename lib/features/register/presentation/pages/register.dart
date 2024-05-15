import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/cache/shared_pref.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/app_images.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/register/data/data_sources/signup_ds_impl.dart';
import 'package:zen_cart_market/features/register/data/repositories/signUp_repo_impl.dart';
import 'package:zen_cart_market/features/register/domain/entities/SignUpRequestModel.dart';
import 'package:zen_cart_market/features/register/domain/use_cases/signup_usecase.dart';
import 'package:zen_cart_market/features/register/presentation/bloc/sign_up_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
        SignUpUseCase(
          SignUpRepoImpl(
            SignUpDSImpl(),
          ),
        ),
      ),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.status == RequestStatus.loading) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state.status == RequestStatus.success) {
            Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.appLayout, (route) => false);
          } else if (state.status == RequestStatus.failure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures?.message ?? ""),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Center(
              child: Container(
                padding: EdgeInsets.all(18),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image(image: AssetImage(AppImages.logoBlue)),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Let's Get Start",
                            style: HeadingTextStyle.h4
                                .copyWith(color: AppColors.neutralDark),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Create an new account",
                            style: BodyTextStyle.normalRegular
                                .copyWith(color: AppColors.neutralGrey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: AppColors.neutralGrey,
                                ),
                                hintText: "Full Name",
                                hintStyle: FormTextStyle.normal
                                    .copyWith(color: AppColors.neutralGrey),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.primaryBlue),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primaryRed,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.neutralLight),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: emailController,

                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: AppColors.neutralGrey,
                                ),
                                hintText: "Your Email",
                                hintStyle: FormTextStyle.normal
                                    .copyWith(color: AppColors.neutralGrey),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.primaryBlue),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primaryRed,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.neutralLight),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  color: AppColors.neutralGrey,
                                ),
                                hintText: "Password",
                                hintStyle: FormTextStyle.normal
                                    .copyWith(color: AppColors.neutralGrey),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.primaryBlue),
                                ),
                                focusColor: AppColors.primaryBlue,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primaryRed,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.neutralLight),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: confirmPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  color: AppColors.neutralGrey,
                                ),
                                hintText: "Password Again",
                                hintStyle: FormTextStyle.normal
                                    .copyWith(color: AppColors.neutralGrey),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.primaryBlue),
                                ),
                                focusColor: AppColors.primaryBlue,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primaryRed,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.neutralLight),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  SignUpRequestModel request =
                                      SignUpRequestModel(
                                    name: nameController.text,
                                    phone: "01013020660",
                                    email: emailController.text,
                                    password: passwordController.text,
                                    rePassword: confirmPasswordController.text,
                                  );
                                  BlocProvider.of<SignUpBloc>(context)
                                      .add(SignUpButtonEvent(request));
                                  CacheHelper.saveData("Token", state.model!.token);
                                  print(state.model!.token);
                                },
                                style: ButtonStyle(
                                    alignment: Alignment.center,
                                    elevation: MaterialStatePropertyAll(0),
                                    backgroundColor: MaterialStatePropertyAll(
                                        AppColors.primaryBlue),
                                    shape: MaterialStatePropertyAll(
                                        ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)))),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 57.h,
                                  width: 343.w,
                                  child: Text(
                                    "Sign Up",
                                    style: FormTextStyle.buttonText.copyWith(
                                      color: AppColors.backgroundColor,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "have a account? ",
                            style: FormTextStyle.normal,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RoutesName.login);
                            },
                            child: Text("Sign In",
                                style: LinkTextStyle.normal
                                    .copyWith(color: AppColors.primaryBlue)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
