enum DesignSystemError: Error {
    case jsonErrorFor(path: String)
    
    var description: String {
        switch self {
        case .jsonErrorFor(let path):
            return "Failed to get json data for path: \(path)"
        }
    }
}
