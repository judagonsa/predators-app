//
//  PredatorMap.swift
//  predators-app
//
//  Created by Julian González on 3/03/26.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    
    let predator = Predators()
    
    @State var position: MapCameraPosition
    @State var satellite: Bool = false
    
    var body: some View {
        Map(position: $position){
            ForEach(predator.apexPredators){ predator in
                Annotation(predator.name, coordinate: predator.location){
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 3)
                        .scaleEffect(x: -1)
                }
            }
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing) {
            Button {
                satellite.toggle()
            } label: {
                Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(radius: 3)
                    .padding()
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    PredatorMap(position: .camera(
        MapCamera(
            centerCoordinate: Predators().apexPredators[0].location,
            distance: 1000,
            heading: 250,
            pitch: 80
        )
    ))
}
