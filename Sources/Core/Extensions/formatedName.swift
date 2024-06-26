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
}
