//
//  Persistance.swift
//  CustomerDatabase
//
//  Created by 송하민 on 11/5/23.
//

import Foundation

/// CRUD
protocol Persistance {
  func create()
  func save()
  func update()
  func delete()
}
