import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_understanding/Model/api_calling.dart';
import 'package:riverpod_understanding/Views/atoms/loading.dart';
import 'package:riverpod_understanding/Views/molecule/image_preview.dart';
import 'package:riverpod_understanding/Views/screens/new_screen.dart';

class AllImagesIndividualHomePage extends StatelessWidget {
  const AllImagesIndividualHomePage(
      {super.key, required this.kIndex, required this.inImageIndex});
  final int kIndex;
  final int inImageIndex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Consumer(builder: (context, ref, child) {
          final allImages = ref.watch(apiProvider);
          return allImages.when(data: (data) {
            return inImageIndex <= 1
                ? const Center(
                    child: Text('No Image'),
                  )
                : Column(
                    children: [
                      InPageProfileScreen(
                        name: allImages.value!.results![kIndex].name.toString(),
                        coverImage: allImages.value!.results![kIndex].images![4].image.toString(), 
                        profilepic: allImages.value!.results![kIndex].images![2].image.toString()),
                      Expanded(
                        child: GridView.builder(
                            itemCount:
                                allImages.value!.results![1].images!.length,
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
                                        imageLink: allImages
                                            .value!
                                            .results![kIndex]
                                            .images![index]
                                            .imageLink
                                            .toString(),
                                        index: index.toString());
                                  }));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                  Border.all(width: 0.5, color: Colors.amber),
                                      image: DecorationImage(
                                          image: NetworkImage(allImages
                                              .value!
                                              .results![kIndex]
                                              .images![index]
                                              .imageLink
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
      ),
    );
  }
}
/*ProfileMain(
                          profilepic: allImages.value!.results![kIndex].images![2].image
                              .toString(),
                          coverpic: allImages.value!.results![kIndex].images![4].image
                              .toString(),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                allImages.value!.results![kIndex].name
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(color: Colors.white),
                              ),
                              const Divider(
                                endIndent: 15,
                                indent: 15,
                                thickness: 1,
                                color: Colors.amber,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: CustomButton(
                                            title: 'Bio', onTap: () {})),
                                    Expanded(
                                        child: CustomButton(
                                            title: 'More Pics', onTap: () {}))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ) */
