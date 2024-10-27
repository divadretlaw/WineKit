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
        let output = target.directory.appending(subpath: "Domain").appending(subpath: "Verbs")
        
        let verbURL = URL(string: "https://raw.githubusercontent.com/Winetricks/winetricks/master/files/verbs/")!
        let verbs = [
            ("App", "apps.txt"),
            ("Benchmark", "benchmarks.txt"),
            ("DLL", "dlls.txt"),
            ("Font", "fonts.txt"),
            ("Game", "games.txt"),
            ("Setting", "settings.txt")
        ]
        
        for verb in verbs {
            guard let url = URL(string: verb.1, relativeTo: verbURL) else { continue }
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
                .map { $0.key }
                .sorted { lhs, rhs in
                    lhs.formatted() < rhs.formatted()
                }
                .reduce("") { result, verb in
                    return result + "\t\tcase \(verb.formatted()) = \"\(verb)\"\n"
                }
            
            let description = dictionary
                .sorted { lhs, rhs in
                    lhs.key.formatted() < rhs.key.formatted()
                }
                .reduce("") { result, element in
                    return result + "\t\t\tcase .\(element.key.formatted()):\n\t\t\t\treturn \"\(element.value.replacingOccurrences(of: "\\", with: "\\\\"))\"\n"
                }
            
            let content = """
            //
            //  Verbs+\(verb.0).swift
            //  WineKit
            //
            //  Created by David Walter on 15.12.23.
            //
            
            import Foundation
            
            extension Winetricks {
                public enum \(verb.0): String, Hashable, Equatable, Codable, CaseIterable, CustomStringConvertible, Sendable {
            \(cases.trimmingCharacters(in: .newlines))
            
                    // MARK: - CustomStringConvertible
                
                    public var description: String {
                        switch self {
            \(description.trimmingCharacters(in: .newlines))
                        }
                    }
                }
            }
            
            """
            
            let target = URL(filePath: output.appending(subpath: "Verbs+\(verb.0).swift").string)
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
