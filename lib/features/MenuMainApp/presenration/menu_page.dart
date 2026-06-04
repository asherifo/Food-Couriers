import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/features/DetailScreen/presentation/detail_screen.dart';

import '../../../core/Colors/colors.dart';
import '../logic/menu_cubit.dart';
import '../logic/menu_state.dart';
// استيراد الملفات السابقة (Cubit, Model)

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header (Location & Profile)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(child: CircleAvatar(backgroundColor: AppColors.Primary,child: Text('E',style: TextStyle(color: Colors.white),),),onTap: (){
                            Navigator.pushNamed(context, '/Profile',arguments: 1);
                          },),
                          Icon(Icons.location_on, color: Colors.red, size: 18),
                          Text(" Freedom way, Lekki phase", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.notifications_none, color: Colors.orange),
                  )
                ],
              ),
              const SizedBox(height: 25),
              // 2. Promo Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Special Offer\nfor March", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          // زر Buy Now
                        ],
                      ),
                    ),
                    Image.network('https://cdn-icons-png.flaticon.com/512/3132/3132693.png', height: 80),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              // 3. Category Selector (Pizza, Burger..) - يمكنك عملها بـ ListView.builder
              const Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              // 4. Recipes Grid (هنا نستخدم الـ BlocBuilder)
              BlocBuilder<RecipeCubit, RecipeState>(
                builder: (context, state) {
                  if (state is RecipeLoading) return const Center(child: CircularProgressIndicator());
                  if (state is RecipeLoaded) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: state.homeRecipes.length,
                      itemBuilder: (context, index) {
                        final recipe = state.homeRecipes[index];
                        return GestureDetector(
                          onTap: () {
                            context.read<RecipeCubit>().fetchRecipeDetails(recipe.id);
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Expanded(child: Image.network(recipe.image, fit: BoxFit.contain)),
                                Text(recipe.title, maxLines: 1, style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text("\$${recipe.price}", style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Text("No Data");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}