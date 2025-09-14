import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final String image;
  final bool isSelected;
  final Function()? onTap;

  const Menu({
    super.key,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(horizontal: 12),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: isSelected
                ? [Colors.redAccent, Colors.red.shade500] // selected
                : [Colors.white, Colors.grey.shade200], // unselected
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: isSelected ? Colors.redAccent : Colors.grey.shade400,
            width: isSelected ? 3 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? Colors.redAccent.withOpacity(0.6)
                  : Colors.black12,
              blurRadius: isSelected ? 15 : 6,
              spreadRadius: isSelected ? 3 : 1,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0), // some spacing for image
            child: Image.asset(image, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
