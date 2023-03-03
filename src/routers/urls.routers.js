import { Router } from "express"
import { shorten, } from "../controllers/urls.controllers.js"
import { validateSchema } from "../middlewares/validateSchema.middleware.js"
import { urlSchema } from "../schemas/url.model.js"
import { validateToken } from "../middlewares/validateToken.middleware.js"

const router = Router()

router.post("/urls/shorten", validateSchema(urlSchema), /*validateToken,*/ shorten) //erro

export default router