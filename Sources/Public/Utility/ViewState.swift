import Foundation

public enum ViewState<T> {

    case loading
    case success(T)
    case empty
    case failure(String?)

    /// Returns value is current view state is `success`.
    /// Otherwise returns `nil`.
    public var value: T? {
        switch self {
        case .success(let value):
            return value
        default:
            return nil
        }
    }

    public func map<NewSuccess>(
        _ transform: (T) -> NewSuccess
    ) -> ViewState<NewSuccess> {
        switch self {
        case .empty:
            return .empty
        case .failure(let error):
            return .failure(error)
        case .loading:
            return .loading
        case .success(let result):
            return .success(transform(result))
        }
    }

}

public extension ViewState where T: Collection {

    /// Initialises a new `ViewState` object.
    /// If the given array is empty, sets the object to `.`empty`.
    /// Otherwise sets it to `.success` with the array as value.
    init(successArray: T) {
        self = successArray.isEmpty ? .empty : .success(successArray)
    }

}
