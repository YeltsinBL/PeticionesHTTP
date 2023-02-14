import UIKit

struct User: Decodable {
    let name: String
    let age: Int
}

let data = """
{
    "name":"Hola",
    "age": 24
}
""".data(using: .utf8)! //pasamos el json a data

//parseamos la data y lo pasamos a un modelo
let user = try? JSONDecoder().decode(User.self, from: data)
user?.name


let data2 = """
{
    "identifier": "123456789",
    "user": {
        "name":"Hola",
        "age": 24
    },
    "job": {
        "name": "Software Engineer",
        "description": "Xcode, SwiftUI, UIKit"
    }
}
""".data(using: .utf8)! //pasamos el json a data

struct Job: Decodable {
    let name: String
    let description: String
}
struct Curriculum: Decodable {
    var identifier: String
    var user: User
    var job: Job
}

let curriculum = try? JSONDecoder().decode(Curriculum.self, from: data2)
curriculum?.job.name





