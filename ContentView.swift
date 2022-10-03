//
//  ContentView.swift
//  GridSearch
//
//  Created by V K on 02.10.2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @ObservedObject var vm = GridViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100, maximum: 200), alignment: .top),
                    GridItem(.flexible(minimum: 100, maximum: 200),  alignment: .top),
                    GridItem(.flexible(minimum: 100, maximum: 200), alignment: .top)
                ], spacing: 12) {
                    ForEach(vm.results, id: \.self) { app in
                        AppInfo(app: app)
                    }
                }
                .padding(12)
            }
            .navigationTitle("Grid Search")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppInfo: View {
    
    let app: Result
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: app.artworkUrl100))
                .cornerRadius(19)
            
            Text(app.name)
                .font(.system(size: 13, weight: .semibold))
                .padding(.top, 3)
            Text(app.releaseDate)
                .font(.system(size: 11))
            Text(app.artistName)
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
        .padding(.top, 10)
    }
}
