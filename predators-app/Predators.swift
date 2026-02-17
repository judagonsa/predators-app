//
//  Predators.swift
//  predators-app
//
//  Created by Julian González on 16/02/26.
//

import Foundation

class Predators {
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let apexPredators = try JSONDecoder().decode([ApexPredator].self, from: data)
                self.apexPredators = apexPredators
            } catch {
                print("Error parsing apex predators \(error)")
            }
            
        }
    }
}
