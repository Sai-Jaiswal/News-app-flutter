import 'package:flutter/material.dart';
import 'package:flutter_practice_apps/widgets/news_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final followingChips = ["All", "Business", "Crypto", "Gaming", "Technology"];

  String selectedChip = "All";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Headline",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: const Color.fromARGB(220, 26, 219, 213),
                            ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "10 April 2023",
                        style: TextStyle(color: Colors.white60),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24, width: 1),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Stack(
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          size: 28,
                        ),
                        Positioned(
                          right: 5,
                          top: 5,
                          child: Badge(backgroundColor: Colors.red),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                            "https://www.middleweb.com/wp-content/uploads/2017/08/breaking-news-blue-600.jpg"),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            "Trending",
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Biggest Breaking News!! Some Happened in the north west",
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Following",
                      style: TextStyle(fontFamily: "Arial", fontSize: 16)),
                  Text(
                    "View more",
                    style: TextStyle(
                        color: Color.fromARGB(220, 26, 219, 213), fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: followingChips.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedChip = followingChips[index];
                          });
                        },
                        child: Chip(
                          label: Text(
                            followingChips[index],
                            style: TextStyle(
                                color: selectedChip == followingChips[index]
                                    ? Colors.black
                                    : const Color.fromARGB(255, 201, 201, 201),
                                fontSize: 12),
                          ),
                          backgroundColor: selectedChip == followingChips[index]
                              ? Colors.white
                              : const Color(0xFF192434),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // const NewsTile(),
              // const NewsTile(),
              // const NewsTile(),
              // const NewsTile(),
              const Text(
                "No Following Yet",
                style: TextStyle(
                    color: Color.fromARGB(255, 182, 181, 181),
                    fontFamily: "Arial"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
