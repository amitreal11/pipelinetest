import * as dotenv from 'dotenv'
import express from 'express'
import path from 'path'
// const __filename = fileURLToPath(import.meta.url)
// const __dirname = path.dirname(__filename)
// dotenv.config({ path: path.resolve(__dirname, '../.env') })
import bodyParser from 'body-parser'
import cors from 'cors'

dotenv.config()
const app = express()

//========> pm2 restart test1  <=========

app.use(cors())
app.use(bodyParser.urlencoded({extended:false}))
app.use(bodyParser.json())
app.use(express.json())

app.use((req,res,next)=>{
    const time1 =new Date()
    const request = `${req.method}|${req.originalUrl}`  //${JSON.stringify(req.body)}
    res.on('finish' ,()=>{
        console.log(`${request} | ${new Date() - time1}ms |`,res.statusCode, new Date() )
    })
    next()
})


app.get('/', (req, res) => res.send({status: "success",message: "server working"}))

let errorMiddle = (error, req, res, next) => {
 const statusCode = error.statusCode || 400   
 res.status(statusCode).json({status: 'fail', error: error.message})
}

app.use(errorMiddle)

app.listen(process.env.SERVER_PORT,()=>{
    console.log(`By script app listening at PORT=${process.env.SERVER_PORT}`)
})