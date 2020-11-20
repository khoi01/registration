const express = require('express')
const app = express()
app.use(express.json())
app.use(express.urlencoded({extended: true}))

var database = [
    {no:1,name:null}
];

app.get('/getData', function (req, res) {
  
  var Status = {
    code: null,
    message: null,
    data: null,
  }

  Status.code = "200";
  Status.message = "sucess";
  Status.data = database;

  setTimeout(function(){  res.send(Status);},1000);
})

app.post('/postData',function(req,res){

  var Status = {
    code: null,
    message: null,
    data: null,
  }

    var count = database.length+1;
    var name = req.body.name;

    database.push({no:count,name:name});

    Status.code = "200";
    Status.message = "successfully inserted..";


    setTimeout(function(){res.send(Status);},1000);

    

  })

//environment variable
//PORT
const port = process.env.PORT || 3000
app.listen(port,()=> console.log(`Listening on port ${port}...`));