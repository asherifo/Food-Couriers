import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/Colors/colors.dart';

import '../../MenuMainApp/logic/menu_cubit.dart';
import '../../MenuMainApp/logic/menu_state.dart';
import '../../OrderScreen/logic/order_cubit.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) return const Center(child: CircularProgressIndicator());
          if (state is RecipeLoaded && state.selectedRecipe != null) {
            final recipe = state.selectedRecipe!;
            return Stack(
              children: [
                // 1. Image
                Positioned(
                  top: 0, right: 0, left: 0,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.network(recipe.image, fit: BoxFit.cover),
                ),
                // 2. Details Card
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Container(width: 50, height: 5, color: Colors.grey.shade300)),
                        const SizedBox(height: 20),
                        Text(recipe.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange, size: 20),
                            Text(" ${recipe.rating} Rating", style: const TextStyle(fontWeight: FontWeight.bold)),
                            const Spacer(),
                            Text("\$${recipe.price}", style: const TextStyle(color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(recipe.summary, style: TextStyle(color: Colors.grey.shade600, fontSize: 16, height: 1.5)),
                          ),
                        ),
                        // زر Add to Cart
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              // هنا تضيف الوجبة لسلة المشتريات
                              // إضافة الوجبة الحالية إلى السلة
                              context.read<CartCubit>().addToCart(recipe);

                              // إشعار للمستخدم بأنه تم الإضافة
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${recipe.title} added to cart!")),
                              );

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.Primary,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text("Add To Chart", style: TextStyle(color: Colors.white, fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // زر الرجوع
                Positioned(top: 50, left: 20, child: BackButton(color: AppColors.Primary, onPressed: () {
                  Navigator.pop(context);
                })),
                Positioned(top: 50, right: 20, child: Container(
                  decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.circular(10),),
                  child: IconButton(icon:Icon(Icons.payments_rounded),color: Colors.green, onPressed: () {
                    Navigator.pushNamed(context, '/OrderDetail');
                  }),
                )),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}