import ArgumentParser

@main
struct DesignSystemTool: ParsableCommand {
    public func run() throws {
        if let primitiveColors = try? ThemesColorsService.getColors(),
           let themeColors = try? PrimitiveColorService.getColors() {
            print((primitiveColors + themeColors).count)
            ColorAssetsGenerator.generate(from: primitiveColors + themeColors)
        }
    }
}
