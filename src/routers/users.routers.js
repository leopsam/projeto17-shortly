import { Router } from "express"
import { createUser, userLogin, userMe, rankingUsers } from "../controllers/users.controllers.js"
import { validateSchema } from "../middlewares/validateSchema.middleware.js"
import { signupSchema } from "../schemas/signup.model.js"
import { signinSchema } from "../schemas/signin.model.js"
import { validateToken } from "../middlewares/validateToken.middleware.js"


const router = Router()


router.post("/signup", validateSchema(signupSchema), createUser)
router.post("/signin", validateSchema(signinSchema), userLogin)
router.get("/users/me", validateToken, userMe)
router.get("/ranking", rankingUsers)


export default router