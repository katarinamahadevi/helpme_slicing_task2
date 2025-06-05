import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/pages/page_home.dart';


class CustomAppBarKontak extends StatelessWidget implements PreferredSizeWidget {
  final IconData icon;
  final String title;
  final double height; 

  const CustomAppBarKontak({
    super.key,
    required this.icon,
    required this.title,
    this.height = 250, 
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Container(
        height: 250, 
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: SafeArea( 
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 5), 
                Icon(icon, color: Colors.white, size: 50),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
