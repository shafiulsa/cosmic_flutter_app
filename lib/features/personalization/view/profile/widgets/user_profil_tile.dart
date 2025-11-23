import 'package:flutter/material.dart';

class SUserProfileTile extends StatelessWidget {
  const SUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text("Misterious man"),
      subtitle: Text("misteriaas@gmail.com"),
      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit_off_sharp)),
    );
  }
}
