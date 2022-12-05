func generateCode(previews: String, outputPathString: String) -> String {
  return
"""
import SwiftUI
import UIKit
import Foundation

enum PreviewGenerator {
  
  static func render(view: some View) -> UIImage {
    
    let controller = UIHostingController(rootView: view)
    
    let window = UIWindow(frame: CGRect(origin: .zero, size: .init(width: 300, height: 300))) // controller.view.intrinsicContentSize))
    window.rootViewController = controller
    window.makeKeyAndVisible()
    
    return window.asImage()
  }
}

extension UIView {
  func asImage() -> UIImage {
    let format = UIGraphicsImageRendererFormat()
    format.scale = 1
    let renderer = UIGraphicsImageRenderer(bounds: bounds, format: format)
    let img = renderer.image { rendererContext in
      layer.render(in: rendererContext.cgContext)
    }
    return img
  }
}


let image = PreviewGenerator.render(view: \(previews))

do {
  try image.pngData()?.write(to: .init(fileURLWithPath: "\(outputPathString)/swiftui-preview-generator-preview-\\(Date().description).png"))
} catch {
  print("broken image data", error)
}

"""
}

func main() {
  let outputPathString = CommandLine.arguments[1]
  let previews = CommandLine.arguments[2]
  print(generateCode(previews: previews, outputPathString: outputPathString))
}

main()

