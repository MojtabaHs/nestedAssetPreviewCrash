import SwiftUI

public struct CodeColor {
    public init() { }
    public let value = SwiftUI.Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
}

public struct AssetColor {
    public init() { }
    // MARK: one package 2 target solution:
    public let value = SwiftUI.Color("Legacy/Material/Gold", bundle: Bundle.module)
    // MARK: Two packages
//    public let value = SwiftUI.Color("Legacy/Material/Gold", bundle: Bundle.myModule)
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

// MARK: - Solution

/*
 IMPORTANT: Since this is only ONE package with two target, you could use the basic solution (see reference inside AssetColor struct)
 IF you are using 2 packages and want to reference them, you go with the "myModule" solution.
 */

extension Bundle {
    public static let assets = Bundle.myModule
}

private class CurrentBundleFinder {}
extension Foundation.Bundle {
    static var myModule: Bundle = {
        /* The name of your local package, prepended by "LocalPackages_" for iOS and "PackageName_" for macOS. You may have same PackageName and TargetName*/
//        let bundleNameIOS = "LocalPackages_EHQCoreUI"
//        let bundleNameMacOs = "PackageName_EHQCoreUI"
        let bundleNameIOS = "LocalPackages_A"
        let bundleNameMacOs = "PackageName_A"
        let candidates = [
            /* Bundle should be present here when the package is linked into an App. */
            Bundle.main.resourceURL,
            /* Bundle should be present here when the package is linked into a framework. */
            Bundle(for: CurrentBundleFinder.self).resourceURL,
            // -> Optional UI Tests
            /* Bundle should be present here when the package is used in UI Tests. */
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent(),
            /* For command-line tools. */
            Bundle.main.bundleURL,
            /* Bundle should be present here when running previews from a different package (this is the path to "…/Debug-iphonesimulator/"). */
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent(),
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent(),
        ]
        
        for candidate in candidates {
            let bundlePathiOS = candidate?.appendingPathComponent(bundleNameIOS + ".bundle")
            let bundlePathMacOS = candidate?.appendingPathComponent(bundleNameMacOs + ".bundle")
            if let bundle = bundlePathiOS.flatMap(Bundle.init(url:)) {
                return bundle
            } else if let bundle = bundlePathMacOS.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle")
    }()
}


