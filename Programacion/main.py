import pymysql
miConexion = pymysql.connect(host='localhost', user='root', password='---', db='peluqueria')
cur = miConexion.cursor()
dni=int(input("ingrese el dni del cliente: "))
consulta_cliente = "INSERT INTO registro(dni) VALUES (%s)" ##ingresa el dni para "loguearse"
cur.execute(consulta_cliente, (dni))
try:
    with miConexion.cursor() as cursor:
     sql = "SELECT idCliente FROM cliente WHERE dni = %s"
     cursor.execute(sql, (dni,))
     resultado = cursor.fetchone()
    if resultado:#si "dni" esta en la bd accede al menu del if, caso el "dni" no este en la bd accede al else para registrarse
    
            def main(): #Menu
             lavado, tinturas, mechas, permanente, bañoCrema, brushing, peinado="-","-","-","-","-","-","-"
             Tintura, Oxidante, Crema, Champu, Decolorante, Protector, Brillo, Horquillas, Aceite, Reparador, idServicio ="-","-","-","-","-","-","-","-","-","-","-"
             while True:
         
                 print("\nMenú de opciones:")
                 print("Lavado (1)")
                 print("Tinturas (2)")
                 print("Mechas (3)")
                 print("Permanente (4)")
                 print("Baño crema (5)")
                 print("Brushing (6)")
                 print("Peinado (7)")
                 print("Fin (8)")
                 opcion = input("Por favor, elige los servicios a realizar: ")        
                 if opcion == '1':
                     print("Has elegido Lavado.")
                     lavado="Lavado" 
                     Crema="crema"
                     Champu="champu"
                 elif opcion == '2':
                     print("Has elegido Tintura.")
                     tinturas="Tinturas"
                     Tintura="tintura"
                     Oxidante="oxidante"
                    
                 elif opcion == '3':
                     print("Has elegido Mechas.")
                     mechas="Mechas"
                     Decolorante="Decolorante"
                     Oxidante="oxidante"
                    
                 elif opcion == '4':
                     print("Has elegido Permanente.")
                     permanente="Permanente"
                     #me faltan datos
                    
                 elif opcion == '5':
                     print("Has elegido Baño Crema.")
                     bañoCrema="Baño Crema"
                     Champu="champu"
                     Crema="crema"
                     Aceite="aceite"
                     Protector="protector"
                     Reparador="reparador"
                 elif opcion == "6":
                     print("Has elegido Brushing.")
                     brushing="Brushing"  
                     Protector="protector"
                     Reparador="reparador"        
                 elif opcion == "7":
                     print("Has elegido Peinado.")
                     peinado="Peinado"    
                     Brillo="brillo"
                     Horquillas="horquillas"        
                 elif opcion == "8":

                  print("Ingresa '1' para Confirmar o '2' para reiniciar la orden.")
                  confirmacion = input()
                  if confirmacion == '1':#guarda lo seleccionado en el menu anterior

                         idCliente=resultado[0]
                         consulta_servicio = "INSERT INTO servicio( idCliente, lavado, tinturas, mechas, permanente, bañoCrema, brushing, peinado) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
                         cur.execute(consulta_servicio, (idCliente, lavado, tinturas, mechas, permanente, bañoCrema, brushing, peinado))
                         miConexion.commit()
                         service = "SELECT LAST_INSERT_ID()"#recoje el "idServicio" que requiere el siguiente if
                         cur.execute(service)
                         resultado2 = cur.fetchone()
                         if resultado2:
                                idServicio=resultado2[0]
                                productos = "INSERT INTO productos( idServicio, Tintura, Oxidante, Crema, Champu, Decolorante, Protector, Brillo, Horquillas, Aceite, Reparador) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                                cur.execute(productos,(idServicio, Tintura, Oxidante, Crema, Champu, Decolorante, Protector, Brillo, Horquillas, Aceite, Reparador))
                                miConexion.commit()
                                print("Saliendo del programa")
                                break
                  elif confirmacion == '2':
                     print("Reiniciando orden")    
                 else:
                     print("Opción no válida. Inténtalo de nuevo.")
                     continue
            if __name__ == "__main__":
                  main()         
    else:#register 
            print("No se encontró el cliente :(")
            cliente = (input("Ingrese el nombre de cliente:"))
            apellido = (input("Ingrese el apellido del cliente:"))
            telefono = input("Ingrese el telefono de cliente: ")
            dni=input("ingrese el dni del cliente: ")
            consulta_cliente = "INSERT INTO cliente(Nombre, Telefono, Apellido, dni) VALUES (%s, %s, %s, %s)"
            cur.execute(consulta_cliente, (cliente, telefono, apellido, dni))
            miConexion.commit()
            print("Cliente registrado :)")
   
except pymysql.MySQLError as e:#por si todo sale mal esto lo corta
    print("Ocurrió un error al conectar con la base de datos:", e)
finally:
    miConexion.close()
