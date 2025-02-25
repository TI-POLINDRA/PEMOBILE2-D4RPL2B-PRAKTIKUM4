import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewV3 extends StatelessWidget {
  const HomeViewV3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("DELIVER TO",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text("Halal Lab office",
                    style: TextStyle(fontSize: 14.sp, color: Colors.black)),
                Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined,
                      color: Colors.white),
                  onPressed: () {},
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  constraints:
                      const BoxConstraints(minWidth: 20, minHeight: 20),
                  child: Text("2",
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hey Halal, Good Afternoon!",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search dishes, restaurants",
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("All Categories",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      Text("See All",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.orange)),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 160.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        {"image": "category_pizza.png", "name": "Pizza"},
                        {"image": "category_burger.png", "name": "Burger"},
                        {"image": "category_sushi.png", "name": "Sushi"}
                      ].map((item) {
                        return Container(
                          width: 180.w,
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                elevation: 6,
                                shadowColor: Colors.black26,
                                child: Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: Image.asset(
                                      'assets/images/${item["image"]}',
                                      width: double.infinity,
                                      height: 100.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(item["name"]!,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Open Restaurants",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      Text("See All",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.orange)),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            'assets/images/restaurant_${index + 1}.png',
                            width: double.infinity,
                            height: 200.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Rose Garden Restaurant",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold)),
                              Text("Burger - Chicken - Wings",
                                  style: TextStyle(fontSize: 12.sp)),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.orange, size: 16.sp),
                                  Text("4.7",
                                      style: TextStyle(fontSize: 12.sp)),
                                  SizedBox(width: 10.w),
                                  Icon(FontAwesomeIcons.truck, size: 16.sp),
                                  Text(" Free",
                                      style: TextStyle(fontSize: 12.sp)),
                                  SizedBox(width: 10.w),
                                  Icon(Icons.access_time, size: 16.sp),
                                  Text(" 20 min",
                                      style: TextStyle(fontSize: 12.sp)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
