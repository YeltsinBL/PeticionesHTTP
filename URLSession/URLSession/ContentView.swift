//
//  ContentView.swift
//  URLSession
//
//  Created by YeltsinMacPro13 on 14/02/23.
//

import SwiftUI

struct ContentView: View {
//    instanciamos el ViewModel
    private var viewModel: ViewModel = ViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Utilizacion de URLSession")
            Button("Crear peticion HTTP") {
                viewModel.executeApi()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
