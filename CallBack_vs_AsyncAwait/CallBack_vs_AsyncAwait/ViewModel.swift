//
//  ViewModel.swift
//  CallBack_vs_AsyncAwait
//
//  Created by YeltsinMacPro13 on 14/02/23.
//
//Se realizará toda la Lógica 

import Foundation

final class ViewModel: ObservableObject {
    
    @Published var characterBasicInfo: CharacterBasicInfo = .empty
    
    func executeRequest() async{
        let characterURL = URL(string: "https://rickandmortyapi.com/api/character/1")!
        
        /** Utilización del Async-Await **/
        
//        realizamos la primera petición y lo almacenamos en una constante de tupla
//        la tupla tiene como parámetros: la data y el response
        let (data, _) = try! await URLSession.shared.data(from: characterURL)
//        parseamos la data al modelo del dominio
        let characterModel = try! JSONDecoder().decode(CharacterModel.self, from: data)
        print("Character Model \(characterModel)")
        
//        realizamos la segunda peticion y lo almacenamos en una constante de tupla
        let firstEpisodeURL = URL(string: characterModel.episode.first!)!
        let (dataFirstEpisode, _) = try! await URLSession.shared.data(from: firstEpisodeURL)
        let episodeModel = try! JSONDecoder().decode(EpisodeModel.self, from: dataFirstEpisode)
        print("Episode Model \(episodeModel)")
        
//        realizamos la tercera peticion y lo almacenamos en una constante de tupla
        let characterLocalizationURL = URL(string: characterModel.locationURL)!
        let (dataLocation, _) = try! await URLSession.shared.data(from: characterLocalizationURL)
        let locationModel = try! JSONDecoder().decode(LocationModel.self, from: dataLocation)
        print("Episode Model \(locationModel)")
        
        DispatchQueue.main.async {
            self.characterBasicInfo = .init(name: characterModel.name, image: URL(string: characterModel.image)!, firstEpisodeTitle: episodeModel.name, dimension: locationModel.dimension)
        }
        
        /** Utilización del CALLBACK para realizar las peticiones HTTP anidadas
//        Primera petición HTTP
        URLSession.shared.dataTask(with: characterURL) { data, response, error in
            let characterModel = try! JSONDecoder().decode(CharacterModel.self, from: data!)
            print("Character Model \(characterModel)")
            
//            segunda petición HTTP
            let firstEpisodeURL = URL(string: characterModel.episode.first!)!
            URLSession.shared.dataTask(with: firstEpisodeURL) { data, response, error in
                let episodeModel = try! JSONDecoder().decode(EpisodeModel.self, from: data!)
                print("Episode Model \(episodeModel)")
                
//                Tercera petición HTTP
                let characterLocalizationURL = URL(string: characterModel.locationURL)!
                URLSession.shared.dataTask(with: characterLocalizationURL) { data, response, error in
                    let locationModel = try! JSONDecoder().decode(LocationModel.self, from: data!)
                    print("Location Model \(locationModel)")
                    
                    DispatchQueue.main.async {
                        self.characterBasicInfo = .init(name: characterModel.name, image: URL(string: characterModel.image)!, firstEpisodeTitle: episodeModel.name, dimension: locationModel.dimension)
                    }
                    
                }.resume()
                
            }.resume()
        }.resume()
        **/
        
    }
}
