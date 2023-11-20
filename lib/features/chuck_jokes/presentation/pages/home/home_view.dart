import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../presentation.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeState = Modular.get<HomeStateMobx>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Chuck Jokes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.refresh_rounded,
        ),
        onPressed: () {
          homeState.getSelectCategory();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      bottomNavigationBar: Container(
        height: 86,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            bottom: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.share_outlined),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Observer(builder: (context) {
            return Container(
              height: 40,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                itemCount: homeState.listOfCategories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  final category = homeState.listOfCategories[index];
                  return Observer(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: ChoiceChip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        side: const BorderSide(color: Colors.transparent),
                        backgroundColor: Colors.grey.shade300,
                        label: Text(category.category),
                        labelStyle: TextStyle(
                          fontWeight: index == homeState.selectedCategoryIndex
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                        selected: index == homeState.selectedCategoryIndex,
                        onSelected: (value) => homeState.selectCategory(index),
                      ),
                    );
                  });
                },
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                RotationTransition(
                  turns: const AlwaysStoppedAnimation(10 / 360),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    // width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      // color: Colors.lightGreen,
                      gradient: LinearGradient(
                        colors: [
                          Colors.lime.shade300.withOpacity(0.5),
                          Colors.deepOrange.shade100.withOpacity(0.5),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: const [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                RotationTransition(
                  turns: const AlwaysStoppedAnimation(15 / 360),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    // width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      // color: Colors.lightGreen,
                      gradient: LinearGradient(
                        colors: [
                          Colors.lime.shade300.withOpacity(0.5),
                          Colors.deepOrange.shade100.withOpacity(0.5),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: const [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      children: [
                        Observer(builder: (_) {
                          return Text(
                            textAlign: TextAlign.center,
                            homeState.jokeByCategory.value,
                            style: const TextStyle(
                              fontSize: 18,
                              height: 2.3,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
