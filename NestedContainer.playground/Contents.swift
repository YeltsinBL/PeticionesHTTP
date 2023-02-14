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
struct Address: Decodable {
    let city: String
    let zip: String
}

struct User: Decodable {
    let name: String
    let age: Int
    let address: Address
    
    enum CodingKeys: String, CodingKey {
        case name = "name_of_user"
        case age
        case address
    }
    
//    creacion manual de los init
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)

        self.address = try container.decode(Address.self, forKey: .address)
    }
}

let user = try JSONDecoder().decode(User.self, from: data)
user.address.city
