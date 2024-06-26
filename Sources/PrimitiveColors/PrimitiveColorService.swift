import Foundation

enum DesignSystemError: Error {
    case jsonErrorFor(path: String)
    
    var description: String {
        switch self {
        case .jsonErrorFor(let path):
            return "Failed to get json data for path: \(path)"
        }
    }
}

final class PrimitiveColorService {
    static func getColors() throws -> [ColorEntity] {
        guard let jsonData = FileManager.default.contents(atPath: K.primitivePath) else {
            throw DesignSystemError.jsonErrorFor(path: K.primitivePath)
        }
        var allColors: [ColorEntity] = .init()
        let json = try JSONDecoder().decode(PrimitiveColors.self, from: jsonData)
        json.color.forEach({ (key: String, value: PrimitiveColorValueType) in
            switch value {
            case .color(let color):
                if let entity = ColorEntity(name: key.formatedName, hexaLight: color.hexa) {
                    allColors.append(entity)
                }
            case .other(let dictionary):
                allColors.append(contentsOf: dictionary.compactMap({ opac, color in
                    return ColorEntity(name: (key + opac).formatedName, hexaLight: color.hexa)
                }))
            }
        })
        return allColors
    }
}






