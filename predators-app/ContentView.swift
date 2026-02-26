    //
    //  ContentView.swift
    //  predators-app
    //
    //  Created by Julian González on 16/02/26.
    //

import SwiftUI

struct ContentView: View {
    
    let predator = Predators()
    
    
    @State var searchText = ""
    @State var alphabetical = false
    @State var typeSelection: APType = .all
    
    var filteredPredators: [ApexPredator] {
        predator.filter(by: typeSelection)
        predator.sort(by: alphabetical)
        return predator.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List(filteredPredators) { predator in
                HStack {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .shadow(color: .red, radius: 1)
                    
                    VStack (alignment: .leading) {
                        Text(predator.name)
                            .fontWeight(.bold)
                        
                        Text(predator.type.rawValue.capitalized)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                            .background(predator.type.backgroundColor)
                            .cornerRadius(15)
                    }
                    
                }
            }
            .navigationTitle("Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            alphabetical.toggle()
                        }
                    }label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("filter", selection: $typeSelection.animation()) {
                            ForEach(APType.allCases) { type in
                                Label {
                                    Text(type.rawValue)
                                } icon: {
                                    Image(systemName: type.icon)
                                }
                            }
                        }
                    }label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
