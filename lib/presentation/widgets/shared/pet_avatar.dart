import 'package:flutter/material.dart';

import '../../../config/theme/constants/constants.dart';

class PetAvatar extends StatelessWidget {
  const PetAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 64,
            backgroundImage: NetworkImage(
              'https://img.freepik.com/fotos-premium/ai-genero-retrato-raza-perro-chihuahua-lindo-feliz-emocionado-sonriendo_441362-3146.jpg',
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  color: whiteColor,
                ),
                onPressed: () {
                  // Aquí va la funcionalidad para subir la foto
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
