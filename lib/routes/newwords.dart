import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';
import 'package:rabbitplanm/common/site_api.dart';
import 'package:rabbitplanm/models/newwords.dart';
import 'package:rabbitplanm/models/wordgroup.dart';
import 'package:rabbitplanm/widgets/repo_item.dart';
import 'package:rabbitplanm/models/groupnwords.dart';

class GroupNewPage extends StatelessWidget {
  GroupNewPage({
    Key key,
    @required this.groupid,  // 接收一个text参数
  }) : super(key: key);
  final int groupid;
  //Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: FutureBuilder(
          future: Git.dio.get("rabbitapi/nwordsgroup/"+groupid.toString()+"/"),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //请求完成
            if (snapshot.connectionState == ConnectionState.done) {
              var gpwords = Groupnwords.fromJson(snapshot.data);
              var wordli = gpwords.groupwords;
              //Response response = gpwords.groupwords;
              //发生错误
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              //请求成功，通过项目信息构建用于显示项目名称的ListView
              return ListView.builder(
                  itemCount: wordli.length,
                  itemExtent: 50.0, //强制高度为50.0
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: wordli.fnewword.fword);
                  }
              );
            }
            //请求未完成时弹出loading
            return CircularProgressIndicator();
          }
      ),
    );
  }

  /*
  Widget getItem(context, index) {
    return ListTile(
      title: Text(listData[index]['title']),
      subtitle: Text(listData[index]['author']),
      leading: Image.network(listData[index]['imageUrl']),
    );
  }
  */

}


/* onRetrieveData: (int page, List<Newwords> items, bool refresh) async {
        var data = await Git(context).getGroupWords(
          groupid: groupid,
          refresh: refresh,
          queryParameters: {
            'page': page,
            'page_size': 20,
          },
        );
        //把请求到的新数据添加到items中
        var group = data.wgroup;
        var groupwords = data.groupwords;
        print(group);
        print(groupwords);
        //items.addAll(groupwords);
      },
      itemBuilder: (List list, int index, BuildContext ctx) {
        // 项目信息列表项
        return RepoItem(list[index]);
      }, */