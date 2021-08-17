//
//  Peekable.swift
//  
//
//  Created by Eric Canton on 8/14/21.
//

import Foundation
import _Differentiation

protocol Peekable: Differentiable {}

extension Peekable {
  func moved(by vector: Self.TangentVector) -> Self {
    var new = self
    new.move(by: vector)
    
    return new
  }
}
