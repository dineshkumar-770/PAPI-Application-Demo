import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_understanding/Model/api_calling.dart';
import 'package:riverpod_understanding/Model/page2+cpi_calling.dart';
import 'package:riverpod_understanding/Views/molecule/customButtom.dart';
import 'package:riverpod_understanding/Views/organism/card_page.dart';
import 'package:riverpod_understanding/Views/organism/drawer.dart';
import 'package:riverpod_understanding/Views/screens/next_page.dart';
import 'package:riverpod_understanding/Views/inprofile_images/home_page_inprofile_image.dart';
import 'package:riverpod_understanding/constants/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_understanding/shimmer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const AppDrawer(),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          centerTitle: true,
          title: const Text('Porn Stars'),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.black,
        body: Consumer(builder: (context, ref, child) {
          final pornDataValues = ref.watch(apiProvider);
          final nextPageData = ref.watch(nextPageProvider);
          return pornDataValues.when(data: (data) {
            return Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      ref.read(apiProvider);
                      ref.refresh(apiProvider);
                    },
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: pornDataValues.value!.results!.length,
                        itemBuilder: (context, index) {
                          //print(pornDataValues.value!.next.toString());
                          return GestureDetector(
                            onTap: () {
                              if (pornDataValues.value!.results![index].images!
                                          .length >
                                      2 &&
                                  nextPageData.value != null) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AllImagesIndividualHomePage(
                                    kIndex: index,
                                    inImageIndex: pornDataValues
                                        .value!.results![index].images!.length,
                                  );
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
                                name: pornDataValues.value!.results![index].name
                                    .toString(),
                                image: pornDataValues
                                        .value!.results![index].images!.isEmpty
                                    ? defaultImage
                                    : pornDataValues.value!.results![index]
                                        .images![0].imageLink,
                                age: pornDataValues.value!.results![index].age
                                    .toString(),
                                rank: pornDataValues.value!.results![index].rank
                                    .toString(),
                                size: pornDataValues
                                    .value!.results![index].rawMeasurement
                                    .toString()),
                          );
                        }),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                        title: 'Next',
                        onTap: (() => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const NextPage();
                            })))))
              ],
            );
          }, error: (e, stack) {
            return Text(e.toString());
          }, loading: () {
            return const ShimmerEffect();
          });
        }),
      ),
    );
  }
}
