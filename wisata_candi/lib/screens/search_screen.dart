import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Candi> _filterCandis = candiList;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pencarian Candi"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.deepPurple[50],
            ),
            child: const TextField(
              autofocus: false,
              decoration: InputDecoration(
                hintText: "Cari Candi...",
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.deepPurple,
                )),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filterCandis.length,
            itemBuilder: (context, index){
              final candi = _filterCandis[index];
              return Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      width: 100,
                      height: 100,
                      child: ClipRect(
                        child: Image.asset(
                          candi.imageAsset,
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(candi.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(candi.location)
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          ),
        )
      ]),
    );
  }
}
