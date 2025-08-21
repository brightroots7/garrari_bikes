import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/categories/categories_bloc.dart';
import '../../blocs/categories/categories_event.dart';
import '../../blocs/categories/categories_state.dart';
import 'categoriesItemPage.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryBloc()..add(LoadCategories()),
      child: Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(title:  Text('Categories',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 18),),centerTitle: true,backgroundColor: Colors.white,),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoaded) {
              final categories = state.categories;

              return GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CategoryTile(
                    name: category.name,
                    imagePath: category.imagePath,
                    onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryItemsPage(categoryName: category.name),
                          ),
                        );

                    },
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}


class CategoryTile extends StatelessWidget {
  final String name;
  final String imagePath;
  final VoidCallback onTap;

  const CategoryTile({
    super.key,
    required this.name,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 0.4,
        margin: const EdgeInsets.all(8),
        child: Container(color: Colors.white,
          height: 120,
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 80),
              const SizedBox(height: 10),
              Text(name, style:  GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
