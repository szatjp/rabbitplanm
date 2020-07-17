import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';
import 'package:rabbitplanm/common/site_api.dart';
import 'package:rabbitplanm/models/wordgroup.dart';
import 'package:rabbitplanm/widgets/repo_item.dart';

class StudyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfiniteListView<Wordgroup>(
      onRetrieveData: (int page, List<Wordgroup> items, bool refresh) async {
        var data = await Git(context).getWgroup(
          refresh: refresh,
          queryParameters: {
            'page': page,
            'page_size': 20,
          },
        );
        //把请求到的新数据添加到items中
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