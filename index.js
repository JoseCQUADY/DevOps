import express from 'express';
import alumnoRoute from './routes/Alumno,route.js';
import profesorRoute from './routes/Profesor.route.js';

const app = express();

//Settings
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//Routes
app.use('/', alumnoRoute)
app.use('/', profesorRoute)

//Server listening
app.listen(3000, () => {   
    console.log('Server is running ');
    });

    