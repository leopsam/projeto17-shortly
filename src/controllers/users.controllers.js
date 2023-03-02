import { db } from '../database/database.connection.js'
import bcrypt from 'bcrypt'
import { v4 as uuidV4 } from 'uuid'

export async function createUser(req, res) {
  console.log("rodou createUser (criação de usuario)") //deletar linha depois
  const { name, email, password} = req.body  
  const passwordHash = bcrypt.hashSync(password, 10);

  const userExist = await db.query(`SELECT * FROM users`)
  userExist.rows.map((u)=>{
    if(u.email === email){
      return res.sendStatus(409)
    }
  })

  try {
    await db.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`, [name, email, passwordHash])
    res.sendStatus(201)
  } catch (error) {
    res.send(error.message).status(422)
  }
}