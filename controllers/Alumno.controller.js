import Alumno from '../models/Alumno.model.js';


let hardcodedAlumnos = [new Alumno("Juan", "A01234567"),
    new Alumno("Maria", "A01234568"),
    new Alumno("Carlos", "A01234569"),
    new Alumno("Ana", "A01234570")];


//Return hardcoded Data from Alumnos
export const getAlumnos = (req, res) => {
    return res.json(hardcodedAlumnos);
}


