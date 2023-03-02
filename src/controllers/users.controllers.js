import { db } from '../database/database.connection.js'

export async function createUser(req, res) {
  const { name, email, password, confirmPassword } = req.body
  const passwordHash = bcrypt.hashSync(user.senha, 18);

  //if (cpf.length != 11) return res.sendStatus(400)
  //if (isNaN(Number(cpf))) return res.sendStatus(400)

  //const cpfsClientes = await db.query("SELECT cpf FROM customers")
  //const arrayCpfs = cpfsClientes.rows
 // arrayCpfs.map((c) => {
    //if (c.cpf === cpf) return res.sendStatus(409)
  //})

  try {   
    await db.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`, [name, email, password])
    res.sendStatus(201)
  } catch (error) {
    res.send(error.message).status(422)
  }
}



export async function cadastro(req, res) {
    const user = req.body;
    const passwordHash = bcrypt.hashSync(user.senha, 10);
  
    try {
      await db.collection("users").insertOne({ name: user.nome, email: user.email, password: passwordHash, avatar: user.avatar, type: "user" });
      return res.sendStatus(201);

    } catch (err) {
      return res.status(500).send(err.message);
    }
}
/*
export async function buscarCliente(req, res) {
    try {
      const cliente = await db.query("SELECT * FROM customers")
      res.send(cliente.rows)
    } catch (error) {
      res.status(500).send(error.message)
    }
}

export async function buscarClientePorId(req, res) {
  const { id } = req.params

  try {
    const cliente = await db.query(`SELECT * FROM customers WHERE id = $1;`, [id])

    if (cliente.rows.length === 0){
      return res.sendStatus(404)
    } 
    let data = new Date(cliente.rows[0].birthday);
    let dataFormatada = (data.getFullYear() + "-" + ((data.getMonth() + 1)) + "-" + (data.getDate() ))             
    
    let arrayClient = [
        {
          id: cliente.rows[0].id, 
          name: cliente.rows[0].name,
          phone: cliente.rows[0].phone, 
          cpf: cliente.rows[0].cpf, 
          birthday: dataFormatada
        }
    ]

    res.status(200).send(arrayClient[0])
  } catch (error) {
    res.status(404).send(error.message)
  }
}

export async function atualizarCliente(req, res) {
  const { id } = req.params
  const { name, phone, cpf, birthday } = req.body

  if (cpf.length != 11) return res.sendStatus(400)
  if (isNaN(Number(cpf))) return res.sendStatus(400)

  const clienteCpf = await db.query(`SELECT * FROM customers WHERE id = $1;`, [id])
  const cpfsClientes = await db.query("SELECT cpf FROM customers")
  const arrayCpfs = cpfsClientes.rows

  arrayCpfs.map((c) => {
    if (c.cpf === cpf && cpf != clienteCpf.rows[0].cpf) return res.sendStatus(409)
   })  

  try {
    const cliente = await db.query(`UPDATE Customers SET name = '${name}', phone = '${phone}', cpf = '${cpf}', birthday = '${birthday}' WHERE id = $1;`, [id])
    if (!cliente) return res.sendStatus(404)

    res.status(200).send(cliente.rows[0])
  } catch (error) {
    res.status(500).send(error.message)
  }
}
*/