import mysql.connector


class DatabaseRecetas:
    def __createCursor(self):
        con = mysql.connector.connect(
            host="localhost", user="root", passwd="12345", database="lacocinadeapolo"
        )
        cursor = con.cursor()
        return con, cursor

    def getAllRecetas(self):
        con, cursor = self.__createCursor()
        cursor.execute("SELECT * FROM lacocinadeapolo.recetas;")
        data = cursor.fetchall()
        print(data, con)
        return data

    def insertRecetas(self, receta, descripcion, tipo, video):
        con, cursor = self.__createCursor()
        sql = (
            "insert into lacocinadeapolo.recetas"
            + "(id, nombre, descripcion, Tipo, video) "
            + f"values(0, '{receta}','{descripcion}','{tipo}','{video}');"
        )
        cursor.execute(sql)
        con.commit()
        return cursor.rowcount


class DatabaseX:
    def __init__(self):
        self.__host = "localhost"
        self.__user = "root"
        self.__passwd = "12345"
        self.__database = "lacocinadeapolo"
        self.__connection = self.createConnection()
        self.__cursor = self.createCursor()

    def get_host(self):
        return self.__host

    def get_user(self):
        return self.__user

    def get_password(self):
        return self.__passwd

    def get_database(self):
        return self.__database

    def get_connection(self):
        return self.__connection

    def get_cursor(self):
        return self.__cursor

    def createConnection(self):
        con = mysql.connector.connect(
            host=self.get_host(),
            user=self.get_user(),
            passwd=self.get_password(),
            database=self.get_database(),
        )
        return con

    def createCursor(self):
        con = self.get_connection()
        cursor = None
        if con is not None and con.is_connected():
            cursor = con.cursor()
        else:
            print("app is disconnected from database")
        return cursor

    def executeQuery(self, sql):
        cursor = self.get_cursor()
        con = self.get_connection()
        result = None
        if cursor is not None and con.is_connected():
            cursor.execute(sql)
            result = cursor.fetchall()
        return result

    def executeNonQueryBool(self, sql):
        cursor = self.get_cursor()
        con = self.get_connection()
        hasAffected = False
        if cursor is not None and con.is_connected():
            cursor.execute(sql)
            con.commit()
            rows = cursor.rowcount
            if rows > 0:
                hasAffected = True
        return hasAffected

    def executeNonQueryRows(self, sql):
        cursor = self.get_cursor()
        con = self.get_connection()
        rows = 0
        if cursor is not None and con.is_connected():
            cursor.execute(sql)
            con.commit()
            rows = cursor.rowcount
        return rows
