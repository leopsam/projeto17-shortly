import { Router } from "express"
import { createUser } from "../controllers/users.controllers.js"
import { validateSchema } from "../middlewares/validateSchema.middleware.js"
import { signupSchema } from "../schemas/signup.model.js"

const router = Router()

router.post("/signup", validateSchema(signupSchema), createUser)

export default router