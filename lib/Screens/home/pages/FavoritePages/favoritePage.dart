import 'package:eventify/Screens/home/pages/homePage/widget/EventItem.dart';
import 'package:eventify/utils/FireBaseUtils.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
        child: StreamBuilder(
          stream: FireBaseUtils.getEventsStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {

              return Center(
                child: CircularProgressIndicator(),
              );
            }          var event = snapshot.data!.docs.map((e) {
              return e.data();
            }).toList();
            event = event.where((e) {
              return e.isFavorite;
            }).toList();
            if (event.isEmpty) {

              return Center(
                child: Text('Not Found Favorite'),
              );
            }
            return ListView.separated(
              itemBuilder: (context, index) {
                return EventItem(event: event[index]);
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: event.length,
            );
          },
        ),
      ),
    );
  }
}
