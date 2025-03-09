import { getProfesores } from "../controllers/Profesor.controller.js";
import { Router } from "express";

const router = Router();

router.get('/profesores', getProfesores);

export default router;