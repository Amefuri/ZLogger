//
//  ZLogger.swift
//  ZLogger
//
//  Created by peerapat atawatana on 19/4/2561 BE.
//

import Foundation


public enum ZLoggerEventType: String {
  case error    = "[❤️ ERROR]" // Error
  case info     = "[💙 INFO]" // Info
  case debug    = "[💚 DEBUG]" // Debug
  case verbose  = "[💜 VERBOSE]" // Verbose
  case warning  = "[💛 WARNING]" // Warning
}

public class ZLogger {
  
  static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
  static var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = dateFormat
    formatter.locale = Locale.current
    formatter.timeZone = TimeZone.current
    return formatter
  }
  
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
