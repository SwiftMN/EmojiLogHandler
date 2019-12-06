import Logging

public var logger: Logger = Logger(label: "mn.swift.EmojiLogHandler")

/** trace logging
 - Parameter message: The message you want to log
 
 ```
 📋("my message")
 ```
 > 📋 [TRACE] [MyClass:lineNumber] my message
 */
public func 📋(_ message: @autoclosure () -> Logger.Message = #function, _ file: String = #file, _ line: UInt = #line, _ function: String = #function) {
  logger.trace(message(), file: file, function: function, line: line)
}

/** debug logging
 - Parameter message: The message you want to log
 
 🐛("my message")
 > 🐛 [DEBUG] [MyClass:lineNumber] my message
 */
public func 🐛(_ message: @autoclosure () -> Logger.Message = #function, _ file: String = #file, _ line: UInt = #line, _ function: String = #function) {
  logger.debug(message(), file: file, function: function, line: line)
}

/** info logging
 - Parameter message: The message you want to log
 
 🗣("my message")
 > 🗣 [INFO] [MyClass:lineNumber] my message
 */
public func 🗣(_ message: @autoclosure () -> Logger.Message = #function, _ file: String = #file, _ line: UInt = #line, _ function: String = #function) {
  logger.info(message(), file: file, function: function, line: line)
}

/** notice logging
 - Parameter message: The message you want to log
 
 👀("my message")
 > 👀  [NOTICE] [MyClass:lineNumber] my message
 */
public func 👀(_ message: @autoclosure () -> Logger.Message = #function, _ file: String = #file, _ line: UInt = #line, _ function: String = #function) {
  logger.notice(message(), file: file, function: function, line: line)
}

/** warn logging
 - Parameter message: The message you want to log
 
 💥("my message")
 > 💥💥[WARN] [MyClass:lineNumber] my message
 */
public func 💥(_ message: @autoclosure () -> Logger.Message = #function, _ file: String = #file, _ line: UInt = #line, _ function: String = #function) {
  logger.warning(message(), file: file, function: function, line: line)
}

/** error logging
 - Parameter message: The message you want to log
 
 💩("my message")
 > 💩💩[ERROR] [MyClass:lineNumber] my message
 */
public func 💩(_ message: @autoclosure () -> Logger.Message = #function, _ file: String = #file, _ line: UInt = #line, _ function: String = #function) {
  logger.error(message(), file: file, function: function, line: line)
}

/** critical logging
 - Parameter message: The message you want to log
 
 ！("my message")
 > ‼️‼️[CRITICAL] [MyClass:lineNumber] my message
 */
public func ！(_ message: @autoclosure () -> Logger.Message = #function, _ file: String = #file, _ line: UInt = #line, _ function: String = #function) {
  logger.critical(message(), file: file, function: function, line: line)
}
