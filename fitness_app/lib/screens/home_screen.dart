import 'package:fitness_app/models/category_model.dart';
import 'package:fitness_app/models/diet_model.dart';
import 'package:fitness_app/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialData() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialData();

    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _buildSearchField(),

          SizedBox(height: 40),

          _buildCategoriesSection(),

          SizedBox(height: 40),

          _buildDietsSection(),

          SizedBox(height: 40),

          _buildPopularSection(),

          SizedBox(height: 40),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),

      actions: [
        GestureDetector(
          onTap: () => {},
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withValues(alpha: 0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),

      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search Pancake',
          hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
          suffixIcon: SizedBox(
            width: 75,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Color(0xffDDDADA),
                    thickness: 1.5,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset('assets/icons/filter.svg'),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              CategoryModel cat = categories[index];
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: cat.boxColor.withValues(alpha: .3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          cat.iconPath,
                        ),
                      ),
                    ),
                    Text(
                      cat.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDietsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: diets[index].boxColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(diets[index].iconPath),
                    Column(
                      children: [
                        Text(
                          diets[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                          style: const TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            diets[index].viewIsSelected
                                ? const Color(0xff9DCEFF)
                                : Colors.transparent,
                            diets[index].viewIsSelected
                                ? const Color(0xff92A3FD)
                                : Colors.transparent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                            color: diets[index].viewIsSelected
                                ? Colors.white
                                : const Color(0xffC58BF2),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        ),
      ],
    );
  }

  Widget _buildPopularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Popular',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ListView.separated(
          itemCount: popularDiets.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            height: 25,
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                color: popularDiets[index].boxIsSelected
                    ? Colors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                boxShadow: popularDiets[index].boxIsSelected
                    ? [
                        BoxShadow(
                          color: const Color(
                            0xff1D1617,
                          ).withValues(alpha: .07),
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0,
                        ),
                      ]
                    : [],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    popularDiets[index].iconPath,
                    width: 65,
                    height: 65,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popularDiets[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}',
                        style: const TextStyle(
                          color: Color(0xff7B6F72),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/button.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
