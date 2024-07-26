import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../utils/constants/app_paddings.dart';
import '../../../utils/extensions/navigation_extension.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/profile_photo.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where(
              'userId',
              isNotEqualTo: FirebaseAuth.instance.currentUser!.uid,
            )
            .snapshots(),
        builder: (_, snapshot) {
          final docs = snapshot.data?.docs ?? [];
          return Skeletonizer(
            enabled: !snapshot.hasData,
            child: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, i) {
                final user = docs[i].data();
                return ListTile(
                  onTap: () => context.to(Pager.chat(user)),
                  leading: ProfilePhoto(url: user['photo']),
                  title: Text('${user['fullname']}'),
                  subtitle: Text('${user['about']}'),
                  contentPadding: AppPaddings.a10,
                  horizontalTitleGap: 0,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
