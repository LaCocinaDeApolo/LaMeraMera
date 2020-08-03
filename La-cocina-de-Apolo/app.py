from flask import Flask, render_template, request, redirect, session
from database import Database
from databaseRecetas import DatabaseRecetas
from databaseIngredientes import DatabaseIngredientes
from MethodUtil import MethodUtil
from werkzeug.security import generate_password_hash, check_password_hash
from userlogic import UserLogic
from userobj import UserObj

app = Flask(__name__)
app.config["SECRET_KEY"] = "mysecretkey"


@app.route("/")
def index():

    return render_template("index.html")


@app.route("/recetas", methods=["GET", "POST"])
def recetas():
    databaseReceta = DatabaseRecetas()
    if request.method == "GET":
        dataRecetas = databaseReceta.getAllRecetas()
        print(dataRecetas)
        return render_template("recetas.html", dataRecetas=dataRecetas)
    else:
        print(request.form)
        receta = request.form["receta"]
        descripcion = request.form["descripcion"]
        tipo = request.form["tipo"]
        video = request.form["video"]
        rows = databaseReceta.insertRecetas(receta, descripcion, tipo, video)
        print(f"{rows} rows affected")
        return redirect("/recetas")


@app.route("/ingredientes", methods=["GET", "POST"])
def ingredientes():
    databaseIngredientes = DatabaseIngredientes()
    if request.method == "GET":
        dataIngredientes = databaseIngredientes.getAllIngredientes()

        return render_template("ingredientes.html", dataIngredientes=dataIngredientes)
    else:
        print(request.form)
        ingredientes = request.form["ingrediente"]
        descripcion = request.form["descripcion"]
        precio = request.form["precio"]
        rows = databaseIngredientes.insertIngredientes(
            ingredientes, descripcion, precio
        )
        print(f"{rows} rows affected")
        return redirect("/ingredientes")


@app.route("/carreta")
def carreta():
    return render_template("shopping.html")


@app.route("/registro", methods=["GET", "POST"])
def course():
    database = Database()
    if request.method == "GET":
        # codigo que toma el id y lo imprime
        # form a la tabla y ponganle el method="GET"
        # ocupar un input type=hidden para el id
        data = database.getAllCourse()
        print(data)
        return render_template("registro.html", courses=data)
    else:
        print(request.form)
        name = request.form["name"]
        contrasenna = request.form["contrasenna"]
        correo = request.form["correo"]
        rows = database.insertCourse(name, contrasenna, correo)
        print(f"{rows} rows affected")
        return redirect("/")


@app.route("/loginform", methods=MethodUtil.list_ALL())
def loginform():
    if request.method == "GET":
        return render_template("login.html", message="")

    if request.method == "POST":
        user = request.form["username"]
        password = request.form["password"]
        print(password)
        print(generate_password_hash(password))
        print(
            check_password_hash(
                "pbkdf2:sha256:150000$Q5PULnGV$bdc51198ad18432f00fea6a5cb59bec4d7977cb28d3e7ef575bab3b93bfa9628",
                "12345",
            )
        )
        logic = UserLogic()
        userdata = logic.getUserData(user)

        session["user"] = userdata.user
        session["role"] = userdata.role
        if userdata is not None:
            if userdata.password == password:
                if userdata.role == "admin":
                    return render_template("index.html", userdata=userdata)
                else:
                    return render_template("index.html", userdata=userdata)
            else:
                return render_template("login.html", message="hubo error")
        else:
            return render_template("login.html", message="hubo error")


@app.route("/logout")
def logout():
    session.pop("user", None)
    session.pop("role", None)
    return render_template("index.html")


@app.route("/profile")
def profile():

    return render_template("profile.html")


if __name__ == "__main__":
    app.run(debug=True)
