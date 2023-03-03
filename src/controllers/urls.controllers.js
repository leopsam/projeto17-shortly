import { db } from '../database/database.connection.js'
import { nanoid } from 'nanoid'

export async function shorten(req, res) {
  console.log("rodou shorten (criando links curtos)") //deletar linha depois

  const { url } = req.body 
  const session = res.locals.sessao //erro
  const shortUrl = nanoid()  

  if (!session.rows[0]) return res.status(401).send("Você não está logado!") //erro

  try {
    await db.query(`INSERT INTO short (url, "shortUrl", "userId") VALUES ($1, $2, $3);`, [url, shortUrl, session.rows[0].userId])

    const short = await db.query(`SELECT id, "shortUrl" FROM short WHERE "shortUrl" = $1;`, [shortUrl])
    res.status(201).send(short.rows[0])

  } catch (error) {
    res.status(422).send(error.message)
  }
}

export async function shortenId(req, res) {
  console.log("rodou shortenId (procurando links curtos por ID)") //deletar linha depois
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

export async function shortenOpen(req, res) {
  console.log("rodou shorten (abrir links curto)") //deletar linha depois 
  const { shortUrl } = req.params;
  let soma = 0
  
  try {
    const urlValid = await db.query(`SELECT url FROM short WHERE "shortUrl" = $1;`, [shortUrl]) 

    if(urlValid.rows[0].url){
      const quant = await db.query(`SELECT * FROM short WHERE "shortUrl" = $1;`, [shortUrl]) 
      
      await db.query(`UPDATE short SET "visitCount" = ${quant.rows[0].visitCount += 1} WHERE "shortUrl" = $1;`, [shortUrl])

      const quantVisitUser = await db.query(`SELECT * FROM short WHERE "userId" = $1;`, [quant.rows[0].userId])
      
      quantVisitUser.rows.map((v) => soma += v.visitCount)

      await db.query(`UPDATE users SET "visitCount" = ${soma} WHERE "id" = $1;`, [quant.rows[0].userId])
      
      res.redirect(302, urlValid.rows[0].url);
    }

  } catch (error) {
    res.status(404).send(error.message)
  }
}

export async function shortenDelete(req, res) {
  console.log("rodou shortenDelete (deleta links curto)") //deletar linha depois 
  const { id } = req.params;  
  
  const session = res.locals.sessao
  if (!session.rows[0]) return res.status(401).send("Você não está logado!")

  try {
    const urlValid = await db.query(`SELECT * FROM short WHERE "id" = $1;`, [id])    

    if(urlValid.rows[0].userId != session.rows[0].userId) return res.status(401).send("Não pertence a esse usuario")
    if(!urlValid.rows[0]) return res.status(404).send(error.message)

    await db.query(`DELETE FROM short WHERE "id" = $1;`, [id]) 
    res.status(204).send("deletado")

  } catch (error) {
    res.status(404).send(error.message)
  }
}

