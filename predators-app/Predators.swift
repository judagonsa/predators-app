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
    
    func search(for searchTherm: String) -> [ApexPredator] {
        if searchTherm.isEmpty {
            return apexPredators
        }else {
            return apexPredators.filter { predator in
                predator.name.localizedStandardContains(searchTherm)
            }
        }
    }
    
    func sort(by alphabetical: Bool) {
        apexPredators.sort { predator1, predator2 in
            if (alphabetical) {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }
    }
}
