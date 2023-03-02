import { Router } from "express"
import { createUser } from "../controllers/clientes.controllers.js"
import { validateSchema } from "../middlewares/validateSchema.middleware.js"
import { clienteSchema } from "../schemas/cliente.model.js"

const router = Router()

//router.get("/customers", buscarCliente)
//router.get("/customers/:id", buscarClientePorId)
router.post("/signup", validateSchema(clienteSchema), createUser)
//router.put("/customers/:id", validateSchema(clienteSchema), atualizarCliente)

export default router