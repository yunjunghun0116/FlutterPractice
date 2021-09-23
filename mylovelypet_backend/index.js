//mylovelypet@naver.com a1041714 mongodb
//connect username : mylovelypet password : a1041714
const express = require("express");
const router = express.Router();
const multer = require("multer");
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

//이미지 저장관련 코드
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads/");
  },
  filename: function (req, file, cb) {
    cb(null, `${Date.now()}_${file.originalname}`);
  },
});

var upload = multer({ storage: storage }).single("file");
router.post("/image", (req, res) => {
  //가져온이미지저장
  upload(req, res, (err) => {
    if (err) {
      return res.json({ success: false, err });
    }
    return res.json({
      success: true,
      filePath: res.req.file.path,
      fileName: res.req.file.filename,
    });
  });
});
