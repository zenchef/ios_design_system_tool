import ArgumentParser

@main
struct DesignSystemTool: ParsableCommand {
    public func run() throws {
        DesignSystemManager.elements.forEach({ $0.generate() })
    }
}

