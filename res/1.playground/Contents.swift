//struct Foo {
//    var bar = 0
//}
//
//class Foo2 {
//    var bar = 0
//}
//
//var a = Foo()
//print(a.bar)
//a.bar = 10
//print(a.bar)
//var a1 = a
//a.bar
//a.bar = 11
//a.bar
//
//a1.bar
//
//var b = Foo2()
//print(b.bar)
//b.bar = 2
//
//var b2 = b
//b.bar = 5
//b2.bar
//b.bar
//
//func myFunction(property: inout Foo) {
//    property.bar = 1000
//}
//
//var val = Foo()
//myFunction(property: &val)
//val.bar
//
//var optional: Int? = 10
//var arr = [Int]()
//
//if let myValue = optional {
//    arr.append(myValue)
//}
//
//
//func myFunction2(number: Int) -> Int? {
//    guard number > 10 else {
//        return nil
//    }
//
//
//    return number * 10
//}
//
//
//myFunction2(number: 100)
//if let _ = myFunction2(number: 100) {
//    print("Hola")
//}

//var val: Int!
//var arr = [Int]()
//arr.append(val)

//protocol Foo {
//    var bar: Int { get }
//
//    func myFunction()
//}
//
//struct Bar: Foo {
//    var bar: Int
//
//    func myFunction() {
//        print("Hola")
//    }
//}
//
//struct FooBar: Foo {
//    var bar: Int
//
//    func myFunction() {
//        print("Adiós")
//    }
//}
//
//class MyClass {
//
//    var foo: Foo
//
//    init(foo: Foo) {
//        self.foo = foo
//
//        foo.myFunction()
//    }
//
//
//}
//
//MyClass(foo: Bar(bar: 0))

//MyClass(foo: FooBar(bar: 0))

//var personas1: Dictionary<String, Persona> = [:]
//var personas2 = [String:Persona]()
//var personas3 = Dictionary<String, Persona>()
//var personas4 = ["10": Persona(id: "1", nom: "2", edat: 0)]
//var personas3: Array<Persona> = []
//var personas4 = [Persona]()
//var personas5 = Array<Persona>()
//var personas6 = []
struct Persona {
    var id: String
    var nom: String
    var edat: Int
}


var personas: [String: Persona] = [:]

var personas2: [Persona] = []

var joan = Persona(id: "1", nom: "Joan Molinas", edat: 25)
var raul = Persona(id: "2", nom: "Raul Vega", edat: 30)
var irati = Persona(id: "3", nom: "Irati Eraña", edat: 24)
var didac = Persona(id: "4", nom: "Didac Serrano", edat: 23)
var moises = Persona(id: "5", nom: "Moisés Jimenez", edat: 33)

//personas2.append(joan)
//personas2.append(raul)
//personas2.append(irati)
//personas2.append(didac)
//personas2.append(moises)
personas2.append(contentsOf: [joan, raul, irati, didac, moises])
personas2

//for persona in personas2 where persona.edat <= 30 {
//    print(persona.nom)
//}

//let foo = personas2.filter { $0.edat < 30 }.map{ $0.edat }

//.filter --> Crea nuevo array con elementos filtrados
//.map --> Crea otro array con otros valores en base al array primero
//.forEach --> Itera sobre todos los elementos del array
//.reduce --> Saca un acumulado con los elementos del array

for p in personas2 {
    personas[p.id] = p
}

personas2.forEach {
    personas[$0.id] = $0
}

func getNom(_ p: Persona) -> String {
    return p.nom
}

let noms = personas2.map(getNom)
print(noms)

personas

























