//
//  AppDataBase.swift
//  CustomerDatabase
//
//  Created by 송하민 on 11/5/23.
//

import Foundation
import GRDB

struct AppDataBase {
  
  // MARK: - private properties
  
  private let dbWriter: any DatabaseWriter
  
  
  // MARK: - internal properties
  
  static let shared = makeShared()
  
  
  // MARK: - life cycle
  
  init(_ writer: any DatabaseWriter) {
    self.dbWriter = writer
  }
  
  
  // MARK: - private method
  
  private static func makeShared() -> AppDataBase {
    do {
      let fileManager = FileManager.default
      let appSupportURL = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
      let directoryURL = appSupportURL.appendingPathComponent("Database", isDirectory: true)
      try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true)
      
      let databaseURL = directoryURL.appendingPathComponent("db.sqlite")
      NSLog("Database stored at \(databaseURL.path)")
      let dbPool = try DatabasePool(path: databaseURL.path, configuration: Configuration())
      
      let appDatabase = AppDataBase(dbPool)
      
      return appDatabase
    } catch {
      fatalError("cannot make AppDataBase")
    }
    
  }
  
}
