import SwiftUI

public struct CodeColor {
    public init() { }
    public let value = SwiftUI.Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
}

public struct AssetColor {
    public init() { }
    public let value = SwiftUI.Color("Legacy/Material/Gold", bundle: .module)
}



struct A_Color_Previews: PreviewProvider {

    static let codeColor = A.CodeColor().value
    static let assetColor = A.AssetColor().value

    static var previews: some View {
        Group {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(codeColor)

            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(assetColor)
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}
