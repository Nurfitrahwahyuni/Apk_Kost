import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../controllers/chat_controller.dart';
import '../widgets/chat_tile.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: controller.search, // Menggunakan fungsi search dari controller
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.chatItems.length, // Jumlah item berdasarkan chatItems
              itemBuilder: (context, index) {
                return ChatTile(chatItem: controller.chatItems[index]); // Menampilkan ChatTile sesuai item
              },
            )),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green, // Warna ikon yang dipilih
        unselectedItemColor: Colors.grey, // Warna ikon yang tidak dipilih
        currentIndex: 2, // Set index awal pada ikon chat
        type: BottomNavigationBarType.fixed, // Tipe BottomNavigationBar
        onTap: (index) {
          switch (index) {
            case 0: // Ikon search
              Get.toNamed(AppRoutes.HOMEPAGE); // Navigasi ke halaman HOME_PAGE
              break;
            case 1: // Ikon home
              Get.toNamed(AppRoutes.HOME); // Navigasi ke halaman HOME
              break;
            case 2: // Ikon chat
              // Tidak melakukan apa-apa untuk ikon chat
              break;
            case 3: // Ikon profil
              Get.toNamed(AppRoutes.PROFILE); // Navigasi ke halaman profil
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''), // Ikon search
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''), // Ikon home
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: ''), // Ikon chat
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''), // Ikon profil
        ],
      ),
    );
  }
}
