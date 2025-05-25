import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/ServiceScreen.dart';
import 'package:musicapp/widgets/navbar.dart';
import 'package:musicapp/widgets/serviceCard.dart';
import 'package:provider/provider.dart';
import 'package:musicapp/service/viewmodel.dart';
import 'package:flutter/services.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent for overlay
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: ChangeNotifierProvider(
        create: (_) => ServiceViewModel()..fetchServices(),
        child: Scaffold(
          backgroundColor: const Color(0xFF18171c),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Upper half background + Banner area (merged)
                  Container(
                    width: double.infinity,
                    // Height is sum of previous background and banner
                    height: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFFab0141),
                          const Color(0xFF590122),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        // Top bar with search and profile
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 16.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2F2F39),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 12.w),
                                      const Icon(Icons.search,
                                          color: Colors.white70, size: 22),
                                      SizedBox(width: 8.w),
                                      Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Search 'Punjabi Lyrics'",
                                            hintStyle: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 15.sp,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Icon(Icons.mic_none,
                                          color: Colors.white70, size: 22),
                                      SizedBox(width: 12.w),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Container(
                                width: 36.w,
                                height: 36.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEADDFF),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.person,
                                    color: Color(0xFF2F2F39), size: 22),
                              ),
                            ],
                          ),
                        ),
                        // Banner area (overlay images and text)
                        Container(
                          width: double.infinity,
                          height: 200.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Stack(
                            children: [
                              // Vinyl image (left)
                              Positioned(
                                left: -25.w,
                                bottom: 10.h,
                                child: SizedBox(
                                  width: 120.w,
                                  height: 120.w,
                                  child: Image.asset(
                                    'assets/images/L2.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              // Keyboard image (right)
                              Positioned(
                                right: -35.w,
                                bottom: 10.h,
                                child: SizedBox(
                                  width: 120.w,
                                  height: 120.w,
                                  child: Image.asset(
                                    'assets/images/L1.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              // Centered text and button
                              Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Claim your",
                                      style: GoogleFonts.syne(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "Free Demo",
                                      style: GoogleFonts.lobster(
                                        color: Colors.white,
                                        fontSize: 35.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      "for custom Music Production",
                                      style: GoogleFonts.syne(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 18.h),
                                    SizedBox(
                                      height: 40.h,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(22.r),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 18.w),
                                          elevation: 0,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Book Now",
                                          style: GoogleFonts.syne(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: Text(
                      "Hire hand-picked Pros for popular music services",
                      style: GoogleFonts.syne(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Service cards from Firestore via ViewModel
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Consumer<ServiceViewModel>(
                      builder: (context, vm, _) {
                        if (vm.loading) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 40.h),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        if (vm.error != null) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 40.h),
                              child: Text(vm.error!,
                                  style: TextStyle(color: Colors.white)),
                            ),
                          );
                        }
                        if (vm.services.isEmpty) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 40.h),
                              child: Text('No services found',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          );
                        }
                        return Column(
                          children: vm.services.map((service) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: ServiceCard(
                                iconUrl: service.icon,
                                title: service.title,
                                subtitle: service.description,
                                backgroundUrl: service.background,
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ServiceTappedScreen(
                                        title: service.title,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
          // Bottom Navigation Bar
          bottomNavigationBar: Container(
            height: 72.h,
            decoration: BoxDecoration(
              color: const Color(0xFF18171c),
              border: Border(
                top: BorderSide(color: Colors.white12, width: 1),
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(22.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarItem(
                  image: Image.asset(
                    'assets/images/home_icon.png',
                    width: 24.w,
                    height: 24.w,
                  ),
                  label: "Home",
                  selected: true,
                  icon: null,
                ),
                NavBarItem(
                  // icon: Icons.newspaper,
                  // label: "Search",
                  image: Image.asset(
                    'assets/images/news.png',
                    width: 24.w,
                    height: 24.w,
                  ),
                  label: "News",
                  selected: false, icon: null,
                ),
                NavBarItem(
                  // icon: Icons.library_music,
                  // label: "Library",
                  image: Image.asset(
                    'assets/images/music.png',
                    width: 24.w,
                    height: 24.w,
                  ),
                  label: "Music",
                  selected: false, icon: null,
                ),
                NavBarItem(
                  // icon: Icons.settings,
                  // label: "Settings",
                  image: Image.asset(
                    'assets/images/Union.png',
                    width: 24.w,
                    height: 24.w,
                  ),
                  label: "Projects",
                  selected: false, icon: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
