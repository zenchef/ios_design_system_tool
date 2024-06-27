import Figlet
import ArgumentParser
import Foundation

@main
struct FigletTool: ParsableCommand {
    public func run() throws {
        let colors = try? ThemesColorsService.getColors()
        if let colors {
            ColorAssetsGenerator.generate(from: colors)
        }
        
    }
}
