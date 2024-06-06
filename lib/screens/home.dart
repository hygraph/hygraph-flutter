import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hygraph_flutter/components/news_row.dart';
import 'package:hygraph_flutter/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String getNewsQuery = """
    query MyQuery {
      trendings {
        newsCollection {
          ... on NewsRow {
            id
            preview
            title
            coverImage {
              createdAt
              fileName
              url
            }
          }
        }
      }
    }
    """;

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Trending News', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Query(
        options: QueryOptions(document: gql(getNewsQuery)),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.isLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          }
          List<News>? newsList =
              (result.data?["trendings"][0]["newsCollection"] as List<dynamic>)
                  .map((item) => News.fromJson(item))
                  .toList();
          if (newsList.isEmpty) {
            return const Text('No news yet!');
          }
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final news = newsList[index];
              return InkWell(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: .5, color: Colors.grey),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NewsRow(
                            url: news.coverImage.url,
                            preview: news.preview,
                            title: news.title,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
