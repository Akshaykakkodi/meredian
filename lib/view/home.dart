import 'package:flutter/material.dart';
import 'package:meredian/controller/api_controller.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<APiController>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 46,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Image.asset(
                  "assets/images/image1.png",
                  scale: 4,
                ),
                const Spacer(),
                Image.asset(
                  "assets/images/notification.png",
                  scale: 4,
                ),
                const SizedBox(
                  width: 25.4,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                "Social Media Posts",
                style: TextStyle(
                    color: Color(0xff371B34),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  height: 38,
                  decoration: BoxDecoration(
                      color: const Color(0xffFE8235),
                      borderRadius: BorderRadius.circular(9)),
                  child: const Center(
                    child: Text(
                      "Trending",
                      style: TextStyle(
                          color: Color(0xffFBFBFB),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  height: 38,
                  decoration: BoxDecoration(
                      color: const Color(0xffF4F2F1),
                      borderRadius: BorderRadius.circular(9)),
                  child: const Center(
                    child: Text(
                      "Relationship",
                      style: TextStyle(
                          color: Color(0xff8A8A8A),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  height: 38,
                  decoration: BoxDecoration(
                      color: const Color(0xffF4F2F1),
                      borderRadius: BorderRadius.circular(9)),
                  child: const Center(
                    child: Text(
                      "Self Care",
                      style: TextStyle(
                          color: Color(0xff8A8A8A),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                child: Consumer<APiController>(
                  builder: (context, value, child) => value.isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: value.apimodel!.comments.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        Image.asset(
                                          "assets/images/image2.png",
                                          scale: 4,
                                        ),
                                        const SizedBox(
                                          width: 18,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 20,
                                            child: Text(
                                              value.apimodel!.comments[index].body
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 5,
                                              softWrap: true,
                                              textAlign: TextAlign.start,
                                              style:const TextStyle(
                                                  color: Color(0xff371B34),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 75.0, right: 31),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/thumb.png",
                                            scale: 4,
                                          ),
                                        const  SizedBox(
                                            width: 6.67,
                                          ),
                                        const  Text(
                                            "2",
                                            style: TextStyle(
                                                color: Color(0xff8A8A8A),
                                                fontSize: 13.33,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        const  SizedBox(
                                            width: 34.22,
                                          ),
                                          Image.asset(
                                            "assets/images/comment.png",
                                            scale: 4,
                                          ),
                                         const Spacer(),
                                          Image.asset(
                                            "assets/images/share.png",
                                            scale: 4,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
