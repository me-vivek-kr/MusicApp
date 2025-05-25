import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarItem extends StatelessWidget {
  final IconData? icon;
  final Image? image;
  final String label;
  final bool selected;

  const NavBarItem({
    required this.icon,
    required this.label,
    this.selected = false,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Top white bar for selected item
        if (selected)
          Container(
            width: 10.w,
            height: 4.h,
            margin: EdgeInsets.only(bottom: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.h),
            ),
          )
        else
          SizedBox(height: 8.h), // To keep spacing consistent
        if (image != null)
          SizedBox(
            width: 26.sp,
            height: 26.sp,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                selected ? Colors.white : Colors.white54,
                BlendMode.srcIn,
              ),
              child: image!,
            ),
          )
        else if (icon != null)
          Icon(
            icon,
            color: selected ? Colors.white : Colors.white54,
            size: 26.sp,
          ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: selected ? Colors.white : Colors.white54,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
