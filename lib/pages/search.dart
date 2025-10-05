import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quality_education_app/pages/search_result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> recentSearches = [];

  @override
  void initState() {
    super.initState();
    _loadRecentSearches();
  }

  // 🔹 Ambil dari SharedPreferences
  Future<void> _loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      recentSearches = prefs.getStringList('recentSearches') ?? [];
    });
  }

  // 🔹 Simpan ke recent search (max 3)
  Future<void> _saveSearch(String keyword) async {
    final prefs = await SharedPreferences.getInstance();
    recentSearches.remove(keyword);
    recentSearches.insert(0, keyword);
    if (recentSearches.length > 3) {
      recentSearches = recentSearches.sublist(0, 3);
    }
    await prefs.setStringList('recentSearches', recentSearches);
    setState(() {});
  }

  // 🔹 Hapus 1 recent search
  Future<void> _deleteSearch(String keyword) async {
    final prefs = await SharedPreferences.getInstance();
    recentSearches.remove(keyword);
    await prefs.setStringList('recentSearches', recentSearches);
    setState(() {});
  }

  // 🔹 Aksi ketika search ditekan
  void _onSearch(String keyword) {
    if (keyword.isNotEmpty) {
      _saveSearch(keyword);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SearchResultPage(query: keyword)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFFE6E6E6)),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: Color(0xFF2E2E2E),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: SizedBox(
                      height: 43,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: "Search course...",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF0066FF),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xFFF0F1F5),
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                        ),
                        onSubmitted: _onSearch,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Searches",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),

            // 🔹 Recent Search ditampilkan sebagai ListTile
            Expanded(
              child:
                  recentSearches.isEmpty
                      ? const Center(child: Text("No searches yet"))
                      : ListView.builder(
                        padding: const EdgeInsets.only(top: 0),
                        itemCount: recentSearches.length,
                        itemBuilder: (context, index) {
                          final keyword = recentSearches[index];
                          return ListTile(
                            contentPadding: EdgeInsets.only(
                              left: 35,
                              right: 35,
                            ),
                            leading: const Icon(Icons.history),
                            title: Text(keyword),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteSearch(keyword),
                            ),
                            onTap: () => _onSearch(keyword),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}



