from Logic import Logic
from userobj import UserObj


class UserLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = [
            "id",
            "user",
            "password",
            "role",
            "email",
            "num_tarjeta",
            "fecha_venc",
            "direccion",
        ]

    def getUserData(self, user):
        database = self.get_databaseXObj()
        sql = f"select * from lacocinadeapolo.usuarios where usuario='{user}';"
        data = database.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        if len(data) > 0:
            data_dic = data[0]
            userObj = UserObj(
                data_dic["id"],
                data_dic["user"],
                data_dic["password"],
                data_dic["role"],
                data_dic["email"],
                data_dic["num_tarjeta"],
                data_dic["fecha_venc"],
                data_dic["direccion"],
            )
            return userObj
        else:
            return None
