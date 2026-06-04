import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

// تأكد من المسارات الصحيحة للـ ApiService والـ Cubit في مشروعك
import '../logic/profile_cibit.dart';
import '../logic/profile_state.dart';
// قم بعمل import لملف الـ ApiService هنا إذا كان في ملف منفصل
// import '../data/api_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. استخراج الـ ID الممرر من صفحة الـ Login أولاً
    final int userId = ModalRoute.of(context)!.settings.arguments as int;

    // 2. نقوم بحقن الـ Cubit وتمرير الـ ApiService مع الـ user Id مباشرة هنا
    return BlocProvider(

      create: (context) => UserCubit(ApiService())..fetchUser(userId),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFFFEBEE),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: Color(0xFFE91E63)),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: const Color(0xFFFFEBEE),
                child: IconButton(
                  icon: const Icon(Icons.notifications_none, size: 20, color: Color(0xFFE91E63)),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator(color: Color(0xFFE91E63)));
            }
            if (state is UserError) {
              return Center(child: Text("خطأ: ${state.error}", style: const TextStyle(color: Colors.red)));
            }
            if (state is UserLoaded) {
              final user = state.user;

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Profile",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 25),

                    // صورة المستخدم الشخصية مع زر التعديل الوردي
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFFFFEBEE), width: 4),
                            ),
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.grey.shade200,
                              backgroundImage: CachedNetworkImageProvider(user['image']),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 4,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: const Color(0xFFE91E63),
                              child: const Icon(Icons.edit, size: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    // قسم البيانات الشخصية
                    _buildSection("Personal info", [
                      _buildInfoRow("Your name", "${user['firstName']} ${user['lastName']}"),
                      _buildInfoRow("Occupation", user['company']['title']),
                      _buildInfoRow("Employer", user['company']['name']),

                      // الـ Switch المتواجد بالتصميم المرفق
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nigeria", style: TextStyle(color: Colors.grey.shade500, fontSize: 14, fontWeight: FontWeight.w500)),
                            Transform.scale(
                              scale: 0.8,
                              child: Switch(
                                onChanged: (val) {

                                },
                                value: true,
                                activeColor: Colors.white,
                                activeTrackColor: const Color(0xFFE91E63),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                    const SizedBox(height: 25),

                    // قسم بيانات الاتصال
                    _buildSection("Contact Info", [
                      _buildInfoRow("Phone number", user['phone'] ?? ''),
                      _buildInfoRow("Email", user['email'] ?? ''),
                    ]),
                    const SizedBox(height: 40),

                    // زر التعديل (Edit Button)
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE91E63),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Edit",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}