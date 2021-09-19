const express = require("express");
const app = express();

//mylovelypet@naver.com a1041714 mongodb

const port = 3000;

//서버를 어디서 열지 -> 서버를 띄울 포트번호, 띄운 후 실행할 코드
app.listen(port, function () {
  console.log(`listening on ${port}`);
});

app.get("/pet", function (req, res) {
  return res.send("thanks");
});
