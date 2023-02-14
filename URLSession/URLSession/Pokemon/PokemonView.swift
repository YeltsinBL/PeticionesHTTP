//
//  PokemonView.swift
//  URLSession
//
//  Created by YeltsinMacPro13 on 14/02/23.
//

import SwiftUI

struct PokemonView: View {
    
    @StateObject var pokemonViewModel: PokemonViewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(pokemonViewModel.pokemons, id: \.name) { pokemon in
                    Text(pokemon.name)
                }
            }
            .navigationTitle("Pokemons")
        }.onAppear{
            pokemonViewModel.getPokemons()
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
