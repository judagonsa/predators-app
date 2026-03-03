    //
    //  predatorDetail.swift
    //  predators-app
    //
    //  Created by Julian González on 25/02/26.
    //

import SwiftUI
import MapKit

struct PredatorDetail: View {
    
    let predator: ApexPredator
    @State var position: MapCameraPosition
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack (alignment: .bottomTrailing) {
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay{
                            LinearGradient(
                                stops: [Gradient.Stop(color: .clear, location: 0.8),
                                        Gradient.Stop(color: .black, location: 1)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        }
                    
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                
                VStack(alignment: .leading) {
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    NavigationLink {
                        
                    } label: {
                        Map(position: $position){
                            Annotation(predator.name, coordinate: predator.location){
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                        }
                        .frame(height: 125)
                        .clipShape(.rect(cornerRadius: 10))
                    }
                    
                    Text("Appears in:")
                        .font(.title2)
                        .padding(.top, 10)
                    
                    ForEach(predator.movies, id:\.self) { movie in
                        Text("• " + movie)
                            .font(.subheadline)
                    }
                    
                    Text("Movie moments:")
                        .font(.title2)
                        .padding(.top, 5)
                    
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title3)
                            .padding(.vertical, 1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 3)
                    }
                    
                    Text("Read more:")
                        .font(.caption)
                    
                    
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                    
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
                .frame(width: geo.size.width, alignment: .leading)

            }
        }
        .ignoresSafeArea()
        .toolbarBackground(.automatic)
        
    }
}

#Preview {
    
    let predator = Predators().apexPredators[0]
    PredatorDetail(
        predator: predator,
        position: .camera(MapCamera(centerCoordinate: predator.location, distance: 3000))
    )
        .preferredColorScheme(.dark)
}
