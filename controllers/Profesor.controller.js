import Profesor from '../models/Profesor.model.js';
import Alumno from '../models/Alumno.model.js';

let hardcodedProfesores = [new Profesor("Pedro", "A01234567"),
    new Profesor("Luis", "A01234568"),
    new Profesor("Roberto", "A01234569"),
    new Profesor("Raul", "A01234570")];

//Return hardcoded data from Alumnos
export const getProfesores = (req, res) => {
    return res.json(hardcodedProfesores);
}


