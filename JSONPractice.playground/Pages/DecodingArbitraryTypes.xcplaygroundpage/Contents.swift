/*:
 ### Don't Know the type of value
 
 */

//: [Previous](@previous)

import UIKit

struct AnyDecodable: Decodable {
    let value: Any
    
    init<T>(_ value: T?) {
        self.value = value ?? ()
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let string = try? container.decode(String.self) {
            self.init(string)
        }
        
        else if let int = try? container.decode(Int.self) {
            self.init(int)
        }
        
        else {
            self.init(())
        }
    }
}

let json = """
{
    "foo": "I'm String",
    "bar": 44

}


""".data(using: .utf8)!

let dic = try! JSONDecoder().decode([String: AnyDecodable].self, from: json)
dic["foo"]?.value
//: [Next](@next)
