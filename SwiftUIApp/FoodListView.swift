//
//  FoodListView.swift
//  SwiftUIApp
//
//  Created by Айдин Абдурахманов on 08.11.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import SwiftUI
import Combine

final class FoodListViewModel: ObservableObject {
    @Published private(set) var filterButtonName = "Switch Faves"
    
    @Published private(set) var foods = [Food(name: "Hinkal", isFav: true), Food(name: "Apple", isFav: false), Food(name: "Cheese", isFav: true), Food(name: "Banana", isFav: false)]
}

struct Food: Identifiable {
    var id = UUID()
    let name: String
    let isFav: Bool
}

struct FoodListView: View {
    @ObservedObject var viewModel = FoodListViewModel()
    
    @State var favesShowed: Bool = false
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List {
                FilterView(favesShowed: $favesShowed).environmentObject(viewModel)
                
                ForEach(viewModel.foods) { food in
                    if !self.favesShowed || food.isFav {
                        NavigationLink(destination: FoodView()) {
                        Text(food.name)
                        }
                    }
                }
            }
            .navigationBarHidden(false)
            .navigationBarTitle("Foods")
        }
    }
}

struct FilterView: View {
    @Binding var favesShowed: Bool
    
    @EnvironmentObject var viewModel: FoodListViewModel
    var body: some View {
        Toggle(isOn: $favesShowed) {
            Text(viewModel.filterButtonName)
        }
    }
}
