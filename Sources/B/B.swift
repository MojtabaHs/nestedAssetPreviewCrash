import SwiftUI
import A

public struct CodeColor {
    public init() { }
    public var value: SwiftUI.Color { A.CodeColor().value }
}

public struct AssetColor {
    public init() { }
    public var value: SwiftUI.Color { A.AssetColor().value }
}


struct B_Color_Previews: PreviewProvider {

    static let codeColor = A.CodeColor().value
    static let assetColor = A.AssetColor().value

    static var previews: some View {
        Group {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(codeColor)

            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            //  .fill(assetColor) // <- uncommenting this line will crash the preview
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}
