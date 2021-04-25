 import SwiftUI

struct SelectableButtonStyle: ButtonStyle {

    var isSelected = false

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 60.0, height: 60.0, alignment: .center)
            .padding()
            .background(Color(#colorLiteral(red: 1, green: 0.8980392157, blue: 0.7058823529, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: isSelected ? 16.0 : 0.0))
            .overlay(RoundedRectangle(cornerRadius: isSelected ? 16.0 : 0.0).stroke(lineWidth: isSelected ? 2.0 : 0.0).foregroundColor(Color.pink))
            .animation(.linear)
    }
}


struct StatedButton<Label>: View where Label: View {


    private let action: (() -> ())?

    private let label: (() -> Label)?

    @State var buttonStyle = SelectableButtonStyle()

    init(action: (() -> ())? = nil, label: (() -> Label)? = nil) {
        self.action = action
        self.label = label
    }

    var body: some View {
        Button(action: {
            self.buttonStyle.isSelected = !self.buttonStyle.isSelected
            self.action?()
            print("isSelected now is \(self.buttonStyle.isSelected ? "true" : "false")")
        }) {
            label?()
        }
        .buttonStyle(buttonStyle)
    }
}
