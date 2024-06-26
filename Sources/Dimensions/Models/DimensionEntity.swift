import Foundation

struct DimensionEntity: Codable {
    var name: String
    var value: CGFloat
    
    init?(name: String, value: String) {
        guard let value = Double(value.prefix(2)) else {
            return nil
        }
        self.name = name
        self.value = value
    }
}
