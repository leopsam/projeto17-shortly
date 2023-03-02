import {db} from '../database/database.connection.js'

export async function validateToken(req, res, next) {
   
    const { authorization } = req.headers
    const token = authorization?.replace("Bearer ", '')  

  try {
    if (!token) return res.status(401).send("Informe o token!")    
    res.locals.token = token

    console.log("Sucesso no token")

    next()

  } catch (error) {
    res.status(500).send(error)
  }
}