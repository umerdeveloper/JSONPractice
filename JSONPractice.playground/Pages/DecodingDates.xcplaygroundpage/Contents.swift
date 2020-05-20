//: [Previous](@previous)

import Foundation

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyy"
        return formatter
    }()
}

struct DateStruct: Decodable {
    let dateCreated: Date
    
    private enum CodingKeys: String, CodingKey {
        case dateCreated = "dateCreated"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dateCreated = try container.decode(Date.self, forKey: .dateCreated)
    }
}

let json = """

{
    "dateCreated": "06/01/1995"
}

""".data(using: .utf8)!


let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
let jsonResponse = try decoder.decode(DateStruct.self, from: json)
jsonResponse.dateCreated

//: [Next](@next)
