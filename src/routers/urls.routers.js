import { Router } from "express"
import { shorten, shortenId, shortenOpen } from "../controllers/urls.controllers.js"
import { validateSchema } from "../middlewares/validateSchema.middleware.js"
import { urlSchema } from "../schemas/url.model.js"
import { validateToken } from "../middlewares/validateToken.middleware.js"

const router = Router()

router.post("/urls/shorten", validateSchema(urlSchema), validateToken, shorten)
router.get("/urls/:id", shortenId)
router.get("/urls/open/:shortUrl", shortenOpen)


export default router