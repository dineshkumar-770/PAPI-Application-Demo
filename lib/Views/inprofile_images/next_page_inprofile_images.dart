import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_understanding/Model/page2+cpi_calling.dart';
import 'package:riverpod_understanding/Views/atoms/loading.dart';
import 'package:riverpod_understanding/Views/molecule/customButtom.dart';
import 'package:riverpod_understanding/Views/molecule/image_preview.dart';
import 'package:riverpod_understanding/Views/screens/new_screen.dart';
import 'package:riverpod_understanding/random.dart';

class ProfileImagesNextPage extends StatelessWidget {
  const ProfileImagesNextPage({super.key, required this.kIndex});
  final int kIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer(builder: (context, ref, child) {
        final allImages = ref.watch(nextPageProvider);
        return allImages.when(data: (data) {
          return Column(
            children: [
              InPageProfileScreen(
                name: allImages.value!.results![kIndex].name.toString(),
                coverImage: allImages.value!.results![kIndex].images![4].image
                    .toString(),
                profilepic: allImages.value!.results![kIndex].images![2].image
                    .toString(),
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: allImages.value!.results![1].images!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.75,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Imagepreview(
                                imageLink: allImages.value!.results![kIndex]
                                    .images![index].imageLink
                                    .toString(),
                                index: index.toString());
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: Colors.amber),
                              image: DecorationImage(
                                  image: NetworkImage(allImages.value!
                                      .results![kIndex].images![index].imageLink
                                      .toString()),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    }),
              ),
            ],
          );
        }, error: (e, s) {
          return Text(e.toString());
        }, loading: () {
          return const StaggredDotsLoading();
        });
      }),
    );
  }
}
