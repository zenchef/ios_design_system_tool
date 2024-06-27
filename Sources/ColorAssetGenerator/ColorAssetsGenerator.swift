import Foundation

final class ColorAssetsGenerator {
    static func generate(from colors: [ColorEntity], at path: String) {
        colors.forEach { entity in
            let fullPath = path + "/" + entity.name.formatedName + ".colorset"
            let url = URL(fileURLWithPath: fullPath)
            if !FileManager.default.fileExists(atPath: url.absoluteString) {
                do {
                    try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
                    let jsonData = try JSONEncoder().encode(
                        
                        ColorsData(lightColorComponents: self.getRGB(from: entity.hexaLight),
                                    darkColorComponent: self.getRGB(from: entity.hexaDark))
                    )
                    try String(data: jsonData, encoding: .utf8)?.write(
                        to: URL(fileURLWithPath: fullPath + "/Contents.json"),
                        atomically: true,
                        encoding: .utf8
                    )
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    static func getRGB(from hexa: String) -> ColorComponents {
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
//    
//    static func generate(from colors: [ColorEntity]) -> String {
//        var string: String = "import UIKit\n\nenum Colors {"
//        colors.forEach({
//            string += "\n\tstatic var "
//            + $0.name
//            + " = "
//            + "UIColor(hexString: "
//            + "\""
//            + $0.hexaLight
//            + "\"" 
//            + ")"
//        })
//        string += "\n}"
//        return string
//    }
}
