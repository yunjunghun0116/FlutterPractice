//mylovelypet@naver.com a1041714 mongodb
//connect username : mylovelypet password : a1041714
const express = require("express");
const mongoose = require("mongoose");
const app = express();

const uri =
  "mongodb+srv://mylovelypet:a1041714@mylovelypet.yrrw5.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";
const port = 3000;

mongoose
  .connect(uri, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => console.log("MongoDB Connected..."))
  .catch((err) => console.log(err));

//서버를 어디서 열지 -> 서버를 띄울 포트번호, 띄운 후 실행할 코드
app.listen(port, () => console.log(`listening on ${port}`));

app.get("/pet", function (req, res) {
  return res.send("thanks");
});
