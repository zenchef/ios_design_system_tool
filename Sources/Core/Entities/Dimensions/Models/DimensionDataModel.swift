import Foundation

/// Dimension DataModel
struct DimensionDataModel: Codable {
    /// Dimension name
    var name: String
    /// Dimension value
    var value: Double
    
    init?(name: String, value: String) {
        guard let value = Double(value.doubleString) else {
            print("Failed to get number from value \(value)")
            return nil
        }
        self.name = name
        self.value = value
    }
}
