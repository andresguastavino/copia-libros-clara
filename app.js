const express = require("express");
const session = require("express-session");
const methodOverride =  require('method-override'); // Pasar poder usar los métodos PUT y DELETE
const path = require("path");
const router = require("./routes/index");
const productRouter = require("./routes/products");
const userRouter = require("./routes/users");
const productsApiRouter = require('./routes/api/productsApi')
const usersApiRouter = require('./routes/api/usersApi')
const cookies = require('cookie-parser');


const app = express();

const userLoggedMiddleware = require ('./middlewares/userLoggedMiddleware');

const RUTA = 3030;

app.use(session({ secret:'Es un secreto',
resave:false,
saveUninitialized:false }))

app.use(cookies());


app.use(userLoggedMiddleware),
app.use(express.static('public'));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(methodOverride('_method')); // Pasar poder pisar el method="POST" en el formulario por PUT y DELETE



app.set("view engine", "ejs");

app.use("/", router);

app.use("/users", userRouter);

app.use("/products", productRouter);

app.use("/api/products", productsApiRouter);

app.use("/api/users", usersApiRouter);

app.listen(3030, function(){
    console.log("Servidor levantado en puerto 3030")
});