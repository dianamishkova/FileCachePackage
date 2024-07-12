//
//  JSONProtocol.swift
//  ToDoList
//
//  Created by Диана Мишкова on 12.07.24.
//

import Foundation

public protocol JSONProtocol {
    var json: Any { get }
    static func parse(json: Any) -> Self?
}
