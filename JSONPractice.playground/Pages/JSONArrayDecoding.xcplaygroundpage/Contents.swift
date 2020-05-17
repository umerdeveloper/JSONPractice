//: [Previous](@previous)

import Foundation

struct Place: Codable {
    
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
        let container   =     try decoder.container(keyedBy: CodingKeys.self)
        self.name       =     try container.decode(String.self, forKey: .name)
        self.latitude   =     try container.decode(Double.self, forKey: .latitude)
        self.longitude  =     try container.decode(Double.self, forKey: .longitude)
        self.visited    =     try container.decode(Bool.self, forKey: .visited)
    }
}



let json = """
[
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

""".data(using: .utf8)!

let places = try JSONDecoder().decode([Place].self, from: json)

for place in places {
    print(place)
}


//: [Next](@next)
