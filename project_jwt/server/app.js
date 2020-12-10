const express = require('express')
const morgan = require('morgan')
const createError = require('http-errors')
require('dotenv').config()
require('./helpers/init_mongodb');
//import route into this file
const AuthRoute = require('./Routes/Auth.route')


const app = express()

app.use(morgan('dev')); //dev = development

app.get('/',async(req,res,next)=>{
    res.send("Hello from server")
});


//use this route if under /auth
app.use('/auth',AuthRoute);

//handle if request to unknown route (404)
app.use(async(req,res,next)=>{
    const error = new Error("Not Found");
    error.status = 404
    next(error)
})

//handle if request to unknown route (404)
app.use((err,req,res,next)=>{
    res.status(err.status || 500)
    res.send({
        error:{
            status: err.status || 500,
            message: err.message
        }
    })
})

const PORT = process.env.PORT || 3000

app.listen(PORT,()=>{
    console.log(`Server running on port ${PORT}`)
})