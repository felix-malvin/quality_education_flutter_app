import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar2.dart';
import 'package:quality_education_app/commons/color.dart';
import 'package:quality_education_app/data/news_data.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final List<String> filters = ['All', 'Latest', 'Popular', 'Hot'];
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final headlineNews = news.first;
    final filteredNews =
        selectedFilter == 'All'
            ? news.where((n) => n != headlineNews).toList()
            : news
                .where((n) => n != headlineNews && n.tag == selectedFilter)
                .toList();

    return Scaffold(
      appBar: CustomAppBar(title: 'Discover'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                _buildContentHeader('News', () {}),
                _buildHeadline(headlineNews),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    filters.map((tag) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: RawChip(
                          label: Text(tag, style: TextStyle(fontSize: 15)),
                          selected: selectedFilter == tag,
                          onSelected: (_) {
                            setState(() {
                              selectedFilter = tag;
                            });
                          },
                          backgroundColor: Colors.grey[200],
                          selectedColor: CustomColors.primary,
                          labelStyle: TextStyle(
                            color:
                                selectedFilter == tag
                                    ? Colors.white
                                    : Colors.black,
                          ),
                          showCheckmark: false,
                          side: BorderSide.none,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNews.length,
              itemBuilder: (context, index) {
                final item = filteredNews[index];
                return _buildNewsItem(item);
              },
            ),
          ),
        ],
      ),
    );
  }
}
