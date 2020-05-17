/*:
 ## umar_s66@outlook.com
 */
//: [Previous](@previous)

import Foundation

struct Customer: Decodable {
    
    let firstName: String
    let lastName: String
    let age: Int
    
    private enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case age
    }
    
    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName  = try container.decode(String.self, forKey: .firstName)
        self.lastName   = try container.decode(String.self, forKey: .lastName)
        self.age        = try container.decode(Int.self, forKey: .age)
    }
}

let json = """
   {
    "firstName": "Umer Khan",
    "lastName": "Mehr Ali",
    "age": 34
    }

""".data(using: .utf8)!

let customer = try JSONDecoder().decode(Customer.self, from: json)
print(customer)
//: [Next](@next)
