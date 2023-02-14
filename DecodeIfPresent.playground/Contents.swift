import UIKit

struct User: Decodable {
    let name: String
    let age: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
//        para evitar que crashee la aplicación si no se envia este dato
        self.age = try container.decodeIfPresent(Int.self, forKey: .age)
    }
    
}

let data = """
{
    "name": "Swift",
    "age": 24
}
""".data(using: .utf8)!

let user = try JSONDecoder().decode(User.self, from: data)
user.age
