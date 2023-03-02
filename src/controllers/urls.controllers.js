import { db } from '../database/database.connection.js'
import bcrypt from 'bcrypt'
import { v4 as uuidV4 } from 'uuid'

export async function shorten(req, res) {
  console.log("rodou shorten (criando links curtos)") //deletar linha depois
}