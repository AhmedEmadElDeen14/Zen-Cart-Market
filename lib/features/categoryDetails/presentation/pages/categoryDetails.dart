import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/utils/app_colors.dart';
import 'package:zen_cart_market/core/utils/styles.dart';
import 'package:zen_cart_market/features/categoryDetails/data/data_sources/sub_category_ds.dart';
import 'package:zen_cart_market/features/categoryDetails/data/data_sources/sub_category_ds_impl.dart';
import 'package:zen_cart_market/features/categoryDetails/data/repositories/sub_category_repo_impl.dart';
import 'package:zen_cart_market/features/categoryDetails/domain/repositories/sub_category_repo.dart';
import 'package:zen_cart_market/features/categoryDetails/domain/use_cases/get_sub_category_useCase.dart';
import 'package:zen_cart_market/features/categoryDetails/presentation/bloc/sub_category_bloc.dart';

class CategoryDetails extends StatelessWidget {
  String categoryId;

  CategoryDetails({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubCategoryBloc(
        getSubCategoryUseCase: GetSubCategoryUseCase(
          SubCategoryRepoImpl(
            SubCategoryDSImpl(
              ApiManager(),
            ),
          ),
        ),
        categoryId: categoryId,
      )..add(GetSubCategoryEvent()),
      child: BlocConsumer<SubCategoryBloc, SubCategoryState>(
        listener: (context, state) {
          if (state.type == ScreenType.categoryFailures) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures?.message ?? "An error occurred."),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              title: Text(
                "Category",
                style:
                    HeadingTextStyle.h4.copyWith(color: AppColors.neutralDark),
              ),
              backgroundColor: AppColors.backgroundColor,
              iconTheme: IconThemeData(color: AppColors.neutralGrey),
              leading: GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.neutralGrey,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: state.subCategories == null
                ? Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primaryBlue,
                  ))
                : state.subCategories!.results == 0
                    ? Center(
                        child: Container(
                          child: Text(
                            "No Category Found",
                            style: BodyTextStyle.largeBold.copyWith(
                              color: AppColors.neutralDark,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(25),
                                width: MediaQuery.of(context).size.width * 1,
                                child: Text(
                                  state.subCategories!.data![index].name ?? "",
                                  style: HeadingTextStyle.h4.copyWith(
                                    color: AppColors.neutralDark,
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: state.subCategories!.data!.length,
                        ),
                      ),
          );
        },
      ),
    );
  }
}
