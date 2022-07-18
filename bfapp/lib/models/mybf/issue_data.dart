import 'package:app/models/mybf/issue_category.dart';

IssueCategory ask = IssueCategory(
  name: "1:1문의",
  name2: '문의하기'
);

IssueCategory service = IssueCategory(name: '서비스 접수', name2:'접수하기');

IssueCategory move = IssueCategory(name: '이전/설치 신청', name2: '신청하기');

IssueCategory decompose = IssueCategory(name: '분해/조립 신청', name2: '신청하기');

List<IssueCategory> issueList = [
  ask,
  service,
  move,
  decompose
];