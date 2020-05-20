
import Foundation

struct Value: Decodable {
    let value1: Int
    let value2: Int
    
    private enum CodingKeys: String, CodingKey {
        case value1 = "value1"
        case value2 = "value2"
    }
    
    init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: CodingKeys.self) {
            self.value1 = try container.decode(Int.self, forKey: .value1)
            self.value2 = try container.decode(Int.self, forKey: .value2)
        }
        else if var container = try? decoder.unkeyedContainer() {
            self.value1 = try container.decode(Int.self)
            self.value2 = try container.decode(Int.self)
        }
        else if let container = try? decoder.singleValueContainer() {
            let string = try container.decode(String.self)
            let values = string.components(separatedBy: ",")
            
            guard values.count == 2,
                let value1 = Int(values[0]),
                let value2 = Int(values[1]) else {
                    throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unable to decode")
            }
            self.value1 = value1
            self.value2 = value2
        }
        else {
            let context = DecodingError.Context.init(codingPath: decoder.codingPath, debugDescription: "Unable to decode")
            throw DecodingError.dataCorrupted(context)
        }
    }
}

let jsonType1 = """
{
    "values": [
        { "value1": 2,
          "value2": 4 }
    ]
}
""".data(using: .utf8)!

let jsonType2 = """
{
    "values": [ [2, 4] ]
}
""".data(using: .utf8)!

let jsonType3 = """
{
    "values": [ "2,4" ]
}
""".data(using: .utf8)!




let set1 = try! JSONDecoder().decode([String: [Value]].self, from: jsonType1)
if let values = set1["values"] {
    values[0].value1
    values[0].value2
}

let set2 = try! JSONDecoder().decode([String: [Value]].self, from: jsonType2)
if let values = set2["values"] {
    values[0].value1
    values[0].value2
}

let set3 = try! JSONDecoder().decode([String: [Value]].self, from: jsonType3)
if let values = set3["values"] {
    values[0].value1
    values[0].value2
}
//: [Next](@next)
