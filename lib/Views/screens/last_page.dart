import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_understanding/Model/page2+cpi_calling.dart';
import 'package:riverpod_understanding/Views/atoms/loading.dart';
import 'package:riverpod_understanding/Views/inprofile_images/last_page_inprofile_images.dart';
import 'package:riverpod_understanding/Views/molecule/customButtom.dart';
import 'package:riverpod_understanding/Views/organism/card_page.dart';
import 'package:riverpod_understanding/constants/constants.dart';
import 'package:riverpod_understanding/shimmer.dart';

class LastPage extends StatelessWidget {
  const LastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer(
        builder: (context, ref, child) {
          final nextPage = ref.watch(lastPageProvider);
          return nextPage.when(data: (data) {
            return Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      ref.refresh(lastPageProvider);
                    },
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: nextPage.value!.results!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (nextPage
                                      .value!.results![index].images!.length >
                                  2) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ProfileImagesLastPage(kIndex: index);
                                }));
                              } else {
                                Fluttertoast.showToast(
                                    msg: "No data Exist!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.SNACKBAR,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black54,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            child: ProfileCard(
                                herotage: index.toString(),
                                name: nextPage.value!.results![index].name
                                    .toString(),
                                image: nextPage
                                        .value!.results![index].images!.isEmpty
                                    ? defaultImage
                                    : nextPage.value!.results![index].images![0]
                                        .imageLink
                                        .toString(),
                                age: nextPage.value!.results![index].age
                                    .toString(),
                                rank: nextPage.value!.results![index].rank
                                    .toString(),
                                size: nextPage
                                    .value!.results![index].rawMeasurement
                                    .toString()),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(
                    title: 'Previous',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            );
          }, error: (e, stack) {
            return Center(
              child: Text(e.toString()),
            );
          }, loading: () {
            return const ShimmerEffect();
          });
        },
      ),
    );
  }
}
