import 'package:flutter/material.dart';
import 'package:weather_app/src/user/models/user.dart';
import 'package:weather_app/src/user/services/user_service.dart';

class UserDetails extends StatefulWidget {
  final User user;
  const UserDetails({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  late UserService _userService;
  late Future<User> _userFuture;

  @override
  void initState() {
    _userService = UserService();
    _userFuture = _userService.fetchUserDetails(widget.user.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.user.name}"),
      ),
      body: FutureBuilder<User>(
        future: _userFuture,
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
              User user = snapshot.data!;
              return Container(
                child: Column(
                  children: [
                    Text("${user.address.city}"),
                  ],
                ),
              );
            }
          }

          return Container();
        },
      ),
    );
  }
}
