import pymysql #funcionalidad: administrar los productos que se usaron en los servicios
miConexion = pymysql.connect(host='localhost', user='root', password='---', db='peluqueria')
try:
    with miConexion.cursor() as cursor:
        sql = """
        SELECT * FROM servicio inner JOIN productos ON servicio.idServicio = productos.idServicio"""
        cursor.execute(sql)                
        for row in cursor.fetchall():
            print(row)
finally:
    miConexion.close()
