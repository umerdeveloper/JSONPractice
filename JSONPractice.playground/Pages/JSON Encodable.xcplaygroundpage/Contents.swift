/*:
 # JSONEncodable
 */
//: [Previous](@previous)

import Foundation

struct Customer: Codable {
    
    let firstName: String
    let lastName: String
    let age: Int
    
    private enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case age
    }
    
    func encoder(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encode(self.lastName, forKey: .lastName)
        try container.encode(self.age, forKey: .age)
    }
}

let customer = Customer(firstName: "Umer", lastName: "Khan", age: 24)
let encodedCustomer = try JSONEncoder().encode(customer)

print(String(data: encodedCustomer, encoding: .utf8)!)

//: [Next](@next)
