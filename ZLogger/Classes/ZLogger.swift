//
//  ZLogger.swift
//  ZLogger
//
//  Created by peerapat atawatana on 19/4/2561 BE.
//

import Foundation

/// Enum for type of logging event.
public enum ZLoggerEventType: String {
  case error    = "[❤️ ERROR]"
  case info     = "[💙 INFO]"
  case debug    = "[💚 DEBUG]"
  case verbose  = "[💜 VERBOSE]"
  case warning  = "[💛 WARNING]"
}

/// ZLogger: An improved logger for iOS.
public class ZLogger {
  
  static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
  static var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = dateFormat
    formatter.locale = Locale.current
    formatter.timeZone = TimeZone.current
    return formatter
  }
  
  /**
   Log message.
   - parameter message: logging message.
   - parameter event: type of event.
   - parameter fileName: name of a file.
   - parameter line: line number.
   - parameter column: column number.
   - parameter funcName: name of function.
   */
  public class func log(message: Any,
                        event: ZLoggerEventType,
                        fileName: String = #file,
                        line: Int = #line,
                        column: Int = #column,
                        funcName: String = #function) {
    
    #if DEBUG
    print("\(Date().toString()) \(event.rawValue)[\(sourceFileName(filePath: fileName))]:\(line) \(column) \(funcName) ->", message)
    #endif
  }
  
  private class func sourceFileName(filePath: String) -> String {
    let components = filePath.components(separatedBy: "/")
    return components.isEmpty ? "" : components.last!
  }
}

/**
 A Shorthen Wrapper for ZLogger log Error.
 - parameter message: logging message.
 - parameter fileName: name of a file.
 - parameter line: line number.
 - parameter column: column number.
 - parameter funcName: name of function.
 */
public func loge(_ message: Any,
                 fileName: String = #file,
                 line: Int = #line,
                 column: Int = #column,
                 funcName: String = #function) {
  ZLogger.log(message: message,
              event: .error,
              fileName: fileName,
              line: line,
              column: column,
              funcName: funcName)
}

/**
 A Shorthen Wrapper for ZLogger log Info.
 - parameter message: logging message.
 - parameter fileName: name of a file.
 - parameter line: line number.
 - parameter column: column number.
 - parameter funcName: name of function.
 */
public func logi(_ message: Any,
                 fileName: String = #file,
                 line: Int = #line,
                 column: Int = #column,
                 funcName: String = #function) {
  ZLogger.log(message: message,
              event: .info,
              fileName: fileName,
              line: line,
              column: column,
              funcName: funcName)
}

/**
 A Shorthen Wrapper for ZLogger log Debug.
 - parameter message: logging message.
 - parameter fileName: name of a file.
 - parameter line: line number.
 - parameter column: column number.
 - parameter funcName: name of function.
 */
public func logd(_ message: Any,
                 fileName: String = #file,
                 line: Int = #line,
                 column: Int = #column,
                 funcName: String = #function) {
  ZLogger.log(message: message,
              event: .debug,
              fileName: fileName,
              line: line,
              column: column,
              funcName: funcName)
}

/**
 A Shorthen Wrapper for ZLogger log Verbose.
 - parameter message: logging message.
 - parameter fileName: name of a file.
 - parameter line: line number.
 - parameter column: column number.
 - parameter funcName: name of function.
 */
public func logv(_ message: Any,
                 fileName: String = #file,
                 line: Int = #line,
                 column: Int = #column,
                 funcName: String = #function) {
  ZLogger.log(message: message,
              event: .verbose,
              fileName: fileName,
              line: line,
              column: column,
              funcName: funcName)
}

/**
 A Shorthen Wrapper for ZLogger log Warning.
 - parameter message: logging message.
 - parameter fileName: name of a file.
 - parameter line: line number.
 - parameter column: column number.
 - parameter funcName: name of function.
 */
public func logw(_ message: Any,
                 fileName: String = #file,
                 line: Int = #line,
                 column: Int = #column,
                 funcName: String = #function) {
  ZLogger.log(message: message,
              event: .warning,
              fileName: fileName,
              line: line,
              column: column,
              funcName: funcName)
}

internal extension Date {
  func toString() -> String {
    return ZLogger.dateFormatter.string(from: self as Date)
  }
}
