import { Router } from "express"
import { createUser, userLogin } from "../controllers/users.controllers.js"
import { validateSchema } from "../middlewares/validateSchema.middleware.js"
import { signupSchema } from "../schemas/signup.model.js"
import { signinSchema } from "../schemas/signin.model.js"

const router = Router()

router.post("/signup", validateSchema(signupSchema), createUser)
router.post("/signin", validateSchema(signinSchema), userLogin)

export default router