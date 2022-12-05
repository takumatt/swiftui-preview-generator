import SwiftUI

struct ExampleView: View {
  var body: some View {
    VStack {
      Text("\(UIDevice.current.systemVersion)")
      
      Capsule(style: .continuous)
        .fill(.blue)
        .frame(width: 200, height: 100)
    }
  }
}

struct ExampleView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView()
  }
}
