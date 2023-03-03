import { db } from '../database/database.connection.js'
import { nanoid } from 'nanoid'

export async function shorten(req, res) {
  console.log("rodou shorten (criando links curtos)") //deletar linha depois

  const { url } = req.body 
  const token = res.locals.token //erro
  const shortUrl = nanoid()
  console.log(shortUrl)

  if (!token) return res.status(401).send("Você não está logado!") //erro

  try {
    await db.query(`INSERT INTO short (url, "shortUrl") VALUES ($1, $2);`, [url, shortUrl])

    const short = await db.query(`SELECT id, "shortUrl" FROM short WHERE "shortUrl" = $1;`, [shortUrl])
    res.status(201).send(short.rows[0])    
  } catch (error) {
    res.status(422).send(error.message)
  }
}