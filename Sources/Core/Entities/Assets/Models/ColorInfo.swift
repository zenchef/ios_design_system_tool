struct ColorInfo: Codable {
    var colorSpace: String
    var colorComponents: ColorComponents
    
    init(colorSpace: String, colorComponents: ColorComponents) {
        self.colorSpace = colorSpace
        self.colorComponents = colorComponents
    }
   
    enum CodingKeys: String, CodingKey {
        case colorSpace = "color-space"
        case colorComponents = "components"
    }
}
