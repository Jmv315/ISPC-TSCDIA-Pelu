import pymysql
miConexion = pymysql.connect(host='localhost', user='root', password='---', db='pruebas')
"""
dni = (input("Ingrese el nombre de cliente:"))
try:
    with miConexion.cursor() as cursor:
       sql = "SELECT idCliente FROM cliente WHERE dni = %s"
       cursor.execute(sql, (dni,))
        
       resultado = cursor.fetchall()
       if resultado:
            print(resultado)
       else:
            
            print("No se encontró el dato.")
finally:
    miConexion.close()
    """
try:
    with miConexion.cursor() as cursor:
        
       cursor = miConexion.cursor()
       cursor.execute("SELECT * FROM servicio")
       for columna in cursor.fetchall():
        print(columna)
finally:
    miConexion.close()
