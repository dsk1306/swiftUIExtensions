import SwiftUI

/// A List with a plain style, no separators, no row background and no row insets.
@available(macOS 13, *)
public struct PlainList<Content: View> {

    // MARK: - Typealiases

    public typealias ContentMaker = () -> Content

    // MARK: - Properties

    public let content: ContentMaker

    // MARK: - Initialization

    public init(@ViewBuilder content: @escaping ContentMaker) {
        self.content = content
    }

    public init(content: @escaping @autoclosure ContentMaker) {
        self.content = content
    }

}

// MARK: - View

@available(macOS 13, *)
extension PlainList: View {

    public var body: some View {
        List {
            content()
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)
                .listRowBackground(Color.clear)
                .listRowInsets(.init())
        }
        .listStyle(.plain)
    }

}

// MARK: - PreviewProvider

@available(macOS 13, *)
struct PlainListPreviews: PreviewProvider {

    static var previews: some View {
        PlainList {
            Text("Test 1")
            Text("Test 2")
            Text("Test 3")
        }
        .previewDisplayName("View Builder")
        PlainList(content: Text("Test 1"))
            .previewDisplayName("Autoclosure")
    }

}
