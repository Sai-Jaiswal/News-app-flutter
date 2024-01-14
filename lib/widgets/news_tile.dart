import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String newsImg;
  final String link;
  final String publishedAt;

  const NewsTile({
    super.key,
    this.title = "Why you can't have legs in virtual reality (yet)",
    this.newsImg =
        "https://t4.ftcdn.net/jpg/01/59/79/97/360_F_159799700_QKV4dPk4Y5IHb5wFMk4zbRspCNhya2uq.jpg",
    this.link = "https://google.com",
    this.publishedAt = "2023-12-20 at 8:57",
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/webviewpage", arguments: {"link": link});
      },
      borderRadius: BorderRadius.circular(10),
      splashColor: const Color.fromARGB(177, 52, 52, 52),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Technology",
                    style: TextStyle(
                      color: Color.fromARGB(255, 201, 201, 201),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        size: 18,
                        color: Color(0xFF8B929F),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        publishedAt,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: const Color(0xFF8B929F)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(newsImg, fit: BoxFit.cover),
              ),
            )
          ],
        ),
      ),
    );
  }
}
