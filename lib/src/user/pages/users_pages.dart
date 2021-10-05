import 'package:flutter/material.dart';
import 'package:weather_app/src/user/models/user.dart';
import 'package:weather_app/src/user/pages/user_details.dart';
import 'package:weather_app/src/user/services/user_service.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late Future<List<User>> _usersFuture;
  late UserService _userService;

  @override
  void initState() {
    _userService = UserService();
    _usersFuture = _userService.fetchAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: FutureBuilder<List<User>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else {
              List<User> users = snapshot.data!;
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  User user = users[index];
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return UserDetails(
                              user: user,
                            );
                          },
                        ),
                      );
                    },
                    title: Text("${user.name}"),
                    subtitle: Row(
                      children: [
                        Text("${user.username}"),
                        Text(" - "),
                        Text("${user.website}"),
                      ],
                    ),
                  );
                },
              );
            }
          }

          return Container();
        },
      ),
    );
  }
}
