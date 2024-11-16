//
//  main.swift
//  WineKit
//
//  Created by David Walter on 17.12.23.
//

import Foundation
import PackagePlugin

@main
struct WinetricksPlugin: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        guard let target = try context.package.targets(named: ["WineKit"]).first else { return }
        let directory = URL(filePath: target.directory.string)
        
        try await updateScript(directory: directory)
        try await updateVerbs(directory: directory)
    }
    
    private func updateScript(directory: URL) async throws {
        let output = directory
            .appending(path: "Resources", directoryHint: .isDirectory)
            .appending(path: "winetricks.sh")
        
        let url = URL(string: "https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks")!
        let (data, _) = try await URLSession.shared.data(from: url)
        try data.write(to: output)
    }
    
    private func updateVerbs(directory: URL) async throws {
		let output = directory
			.appending(path: "Domain", directoryHint: .isDirectory)
			.appending(path: "Verbs", directoryHint: .isDirectory)
        
        let verbURL = URL(string: "https://raw.githubusercontent.com/Winetricks/winetricks/master/files/verbs/")!
        let verbs: [(category: String, source: String)] = [
            ("App", "apps.txt"),
            ("Benchmark", "benchmarks.txt"),
            ("DLL", "dlls.txt"),
            ("Font", "fonts.txt"),
            ("Setting", "settings.txt")
        ]
        
        for verb in verbs {
            guard let url = URL(string: verb.source, relativeTo: verbURL) else { continue }
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let string = String(data: data, encoding: .utf8) else { continue }
            
            var dictionary: [String: String] = [:]
            for line in string.split(separator: "\n") {
                let splits = line.split(separator: " ", maxSplits: 1)
                guard let verb = splits.first, let description = splits.last else { continue }
                dictionary[String(verb)] = String(description)
                    .removingCharacters(in: .controlCharacters)
                    .replacingOccurrences(of: "[downloadable]", with: "")
                    .trimmingCharacters(in: .whitespacesAndNewlines)
            }
            
            let cases = dictionary
                .sorted { lhs, rhs in
                    lhs.key.formatted() < rhs.key.formatted()
                }
                .reduce("") { result, verb in
                    let block = """
                    \t\t/// \(verb.value)
                    \t\tcase \(verb.key.formatted()) = \"\(verb.key)\"
                    """
                    return result + block + "\n"
                }
            
            let description = dictionary
                .sorted { lhs, rhs in
                    lhs.key.formatted() < rhs.key.formatted()
                }
                .reduce("") { result, element in
                    let block = """
                    \t\t\tcase .\(element.key.formatted()):
                    \t\t\t\treturn \"\(element.value.replacingOccurrences(of: "\\", with: "\\\\"))\"
                    """
                    return result + block + "\n"
                }
            
            let content = """
            //
            // Verbs+\(verb.category).swift
            // WineKit
            // 
            // Source: https://github.com/Winetricks/winetricks
            //
            // Automatically generated on \(Date.now.formatted(date: .numeric, time: .omitted)).
            //
            
            import Foundation
            
            extension Winetricks {
            \t/// Winetricks verbs from \(verb.category).txt
            \tpublic enum \(verb.category): String, Hashable, Equatable, Codable, CaseIterable, CustomStringConvertible, Sendable {
            \(cases.trimmingCharacters(in: .newlines))
            
            \t\t// MARK: - CustomStringConvertible
            
            \t\tpublic var description: String {
            \t\t\tswitch self {
            \(description.trimmingCharacters(in: .newlines))
            \t\t\t}
            \t\t}
            \t}
            }
            
            """
            
            let target = output.appending(path: "Verbs+\(verb.0).swift")
            print(target)
            try content.write(to: target, atomically: true, encoding: .utf8)
        }
    }
}

extension String {
    func formatted() -> String {
        let value = self
            .split(separator: "=")
            .map { String($0) }
            .map { $0.uppercasedFirstLetter() }
            .joined()
            .split(separator: "_")
            .map { String($0) }
            .map { $0.uppercasedFirstLetter() }
            .joined()
            .lowercasedFirstLetter()
        
        if value.first?.isNumber == true {
            return "_\(value)"
        } else {
            return value
        }
    }
    
    func uppercasedFirstLetter() -> String {
        prefix(1).uppercased() + self.dropFirst()
    }
    
    func lowercasedFirstLetter() -> String {
        prefix(1).lowercased() + self.dropFirst()
    }
    
    func removingCharacters(in set: CharacterSet) -> String {
        self.components(separatedBy: set).joined()
    }
}
