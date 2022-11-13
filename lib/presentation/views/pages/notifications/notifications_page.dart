import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/colors/app_colors.dart';

class NotificationsPage extends StatelessWidget {

  static const routeName = "Notification";
  const NotificationsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: AppColors.black),
        title: const Text('Mis Notificaciones',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.transparent
      ),
      body: ListView.builder(
        itemCount: 70,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red
                ),
              ),
              title: Text('Titulo'),
              subtitle: Text('Info data etc'),
              trailing: Icon(Icons.message)
            ),
          );
        },
      ),
    );
  }
}