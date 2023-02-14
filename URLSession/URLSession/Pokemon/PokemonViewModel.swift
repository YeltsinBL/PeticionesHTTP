//
//  PokemonViewModel.swift
//  URLSession
//
//  Created by YeltsinMacPro13 on 14/02/23.
//

import Foundation

struct PokemonDataModel: Decodable {
    let name: String
    let url: String
}
//struct cuando el array tiene un nombre, en este caso es 'results'
struct PokemonResponseDataModel: Decodable {
    let pokemon: [PokemonDataModel]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemon = try container.decode([PokemonDataModel].self, forKey: .results)
    }
}

final class PokemonViewModel: ObservableObject {
    
//    enviar el mapeo a la vista
    @Published var pokemons: [PokemonDataModel] = []
    
//    creación de la petición HTTP
    func getPokemons() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=150")
        URLSession.shared.dataTask(with: url!) { data, response, error in //estos parametos son opcionales
            if let _ = error {
                print("Error")
            }
//            comprobamos si hay información y si el response es el correcto: 200
            if let data = data,
                let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
//                mapeando la data al modelo
                let pokemonDataModel = try! JSONDecoder().decode(PokemonResponseDataModel.self, from: data)
                print("Pokemons \(pokemonDataModel)")
                
//                hacemos el DispatchQueue para que el hilo en background le envie la información al hilo principal
                DispatchQueue.main.async {
//                  actualizar la propiedad para redibujar la vista, es un hilo en background
                    self.pokemons = pokemonDataModel.pokemon
                }
            }
        }.resume()
    }
}
