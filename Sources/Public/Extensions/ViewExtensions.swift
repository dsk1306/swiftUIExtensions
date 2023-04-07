import SwiftUI

public extension View {

    func navigationTitle(_ title: String) -> some View {
        let text = Text(title)
        return navigationTitle(text)
    }

    func eraseToAnyView() -> AnyView {
        .init(self)
    }

}
