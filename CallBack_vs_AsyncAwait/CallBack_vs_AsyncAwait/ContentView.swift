//
//  ContentView.swift
//  CallBack_vs_AsyncAwait
//
//  Created by YeltsinMacPro13 on 14/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("CallBack vs Async/Await")
            VStack{
                AsyncImage(url: viewModel.characterBasicInfo.image)
                Text("Nombre: \(viewModel.characterBasicInfo.name)")
                Text("Primer Episodio: \(viewModel.characterBasicInfo.firstEpisodeTitle)")
                Text("Dimension: \(viewModel.characterBasicInfo.dimension)")
            }
            .padding(.top, 32)
        }
        .onAppear{
            viewModel.executeRequest()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
