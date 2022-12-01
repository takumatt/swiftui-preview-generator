import SwiftUI

struct ExampleView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello, world!")
      Text("Hello")
      Text("こんにちは")
        .foregroundColor(.red)
    }
    .padding()
  }
}

struct ExampleView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView()
  }
}
