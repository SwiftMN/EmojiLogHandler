import Logging

public struct EmojiLogHandler: LogHandler {
  
  let label: String
  
  public init(_ label: String) {
    self.label = label
  }
  
  public var metadata = Logger.Metadata()
  public var logLevel: Logger.Level = .trace
  
  public static let prefixKey = "prefixKey"
  
  public static func customPrefix(_ prefixString: String) -> Logger.Metadata {
    return [EmojiLogHandler.prefixKey: .string(prefixString)]
  }
  
  public static func prefix(for level: Logger.Level) -> String {
    switch level {
    case .trace:    return "📋  [TRACE]"
    case .debug:    return "🐛  [DEBUG]"
    case .info:     return "🗣  [INFO]"
    case .notice:   return "👀  [NOTICE]"
    case .warning:  return "💥💥[WARN]"
    case .error:    return "💩💩[ERROR]"
    case .critical: return "‼️‼️[CRITICAL]"
    }
  }
  
  /// converts  /some/dir/FileName.swift to FileName
  public static func simplifiedFileName(_ file: String) -> String {
    guard let fileName = file.split(separator: "/").last else { return file }
    guard let withoutExtenstion = "\(fileName)".split(separator: ".").first else { return "\(fileName)" }
    return "\(withoutExtenstion)"
  }
  
  
  public static func format(_ level: Logger.Level, _ message: Logger.Message, _ metadata: Logger.Metadata?, _ file: String, _ line: UInt) -> String {
    if let prefix = metadata?[EmojiLogHandler.prefixKey] {
      return "\(prefix) [\(EmojiLogHandler.simplifiedFileName(file)):\(line)] \(message)"
    }
    return "\(EmojiLogHandler.prefix(for: level)) [\(EmojiLogHandler.simplifiedFileName(file)):\(line)] \(message)"
  }
  
  public func log(level: Logger.Level, message: Logger.Message, metadata: Logger.Metadata?, file: String, function: String, line: UInt) {
    // consider updating this to use a TextOutputStream
    print(EmojiLogHandler.format(level, message, metadata, file, line))
  }
  
  public subscript(metadataKey key: String) -> Logger.Metadata.Value? {
    get {
      return metadata[key]
    }
    set(newValue) {
      metadata[key] = newValue
    }
  }
}
