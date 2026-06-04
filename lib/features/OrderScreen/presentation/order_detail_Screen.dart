// file: order_details_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Colors/colors.dart';
import '../logic/order_cubit.dart';


class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order details", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.Primary),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          // إذا كانت السلة فارغة
          if (state.cartItems.isEmpty) {
            return const Center(
              child: Text("Your cart is empty!", style: TextStyle(fontSize: 18, color: Colors.grey)),
            );
          }

          // حساب الحقول المالية ديناميكياً
          double subTotal = context.read<CartCubit>().subTotal;
          double deliveryCharge = 5.0; // قيمة ثابتة للتوصيل كمثال
          double total = subTotal + deliveryCharge;

          return Column(
            children: [
              // 1. قائمة العناصر المضافة ديناميكياً
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: state.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = state.cartItems[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          // حل مشكلة عرض الصورة باستخدام رابط الـ API الفعلي مع معالجة الأخطاء
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              item.image,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                // صورة بديلة تظهر في حال حدوث خطأ في الرابط أو عدم وجود إنترنت
                                return Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.grey.shade200,
                                  child: const Icon(Icons.fastfood, color: Colors.grey),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                const Text("Spoonacular Recipe", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                Text("\$${item.price.toStringAsFixed(2)}", style: const TextStyle(color: AppColors.Primary, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          // زر الحذف من السلة (أو تقليل الكمية)
                          IconButton(
                              onPressed: () {
                                context.read<CartCubit>().removeFromCart(item);
                              },
                              icon: const Icon(Icons.remove_circle_outline, color:AppColors.Primary)
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // 2. كارت الحساب الإجمالي الديناميكي (اللون الأحمر السفلي)
              Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: AppColors.Primary,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    SummaryRow(label: "Sub-Total", value: "${subTotal.toStringAsFixed(2)} \$"),
                    SummaryRow(label: "Delivery Charge", value: "${deliveryCharge.toStringAsFixed(2)} \$"),
                    const Divider(color: Colors.white24),
                    SummaryRow(label: "Total", value: "${total.toStringAsFixed(2)} \$", isTotal: true),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          // هنا يمكنك إضافة الأكشن الخاص بإتمام الطلب
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                        ),
                        child: const Text("Place My Order", style: TextStyle(color: AppColors.Primary, fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

// الـ Widget المساعد لعرض الأسطر المالية
class SummaryRow extends StatelessWidget {
  final String label, value;
  final bool isTotal;
  const SummaryRow({super.key, required this.label, required this.value, this.isTotal = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.white, fontSize: isTotal ? 18 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(color: Colors.white, fontSize: isTotal ? 18 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}