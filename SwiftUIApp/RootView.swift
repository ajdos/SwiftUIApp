//
//  RootView.swift
//  SwiftUIApp
//
//  Created by Айдин Абдурахманов on 08.11.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import SwiftUI
import Combine

struct RootView: View {
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            StartView()
                .tabItem {
                    VStack {
                        Image(systemName: "bolt")
                        Text("Start")
                    }
            }
            .tag(2)
            
            FoodListView()
                .tabItem {
                    VStack {
                        Image(systemName: "suit.heart")
                        Text("Food")
                    }
            }
            .tag(1)
            
            AboutView()
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("About")
                    }
            }
            .tag(2)
        }
        
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

struct StartView: View {
    
    var body: some View {
        Text("Start page")
    }
    
}

struct AboutView: View {
    
    var body: some View {
        Text("About page")
    }
    
}
