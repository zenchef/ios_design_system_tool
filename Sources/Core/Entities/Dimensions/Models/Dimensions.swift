/// All the DS dimensions
struct Dimensions: Codable {
    var dimension: [String: DimensionEntity]
    var gap: [String: DimensionEntity]
    var padding: [String: DimensionEntity]
    var margin: [String: DimensionEntity]
    var width: [String: DimensionEntity]
    var radius: [String: DimensionEntity]
    var layout: [String: DimensionEntity]
    var size: [String: DimensionEntity]
    var borderWidth: [String: DimensionEntity]
    
    enum CodingKeys: String, CodingKey {
        case dimension = "dimension"
        case gap = "gap"
        case padding = "padding"
        case margin = "margin"
        case width = "width"
        case radius = "border-radius"
        case layout = "layout"
        case size = "size"
        case borderWidth = "border-width"
    }
}
