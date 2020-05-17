/*:
 # JSON
 */

import UIKit

struct Customer {
    
    let fName: String
    let lName: String
    let age:    Int
}

extension Customer {
    
    init?(dictionary: [String: Any]) {
        guard let fName = dictionary["fName"] as? String,
              let lName = dictionary["lName"] as? String,
              let age   = dictionary["age"]   as? Int
            
            else { return nil }
        
        self.fName = fName
        self.lName = lName
        self.age   = age
    }
}


let json = """
[
{
    "fName": "Umer",
    "lName": "Khan",
    "age":      24
},
{
    "fName": "Mohamamd",
    "lName": "Mehr Ali",
    "age":      2
},
{
    "fName": "Mohamamd",
    "lName": "Jamat Ali",
    "age":      1
}
]

""".data(using: .utf8)!

