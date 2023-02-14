import UIKit

let data = """
{
    "name_of_user": "Swift",
    "age": 24,
    "address": {
        "city": "La Libertad",
        "zip" "12345",
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
    
}

let user = try JSONDecoder().decode(User.self, from: data)
user.address.city
