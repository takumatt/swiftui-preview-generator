import Foundation

enum PreviewProviderExtractor {
  
  static func findTargetView(in text: String) -> String? {
    
    let _previewProviderClassName = "PreviewProvider"
    
    guard text.contains(_previewProviderClassName) else { return nil }
    
    let previewProviderPattern = #/struct\s+(?<name>\w+)(\s*:\s+PreviewProvider).*{(?<previewProviderBody>[\s\S]*)}.*/#
    let previewsBodyPattern = #/static\s+var\s+previews\s*:\s+some\s+View\s+{\n+(?<previewsBody>[\s\S]*)\n+\s+}/#
    
    if let previewProviderMatch = text.firstMatch(of: previewProviderPattern),
       let previewBodyMatch = previewProviderMatch.previewProviderBody.firstMatch(of: previewsBodyPattern)
    {
      return String(previewBodyMatch.previewsBody)
    } else {
      return nil
    }
  }
}

func readText(pathString: String) -> String? {
  guard let fileURL = URL(string: "file://\(pathString)") else {
    return nil
  }
  do {
    return try String(contentsOf: fileURL, encoding: .utf8)
  } catch {
    return nil
  }
}

func main() {
  
  guard let previews = readText(pathString: CommandLine.arguments[1]) else {
    return
  }
  
  if let text = PreviewProviderExtractor.findTargetView(in: previews) {
    print(text)
  }
}

main()


