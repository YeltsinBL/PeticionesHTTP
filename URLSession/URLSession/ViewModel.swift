//
//  ViewModel.swift
//  URLSession
//
//  Created by YeltsinMacPro13 on 14/02/23.
//

import Foundation

final class ViewModel {
//    creamos la función que ejecutara la petición http
    func executeApi() {
//        accedemos al singleton del Session para asignarle a la constante
//        para que la podamos usar en la ejecución de la función
        let urlSession =  URLSession.shared
//        La url a la cual nos conectaremos
        let url = URL(string: "https://itunes.apple.com/search/media=music&identity=song&term=avicii")
        
//        utilizamos este método que realizará la petición Http con la URL indicada
        urlSession.dataTask(with: url!) { data, response, error in
            
//            información de acuerdo al estado de la petición
//            print("Data: \(String(describing: data))")
//            print("Response: \(String(describing: response))")
//            print("Error: \(String(describing: error))")
            
//            Convertimos la data de Bytes a Json, como la data es opcional usamos el 'if let'
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data)
                print(String(describing: json))
            }
            
        }.resume() //sin esta linea, no se realizará la petición http
        
        
    }
}
