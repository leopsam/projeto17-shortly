import { db } from '../database/database.connection.js'
import { nanoid } from 'nanoid'

export async function shorten(req, res) {
  console.log("rodou shorten (criando links curtos)") //deletar linha depois

  const { url } = req.body 
  const session = res.locals.sessao //erro
  const shortUrl = nanoid()  

  if (!session.rows[0]) return res.status(401).send("Você não está logado!") //erro

  try {
    await db.query(`INSERT INTO short (url, "shortUrl") VALUES ($1, $2);`, [url, shortUrl])

    const short = await db.query(`SELECT id, "shortUrl" FROM short WHERE "shortUrl" = $1;`, [shortUrl])
    res.status(201).send(short.rows[0])

  } catch (error) {
    res.status(422).send(error.message)
  }
}

export async function shortenId(req, res) {
  console.log("rodou shorten (procurando links curtos por ID)") //deletar linha depois
  const { id } = req.params;

  try {

    const url = await db.query(`SELECT id, "shortUrl", url FROM short WHERE id = $1;`, [id]) 

    if(url.rows[0]){
      res.status(200).send(url.rows[0])
    }else{
      res.status(404).send(error.message)
    }
    

  } catch (error) {
    res.status(404).send(error.message)
  }
}