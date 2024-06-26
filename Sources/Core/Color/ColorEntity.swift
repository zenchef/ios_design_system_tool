struct ColorEntity: Codable {
    var name: String
    var hexaLight: String
    var hexaDark: String
    var description: String?
    
    init?(name: String,
          hexaLight: String,
          hexaDark: String? = nil,
          description: String? = nil) {
        self.name = name
        self.hexaLight = hexaLight
        self.hexaDark = hexaDark != nil ? hexaDark! : hexaLight
        self.description = description
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case hexaLight = "hexaLight"
        case hexaDark = "hexaDark"
        case description = "descriptions"
    }
}
