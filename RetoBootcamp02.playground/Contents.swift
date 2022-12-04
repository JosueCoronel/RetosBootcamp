import UIKit

//ESTRUCTURA DE LOS USUARIOS
struct Usuario {
    var nombre:String
    var apellidoPaterno:String
    var apellidoMaterno:String
    var fechaNacimiento:String
    var NumDocumento:Int
    var correo:String
    var hermanos:Int
    var sexo:String //Se Agrego el sexo
    var usuario:String? //Se Agrego el usuario
    
    init(nombre:String,apellidoPaterno:String,apellidoMaterno:String,fechaNacimiento:String ,NumDocumento:Int,correo:String,hermanos:Int
        ,sexo:String //Se Agrego el sexo
        ,usuario:String?=nil //Se Agrego el usuario
        ){
            self.nombre=nombre
            self.apellidoPaterno = apellidoPaterno
            self.apellidoMaterno = apellidoMaterno
            self.fechaNacimiento = fechaNacimiento
            self.NumDocumento = NumDocumento
            self.correo = correo
            self.hermanos = hermanos
            self.sexo = sexo //Se Agrego el sexo
            self.usuario = usuario //Se Agrego el usuario
        }
}

//LISTA DE PERSONAS
var listaPersonas:[Usuario] = [
    Usuario(nombre:"CARLOS JOSE",apellidoPaterno:"Robles", apellidoMaterno:"GOMEZ", fechaNacimiento:"06/08/1995",NumDocumento:74851245,correo:"carlos.robles@hotmail.com", hermanos:2, sexo:"M"),
    Usuario(nombre:"MIGUEL ANGEL",apellidoPaterno:"QUISPE", apellidoMaterno:"OTERO", fechaNacimiento:"28/12/1995", NumDocumento:79451654,correo:"miguel.anguel@gmail.com", hermanos:0,sexo:"M"),
    Usuario(nombre:"KARLA ALEXANDRA",apellidoPaterno:"FLORES", apellidoMaterno:"ROSAS", fechaNacimiento:"15/02/1997", NumDocumento:77485812,correo:"Karla.alexandra@hotmail.com", hermanos:1,sexo:"F"),
    Usuario(nombre:"NICOLAS",apellidoPaterno:"QUISPE", apellidoMaterno:"ZEBALLOS", fechaNacimiento:"08/10/1990", NumDocumento:71748552,correo:"nicolas123@gmail.com", hermanos:2,sexo:"M"),
    Usuario(nombre:"PEDRO ANDRE",apellidoPaterno:"PICASSO", apellidoMaterno:"BETANCUR", fechaNacimiento:"17/05/1994", NumDocumento:74823157,correo:"pedroandrepicasso@gmail.com", hermanos:2,sexo:"M"),
    Usuario(nombre:"FABIOLA MARIA",apellidoPaterno:"PALACIO", apellidoMaterno:"VEGA", fechaNacimiento:"02/02/1992", NumDocumento:76758254,correo:"fabi@hotmail.com", hermanos:0,sexo:"F")
];
//print(listaPersonas)

print("RETO SWIFT")
print("")
print("")
//1ER EJERCICIO
print("/******************************************/")
print("1. OBTENER LA PERSONA CON MAYOR Y MENOR EDAD")
print("")

//Formato Fecha
func getFech(fecha:String)->Date{
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "dd/MM/yyyy"
    let f = dateFormat.date(from: fecha)
    return f!
}
//Calcular la Edad Actual
func CalculeYears(fechaNacimiento:String)-> Int{
    let fechaNac = getFech(fecha: fechaNacimiento)
    let calendar = Calendar.current
    let fechOld = calendar.dateComponents([.day, .month, .year], from: fechaNac)
    let fechNew = calendar.dateComponents([.day, .month, .year], from: Date())
    let res = calendar.dateComponents([.day,.month, .year], from: fechOld, to: fechNew)
    return res.year ?? 0
}

var edadMenor:Int = 0 //Con esta edad obtengo el mayor
var edadMayor:Int = 99 //Con esta edad obtengo el menor
var nombreMenor:String = "" //Nombre de la persona con Menor edad
var nombreMayor:String = "" //Nombre de la persona con Mayor edad

for listaPersonas in listaPersonas{
    let edad:Int = CalculeYears(fechaNacimiento: listaPersonas.fechaNacimiento)

    //EDAD DEL MAYOR
    if(edad > edadMenor){
        edadMenor = edad
        nombreMayor = listaPersonas.nombre
    }
    //EDAD DEL MENOR
    if(edad < edadMayor){
        edadMayor = edad
        nombreMenor = listaPersonas.nombre
    }
}

print("La persona que tiene mayor edad es " + nombreMayor.capitalized + " con " + String(edadMenor) + " años de edad")
print("La persona que tiene menor edad es " + nombreMenor.capitalized + " con " + String(edadMayor) + " años de edad")
print("")

//2DO EJERCICIO
print("/******************************************/")
print("2. Obtener dos listas más, una para hombres y otra mara mujeres e imprimir la cantidad de personas que hay en cada lista")
print("")

let hombres = listaPersonas.filter({$0.sexo == "M"}).count
let mujeres = listaPersonas.filter({$0.sexo == "F"}).count
let total = hombres + mujeres
print("Hay un total de \(total) personas: \(hombres) Hombres y \(mujeres) mujeres")
print("")

//3ER EJERCICIO
print("/******************************************/")
print("3. Obtener una lista de todas las personas que tienen más de dos hermanos")
print("")

var listaHermanos:[String] = []
var lista = listaPersonas.filter({$0.hermanos > 2})
if(lista.count > 0){
for list in lista {
listaHermanos.append(list.nombre)
}
print("La lista de las personas que tienen mas de 2 hermanos son:")
print(listaHermanos)
}else{
print("Hay \(lista.count) personas que tienen mas de 2 hermanos")
}
print("")

//3ER EJERCICIO
print("/******************************************/")
print("4. Imprimir cada persona con este formato “Luis Inga M.” Solo primer nombre, ape pate completo y solo la inicial del ape mate más un punto. *Y EN CAPITALIZE* (primera letra de cada palabra en mayúscula y todo lo demás en minúscula)")
print("")

let listado = listaPersonas
var formatoNombre : [String] = []

func obtenerFormatoNombre(nombre:String,apellidoPaterno:String, apellidoMaterno:String) -> String{
    let primerNombre = nombre.components(separatedBy: " ")[0].capitalized
    let apellidoPat = apellidoPaterno.capitalized
    let apellidoMat = apellidoPaterno.prefix(1).capitalized+"."

    return primerNombre + " " + apellidoPat + " " + apellidoMat
}
//print(obtenerFormatoNombre(nombre: "JOSUE",apellidoPaterno: "CORONEL",apellidoMaterno: "FLORES"))
for item in listado {
    var nombreNuevo = obtenerFormatoNombre(nombre: item.nombre,apellidoPaterno: item.apellidoPaterno,apellidoMaterno: item.apellidoMaterno)
    formatoNombre.append(nombreNuevo)
}
print(formatoNombre)
print("")

//3ER EJERCICIO
print("/******************************************/")
print("5. Crear usuarios a todas las personas y guardar en la lista.")
print("")

for (index, item) in listaPersonas.enumerated() {
    var correo = item.correo
    var usuarioNuevo = correo.components(separatedBy: "@")[0]
    listaPersonas[index].usuario = usuarioNuevo
    print("Correo: " + correo)
    print("UserID: " + usuarioNuevo)
}

print("")

print("/******************************************/")
print("GRACIAS TOTALES!!")
