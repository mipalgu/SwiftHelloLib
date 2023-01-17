/// A simple struct with a private text field and a static
/// `run()` method.
public struct HelloLib {
    /// A simple property containing a string.
    public private(set) var text = "Hello"

    /// A do-nothing initialiser.
    @inlinable
    public init() {
    }

    @inlinable
    public static func run() {
        let lib = HelloLib()
        print(lib.text)
    }
}
