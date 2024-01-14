import 'package:flutter/material.dart';
import 'package:flutter_practice_apps/search_news.dart';
import 'package:flutter_practice_apps/widgets/news_tile.dart';

// Logic is kinda typical, you should view step by step to understand the logic

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late Map newsData;
  bool showData = false;
  bool isLoading = false;

  Future<Map> fetchData(newsTitle) async {
    SearchNews searchNews = SearchNews(newsTitle: newsTitle);
    Map data = await searchNews.getNews();
    setState(() {
      newsData = data;
      isLoading = false;
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Explore",
                    style: TextStyle(fontFamily: "Arial", fontSize: 22),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextField(
                        style: Theme.of(context).textTheme.labelMedium,
                        textInputAction: TextInputAction.search,
                        decoration: const InputDecoration(
                          hintText: "Search News",
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) {
                          setState(() {
                            showData = true;
                            isLoading = true;
                          });
                          fetchData(value);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Divider(color: Color.fromARGB(255, 29, 43, 68), thickness: 1),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: showData
                  ? isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : SizedBox(
                          height: MediaQuery.of(context).size.height - 250,
                          child: newsData["articles"].isEmpty
                              ? const Center(child: Text("No Data Found"))
                              : ListView.builder(
                                  itemCount: newsData.length,
                                  itemBuilder: (context, index) {
                                    List newsLst = newsData["articles"];
                                    String publishedAt =
                                        newsLst[index]["publishedAt"];
                                    String pubAtTime = publishedAt
                                        .split("T")[1]
                                        .substring(0, 5);
                                    String pubAtDate =
                                        publishedAt.split("T")[0];
                                    return NewsTile(
                                      title:
                                          newsLst[index]["title"] ?? "MY Title",
                                      newsImg: newsLst[index]["urlToImage"] ??
                                          "https://source.unsplash.com/500x500?news,latest",
                                      link: newsLst[index]["url"] ??
                                          "https://google.com",
                                      publishedAt: "$pubAtDate ; $pubAtTime",
                                    );
                                  },
                                ),
                        )
                  : Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Trending",
                                style: TextStyle(
                                    fontFamily: "Arial", fontSize: 18)),
                            Text(
                              "View more",
                              style: TextStyle(
                                  color: Color.fromARGB(220, 26, 219, 213),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 280,
                          child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 300,
                                padding: const EdgeInsets.all(20),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF182231),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        "https://cdn.wionews.com/sites/default/files/styles/story_page/public/2022/01/27/236556-russia-ukraine-crisis.jpeg",
                                        width: 250,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Ukraine Conflics: Kyiv braces for Russian assault",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "World",
                                          style: TextStyle(
                                              color: Color(0xFF8B929F)),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.watch_later_outlined,
                                              size: 18,
                                              color: Color(0xFF8B929F),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "14hr ago",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: const Color(
                                                          0xFF8B929F)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Latest",
                                style: TextStyle(
                                    fontFamily: "Arial", fontSize: 18)),
                            Row(
                              children: [
                                Icon(
                                  Icons.view_agenda_outlined,
                                  color: Color.fromARGB(162, 26, 219, 213),
                                  size: 22,
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.grid_view_outlined,
                                  size: 22,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const NewsTile(),
                        const NewsTile(),
                        const NewsTile(),
                        const NewsTile(),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
