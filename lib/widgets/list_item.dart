import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabbitplanm/models/wordgroup.dart';
import 'package:rabbitplanm/routes/newwords.dart';


class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class RepoItem extends StatefulWidget {
  RepoItem(this.repo) : super(key: ValueKey(repo.fid));
  final Wordgroup repo;
  @override
  _RepoItemState createState() => _RepoItemState();
}

class _RepoItemState extends State<RepoItem> {
  @override
  Widget build(BuildContext context) {
    var subtitle;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Material(
        color: Colors.white,
        shape: BorderDirectional(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: .5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                //dense: true,
                title: Text(
                  widget.repo.fgroupnum,
                  //textScaleFactor: 1,
                ),
                subtitle: Text(widget.repo.fstatename ?? "空的"),
                //trailing: Text(widget.repo.fstateid ?? ""),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          new GroupNewPage(groupid: widget.repo.fid,))
                  );
                },
              ),
              // 构建项目标题和简介
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.repo.flan
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}