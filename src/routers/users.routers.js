import { Router } from "express"
import { createUser, teste } from "../controllers/users.controllers.js"
import { validateSchema } from "../middlewares/validateSchema.middleware.js"
import { signupSchema } from "../schemas/signup.model.js"

//import { clienteSchema } from "../schemas/cliente.model.js"

const router = Router()

//router.get("/customers", buscarCliente)
//router.get("/customers/:id", buscarClientePorId)
router.post("/signup", validateSchema(signupSchema), createUser)
//router.put("/customers/:id", validateSchema(clienteSchema)validateSchema(signupSchema), atualizarCliente)

export default router