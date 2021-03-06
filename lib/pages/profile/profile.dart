import 'package:badges/badges.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import 'package:gitme_reborn/components/profile/profile_info.dart';
import 'package:gitme_reborn/pages/repo.dart';
import 'package:gitme_reborn/pages/profile/star.dart';
import 'package:gitme_reborn/pages/profile/follow.dart';
import 'package:gitme_reborn/stores/account.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var account = Provider.of<AccountModel>(context);

    return DefaultTabController(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 16.0),
                      ProfileInfo(
                        avatarUrl: account.profile.avatarUrl,
                        name: account.profile.name,
                        bio: account.profile.bio,
                        location: account.profile.location,
                      ),
                    ],
                  ),
                ),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: <Widget>[
                    BadgeTab(
                      labelText: "Repos",
                      badgeText: "${account.profile.publicReposCount}",
                    ),
                    BadgeTab(labelText: "Stars"),
                    BadgeTab(
                      labelText: "Followers",
                      badgeText: "${account.profile.followersCount}",
                    ),
                    BadgeTab(
                      labelText: "Following",
                      badgeText: "${account.profile.followingCount}",
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              RepoPage(),
              StarRepoPage(),
              FollowerPage(),
              FollowingPage(),
            ],
          ),
        ),
      ),
      length: 4,
    );
  }
}

class BadgeTab extends StatelessWidget {
  const BadgeTab({
    Key key,
    @required this.labelText,
    this.badgeText,
  }) : super(key: key);

  final String labelText;
  final String badgeText;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(labelText),
          if (badgeText != null) SizedBox(width: 4.0),
          if (badgeText != null)
            Badge(
              badgeColor: Colors.white,
              shape: BadgeShape.square,
              padding: EdgeInsets.symmetric(horizontal: 5),
              borderRadius: 20,
              badgeContent:
                  Text(badgeText, style: Theme.of(context).textTheme.body2),
            ),
        ],
      ),
    );
  }
}
