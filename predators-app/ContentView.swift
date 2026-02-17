//
//  ContentView.swift
//  predators-app
//
//  Created by Julian González on 16/02/26.
//

import SwiftUI

struct ContentView: View {
    
    let predator = Predators()
    
    var body: some View {
        List(predator.apexPredators) { predator in
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
    }
}

#Preview {
    ContentView()
}
