//: [Previous](@previous)

import Foundation

enum AddressType: String, Decodable {
    case house = "house"
    case condo = "condo"
}

struct Customer: Decodable {
    let firstName: String
    let lastName: String
    let address: Address
    
}
struct Address: Decodable {
    let street: String
    let city: String
    let state: String
    let geo: Geo
    let addressType: AddressType
}

struct Geo: Decodable {
    let latitude: Double
    let longitude: Double
}

struct CustomerResponse: Decodable {
    let customers: [Customer]
}

let json = """
{
    "customers": [
    
        {
            "firstName": "John",
            "lastName": "Doe",
            "address": {
                        "street": "123 House MNA",
                        "city": "Rawalpindi",
                        "state": "Punjab",
                        "geo": {
                                "latitude": 22.22,
                                "longitude": 33.22
                    },
                        "addressType": "condo"
                }
            }
    ]
}
""".data(using: .utf8)!



let jsonData = try JSONDecoder().decode(CustomerResponse.self, from: json)
jsonData.customers[0].address.addressType.rawValue
//: [Next](@next)
