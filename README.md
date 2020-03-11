# EmojiLogHandler

A custom LogHandler that uses emojis to represent log levels. It is meant to be used with [apple/swift-log](https://github.com/apple/swift-log).

## Getting Started

### Add the dependency in you `package.swift` file

add this to your `dependencies` list
```swift
.package(url: "https://github.com/SwiftMN/EmojiLogHandler.git", from: "1.1.0")
```

and of course add `"EmojiLogHandler"` to your list target dependencies
```swift
.target(name: "SweetProjectName", dependencies: ["EmojiLogHandler"]),
```

### Using Xcode

File > Swift Packages > Add Package Dependency...

Paste the url for this project when prompted
```
https://github.com/SwiftMN/EmojiLogHandler
```

## Setup

In your AppDelegate or SceneDelegate, bootstrap an instance of `EmojiLogHandler`.

```swift
LoggingSystem.bootstrap { label in
  EmojiLogHandler(label)
}
// make sure you bootstrap all handlers before setting logLevel
// logger.logLevel just forwards to the handlers that have been bootstrapped
logger.logLevel = .debug
```

Make sure you import the package, too
```swift
import EmojiLogHandler
```

## Usage

```
📋("This is a trace level message")   
🐛("This is a debug level message")   
🗣("This is an info level message")   
👀("This is a notice level message")   
💥("This is a warn level message")
💩("This is an error level message")
！("This is a critical level message")   
```


>📋 [TRACE] [FileName:45] This is a trace level message
🐛  [DEBUG] [FileName:46] This is a debug level message  
🗣  [INFO] [FileName:47] This is an info level message  
👀  [NOTICE] [FileName:48] This is a notice level message  
💥💥[WARN] [FileName:49] This is a warn level message  
💩💩[ERROR] [FileName:50] This is an error level message  
‼️‼️[CRITICAL] [FileName:51] This is a critical level message  

### Finding the right emojis

1. clone this repo or just download the code snippets in [etc/CodeSnippets](etc/CodeSnippets)  
1. run 
    ```
    cp etc/codeSnippets/* ~/Library/Developer/Xcode/UserData/CodeSnippets/
    ```
1. reopen Xcode and use the handy autocomplete code snippets. They match the log levels so just start typing `debug` and it will autofill for you. Super nice.

### Finding them the hard way

You can easily find these emojis by hitting `ctrl+cmd+space`. Once you use these they will be at the top of your list automatically. To find them the first time, hit `ctrl+cmd+space` and type "clipboard" to find 📋, "bug" to find "🐛", type "speak" to find "🗣", type "crash" to find "💥", and type "poop" to find "💩". I know what you're thinking... Why use the "crash" emoji for warn? Because the poop emoji is funnier. As in "Ahh shit! an error!"

## Customization

You can easily make custom logging functions which makes your logging more expressive and allows you to easily filter your logs for your own debugging purposes.

public func 🏅(_ message: @autoclosure () -> Logger.Message = #function, _ file: String = #file, _ line: UInt = #line, _ function: String = #function) {
  logger.info(message(), metadata: EmojiLogHandler.customPrefix("🏅  [SUCCESS]"), file: file, function: function, line: line)
}

Which you would then use like this

🏅("We totally made an API request")

>🏅 [SUCCESS] We totally made an API request

Or if you're trying to figure some things out by adding `print` messages everywhere, you can add a log message that allows you to easily filter for the things you're looking for. Just don't commit this 😉.

public func 🤔(_ message: @autoclosure () -> Logger.Message = #function, prefixedBy prefixes: [Logger.Metadata.Value] = [], _ file: String = #file, _ line: UInt = #line, _ function: String = #function) {
  logger.error(message(), metadata: EmojiLogHandler.customPrefix("🤔  [HMMMMM]"), file: file, function: function, line: line)
}

🤔("This is a custom message for Steve. He's trying to figure something out and promises not to commit this line 😊")

>🤔 [STEVE] This is a custom message for Steve. He's trying to figure something out and promises not to commit this line 😊

You can easily find these messages in the console by searching "[STEVE]"
