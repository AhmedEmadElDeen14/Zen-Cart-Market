import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zen_cart_market/config/routes/routes.dart';
import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/cache/shared_pref.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/app_images.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/logIn/data/data_sources/login_local_ds_impl.dart';
import 'package:zen_cart_market/features/logIn/data/repositories/login_repo_impl.dart';
import 'package:zen_cart_market/features/logIn/domain/use_cases/login_usecase.dart';
import 'package:zen_cart_market/features/logIn/presentation/bloc/log_in_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        loginUseCase: LoginUseCase(
          LoginRepoImpl(
            LoginRemoteDSImpl(
              ApiManager(),
            ),
          ),
        ),
      ),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == RequestStatus.loading) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          }
          else if (state.status == RequestStatus.success) {
            Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.appLayout, (route) => false);
            CacheHelper.saveData("Token", state.userModel!.token);
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
                            "Welcome to ZenCart",
                            style: HeadingTextStyle.h4
                                .copyWith(color: AppColors.neutralDark),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sign in to continue",
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
                            ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<LoginBloc>(context).add(
                                      LoginButtonEvent(
                                          "ahmedemad141@gmail.com", "Emad@123"));

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
                                    "Sign In",
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
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(
                            height: 16,
                            thickness: 2,
                            indent: 0,
                            endIndent: 200.w,
                            color: AppColors.neutralLight,
                          ),
                          Center(
                              child: Text(
                            "OR",
                            style: FormTextStyle.buttonText
                                .copyWith(color: AppColors.neutralGrey),
                          )),
                          Divider(
                            height: 16,
                            thickness: 2,
                            indent: 200.w,
                            endIndent: 0,
                            color: AppColors.neutralLight,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 343.w,
                              height: 57.h,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: AppColors.neutralLight)),
                              child: Stack(
                                children: [
                                  Container(
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/googleIcon.png")),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  Center(
                                    child: Text(
                                      "Login with Google",
                                      style: FormTextStyle.buttonText.copyWith(
                                          color: AppColors.neutralGrey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 343.w,
                              height: 57.h,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: AppColors.neutralLight)),
                              child: Stack(
                                children: [
                                  Container(
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/Facebook.png")),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  Center(
                                    child: Text(
                                      "Login with facebook",
                                      style: FormTextStyle.buttonText.copyWith(
                                          color: AppColors.neutralGrey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Forgot Password?",
                              style: LinkTextStyle.small
                                  .copyWith(color: AppColors.primaryBlue),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don’t have a account? ",
                                style: FormTextStyle.normal,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.register);
                                },
                                child: Text("Register",
                                    style: LinkTextStyle.normal.copyWith(
                                        color: AppColors.primaryBlue)),
                              )
                            ],
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
