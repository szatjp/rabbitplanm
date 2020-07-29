import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';
import 'package:rabbitplanm/common/site_api.dart';
import 'package:rabbitplanm/models/newwords.dart';
import 'package:rabbitplanm/models/wordgroup.dart';
import 'package:rabbitplanm/widgets/repo_item.dart';

class GroupNewPage extends StatelessWidget {
  GroupNewPage({
    Key key,
    @required this.groupid,  // 接收一个text参数
  }) : super(key: key);
  final int groupid;

  @override
  Widget build(BuildContext context) {
    return InfiniteListView<Newwords>(
      onRetrieveData: (int page, List<Newwords> items, bool refresh) async {
        var data = await Git(context).getGroupWords(
          groupid: groupid,
          refresh: refresh,
          queryParameters: {
            'page': page,
            'page_size': 20,
          },
        );
        //把请求到的新数据添加到items中
        var group = new Wordgroup.fromJson(data.data['wgroup']);
        var groupwords = new Newwords.fromJson(data.groupwords);
        print(group);
        print(groupwords);
        items.addAll(data);
        return data.length > 0 && data.length % 20 == 0;
      },
      itemBuilder: (List list, int index, BuildContext ctx) {
        // 项目信息列表项
        return RepoItem(list[index]);
      },
    );
  }
}