import Foundation

/// Dimensions file generator
final class DimensionFileGenerator {
    // MARK: - Static internal functions
    static func generate(from dimensions: [DimensionDataModel], at path: String) {
        var contentFileStr: String = "import Foundation"
        + String(repeating: "\n", count: 2)
        + "enum Dimensions {"
        dimensions.forEach({
            contentFileStr += "\n"
            + "\t"
            + "static let \($0.name): CGFloat = \($0.value)"
        })
        contentFileStr += "\n"
        + "}"
        
        do {
            try contentFileStr.write(
                to: URL(fileURLWithPath: path + "/Dimensions.swift"),
                atomically: true,
                encoding: .utf8
            )
        } catch {
            print(error.localizedDescription)
        }
    }
}
