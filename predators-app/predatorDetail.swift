//
//  predatorDetail.swift
//  predators-app
//
//  Created by Julian González on 25/02/26.
//

import SwiftUI

struct PredatorDetail: View {
    
    @State var predator: ApexPredator
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack (alignment: .bottomTrailing) {
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                
                    //name
                
                    //location
                
                    //appears
                
                    //movie moments
                
                    //webpage
            }
        }
        .ignoresSafeArea()

    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[0])
}
