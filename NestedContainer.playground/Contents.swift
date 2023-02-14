import UIKit

let data = """
{
    "name_of_user": "Swift",
    "age": 24,
    "address": {
        "city": "La Libertad",
        "zip": "12345",
        "street": "Parseo de Json, Nro 1"
    }
}
""".data(using: .utf8)!

//Mapeo normal creando modelos
//struct Address: Decodable {
//    let city: String
//    let zip: String
//}

struct User: Decodable {
    let name: String
    let age: Int
//    let address: Address
    let city: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name_of_user"
        case age
        case address
        case city
    }
    
//    creación manual de los init
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)

//        self.address = try container.decode(Address.self, forKey: .address)
        
//        accedemos a la información anidada del Json address
        let address = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .address)
//        asignamos a la propiedad city el valor que contenga por nombre city dentro del json address
        self.city = try address.decode(String.self, forKey: .city)
    }
}

let user = try JSONDecoder().decode(User.self, from: data)
user.city
