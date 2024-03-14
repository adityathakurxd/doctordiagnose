const { GoogleGenerativeAI } = require('@google/generative-ai')
const express = require('express')
const cors = require('cors')

require('dotenv').config()

const port = process.env.PORT || 3000

const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY)
const model = genAI.getGenerativeModel({ model: 'gemini-pro' })

const allowedOrigin = process.env.ALLOWED_ORIGIN || 'http://127.0.0.1:5000'

const app = express()
app.use(function (req, res, next) {
  res.header('Access-Control-Allow-Origin', allowedOrigin)
  res.header('Access-Control-Allow-Methods', 'GET,PUT,PATCH,POST,DELETE')
  res.header(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content-Type, Accept'
  )
  next()
})
app.use(express.json())

app.post('/generate', async (req, res) => {
  const history = req.body.history
  const message = req.body.message

  console.log('history:', history)
  console.log('message:', message)

  if (!history) {
    return res.status(400).send('history is required')
  }
  if (!message) {
    return res.status(400).send('message is required')
  }

  const chat = await model.startChat({ history: history })

  try {
    const result = await chat.sendMessage(message)
    const response = await result.response
    const text = response.text()
    res.send({
      success: true,
      response: text
    })
  } catch (e) {
    res.send({
      success: false,
      error: e.message
    })
  }
})

app.listen(port, () => {
  console.log(`Server is running on port ${port}`)
})
