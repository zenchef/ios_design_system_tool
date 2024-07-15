import Foundation

extension String {
    var formatedName: String {
        if self.contains("-") {
            let splittedString: [String] = self.components(separatedBy: "-")
            return splittedString.enumerated().map { index, str in
                return index > 0 ? str.capitalized : str
            }.joined()
        } else {
            return self
        }
    }
    
    /// Aims to filter all the non numeric (double) characters
    var doubleString: String {
        let characterSet = CharacterSet(charactersIn: "0123456789.").inverted
        return components(separatedBy: characterSet).joined()
    }
}
