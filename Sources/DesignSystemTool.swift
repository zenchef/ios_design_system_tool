import Figlet
import ArgumentParser
import Foundation

@main
struct FigletTool: ParsableCommand {
    public func run() throws {
        print(try PrimitiveColorService.getColors())
    }
}
