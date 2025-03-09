import { Router } from "express";
import { getAlumnos } from "../controllers/Alumno.controller.js";



const router = Router();

router.get('/alumnos', getAlumnos);


export default router;