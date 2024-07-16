struct ColorEntity: Codable {
    var name: String
    var hexaLight: String
    var hexaDark: String
    
    init?(name: String,
          hexaLight: String,
          hexaDark: String? = nil) {
        self.name = name
        self.hexaLight = hexaLight
        self.hexaDark = hexaDark != nil ? hexaDark! : hexaLight
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case hexaLight = "hexa_light"
        case hexaDark = "hexa_dark"
    }
}
