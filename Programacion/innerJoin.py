import pymysql
conexion = pymysql.connect(host='localhost', user='root', password='---', db='peluqueria')
try:
    with conexion.cursor() as cursor:
        sql = """
        SELECT * FROM servicio inner JOIN productos ON servicio.idServicio = productos.idServicio"""
        cursor.execute(sql)                
        for row in cursor.fetchall():
            print(row)
finally:
    conexion.close()