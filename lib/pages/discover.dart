import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar2.dart';
import 'package:quality_education_app/commons/color.dart';
import 'package:quality_education_app/data/news_data.dart';
import 'package:quality_education_app/widgets/widget_support/textstyle.dart';
import 'package:quality_education_app/models/news_model.dart';

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
      backgroundColor: CustomColors.white,
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

  Widget _buildContentHeader(String title, VoidCallback onTap) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: AppWidget.HomeSubtitle()),
          InkWell(
            onTap: onTap,
            child: Text('See all', style: AppWidget.SecondaryText()),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadline(News news) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            news.image,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Text(
          news.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          '${news.author} • ${news.time}',
          style: TextStyle(fontSize: 14, color: CustomColors.primary),
        ),
      ],
    );
  }

  Widget _buildNewsItem(News news) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 30,
              right: 30,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    news.image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${news.author} • ${news.time}',
                        style: TextStyle(
                          fontSize: 12,
                          color: CustomColors.primary,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Divider(color: Colors.grey[300]),
        ),
      ],
    );
  }
}
