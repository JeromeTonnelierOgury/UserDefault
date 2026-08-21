import Foundation

nonisolated(unsafe) private let encoder = JSONEncoder()
nonisolated(unsafe) private let decoder = JSONDecoder()
public extension DefaultsValueConvertible where Self: Codable {
	init(defaultsRepresentation: Data) throws {
		self = try decoder.decode(Self.self, from: defaultsRepresentation)
	}
	
	func defaultsRepresentation() throws -> Data {
		try encoder.encode(self)
	}
}
