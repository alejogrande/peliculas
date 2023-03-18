import 'package:flutter/material.dart';
import 'package:peliculas/resources/colors.dart';

class BackgroundCustom extends StatelessWidget {
  const BackgroundCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.black2,
            AppColors.black1,
          ],
        ),
      ),
      child: Container(), // Aquí puedes colocar tus widgets
    );
  }
}
