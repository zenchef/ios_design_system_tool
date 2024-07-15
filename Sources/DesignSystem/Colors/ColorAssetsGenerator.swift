import Foundation

final class ColorAssetsGenerator {
    // MARK: - Static internal functions
    static func generate(from colors: [ColorEntity], at path: String) {
        FileManager.cleanFolder(for: path) {
            colors.forEach { entity in
                let fullPath = path + "/" + entity.name.formatedName + ".colorset"
                self.genrerateAssetColorItem(colorEntity: entity, path: fullPath)
            }
        }
    }
    
    // MARK: - Static private functions
    private static func genrerateAssetColorItem(colorEntity: ColorEntity, path: String) {
        let url = URL(fileURLWithPath: path)
        do {
            try FileManager.default.createDirectory(at: url,
                                                    withIntermediateDirectories: true,
                                                    attributes: nil)
            let jsonData = try JSONEncoder().encode(
                ColorsData(lightColorComponents: self.getRGB(from: colorEntity.hexaLight),
                           darkColorComponent: self.getRGB(from: colorEntity.hexaDark))
            )
            try String(data: jsonData, encoding: .utf8)?.write(
                to: URL(fileURLWithPath: path + "/Contents.json"),
                atomically: true,
                encoding: .utf8
            )
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private static func getRGB(from hexa: String) -> ColorComponents {
        let hexString = hexa.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let red = CGFloat(Int(color >> 16) & mask) / 255.0
        let green = CGFloat(Int(color >> 8) & mask) / 255.0
        let blue = CGFloat(Int(color) & mask) / 255.0
        
        return ColorComponents(red: red, green: green, blue: blue, alpha: 1)
    }
}
