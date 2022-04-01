//
//  MappingStruct.swift
//  Mocks
//
//  Created by Brett McMillin on 3/13/22.
//

import SwiftUI

struct ValueMap: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case property
        case rawVal
        case displayVal
    }
    
    var id = UUID()
    var property: String
    var rawVal: String
    var displayVal: String
}

class MapValues: ObservableObject  {
    @Published var babels = [ValueMap]()
    
        
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "valueMapping", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let babels = try? JSONDecoder().decode([ValueMap].self, from: data!)
        self.babels = babels!
        
    }
     
}
