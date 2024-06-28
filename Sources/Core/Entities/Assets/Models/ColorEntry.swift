struct ColorEntry: Codable {
    let color: Color
    let idiom: String
    let appearances: [Appearance]?
    
    struct Color: Codable {
        let colorSpace: String
        let components: ColorComponents
        
        enum CodingKeys: String, CodingKey {
            case colorSpace = "color-space"
            case components
        }
    }
}
