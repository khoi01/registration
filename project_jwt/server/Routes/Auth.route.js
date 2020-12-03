const express = require('express')
const router = express.Router()


router.post('/register',async(req,res,next)=>{
    res.send("register route")
})

router.post('/login',async(req,res,next)=>{
    res.send("login route")
})

router.delete('/logout',async(req,res,next)=>{
    res.send("logout route")
})

router.delete('/refresh-token',async(res,res,next)=>{
    res.secure("refresh token route")
})



module.exports = router