//: [Previous](@previous)

import Foundation

struct PlaceStruct: Decodable {
    
    let places: [Place]
    
    private enum CodingKeys: String, CodingKey {
        case places
    }
    
    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.places     = try container.decode(Array.self, forKey: .places)
    }
}

struct Place: Decodable {
    
    let name:       String
    let latitude:   Double
    let longitude:  Double
    let visited:    Bool
    
    private enum CodingKeys: String, CodingKey {
        case        name
        case        latitude
        case        longitude
        case        visited
    }
    
    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.name       = try container.decode(String.self, forKey: .name)
        self.latitude   = try container.decode(Double.self, forKey: .latitude)
        self.longitude  = try container.decode(Double.self, forKey: .longitude)
        self.visited    = try container.decode(Bool.self, forKey: .visited)
    }
}


let json = """
{
"places": [
{
    "name":        "Germany",
    "latitude":     22.22,
    "longitude":    24.99,
    "visited":      true
},
{
    "name":        "Iceland",
    "latitude":     44.33,
    "longitude":    32.98,
    "visited":      true
},
{
    "name":        "France",
    "latitude":     14.33,
    "longitude":    42.88,
    "visited":      false
}
]
}

""".data(using: .utf8)!

//let jsonData = try JSONDecoder().decode([String:[Place]].self, from: json)
let jsonData = try JSONDecoder().decode(PlaceStruct.self, from: json)
print(jsonData.places[0])
//: [Next](@next)
