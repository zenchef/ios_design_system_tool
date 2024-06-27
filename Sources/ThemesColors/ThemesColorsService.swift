import Foundation

final class ThemesColorsService {
    static func getColors() throws -> [ColorEntity] {
        guard let jsonLightData = FileManager.default.contents(atPath: K.themeLightPath),
              let jsonDarkData = FileManager.default.contents(atPath: K.themeDarkPath) else {
            throw DesignSystemError.jsonErrorFor(path: K.themeLightPath + " OR " + K.themeDarkPath)
        }
        var allLighColors: [ColorEntity] = []
        var allDarkColors: [ColorEntity] = []
        let lightThemes = try JSONDecoder().decode(AllThemes.self, from: jsonLightData)
        let darkThemes = try JSONDecoder().decode(AllThemes.self, from: jsonDarkData)
        
        lightThemes.background.values.forEach { type in
            self.updateColors(colors: &allLighColors, with: type)
        }
        darkThemes.background.values.forEach { type in
            self.updateColors(colors: &allDarkColors, with: type)
        }
        lightThemes.border.values.forEach { type in
            self.updateColors(colors: &allLighColors, with: type)
        }
        darkThemes.border.values.forEach { type in
            self.updateColors(colors: &allDarkColors, with: type)
        }
        lightThemes.content.values.forEach { type in
            self.updateColors(colors: &allLighColors, with: type)
        }
        darkThemes.content.values.forEach { type in
            self.updateColors(colors: &allDarkColors, with: type)
        }
        lightThemes.focusRing.values.forEach { type in
            self.updateColors(colors: &allLighColors, with: type)
        }
        darkThemes.focusRing.values.forEach { type in
            self.updateColors(colors: &allDarkColors, with: type)
        }
        lightThemes.shadow.values.forEach { type in
            self.updateColors(colors: &allLighColors, with: type)
        }
        darkThemes.shadow.values.forEach { type in
            self.updateColors(colors: &allDarkColors, with: type)
        }
        guard allDarkColors.count == allLighColors.count else {
            fatalError("not the same color count")
        }
        let allColors = allLighColors.map { color in
            var color = color
            if let hexaDark = allDarkColors.first(where: {$0.name == color.name})?.hexaDark {
                color.hexaDark = hexaDark
            } else {
                fatalError("no hexa dark")
            }
            return color
        }
        print(allColors.count)
        return allColors
    }
    
    private static func updateColors(colors: inout [ColorEntity], with type: ThemeColorValueType) {
        type.colors.forEach { color in
            if let entity = ColorEntity(name: color.name.formatedName,
                                        hexaLight: color.hexa,
                                        hexaDark: color.hexa) {
                colors.append(entity)
            }
        }
    }
}
