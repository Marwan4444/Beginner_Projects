import 'package:flutter/material.dart';

import 'package:news_app/widgets/categories_list_view.dart';

import '../widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEDEB),
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: const Color(0xFFC6C6C6),
        title: const Text(
          'NewsCloud',
          style: TextStyle(
            fontFamily: 'LibertinusMono',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
const SliverToBoxAdapter(child: SizedBox(height: 32)),

            const SliverToBoxAdapter(child: CategoriesListView()),

            const SliverToBoxAdapter(child: SizedBox(height: 32)),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFC6C6C6),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: const Text(
                    'last News',
                    style: TextStyle(
                      fontFamily: 'LibertinusMono',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            
            const NewsListViewBuilder(category: 'general'),
          ],
        ),
      ),
    );
  }
}
