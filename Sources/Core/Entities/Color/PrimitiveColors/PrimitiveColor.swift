import Foundation

struct PrimitiveColor: Codable {
    var hexa: String
    
    enum CodingKeys: String, CodingKey {
        case hexa = "value"
    }
}
