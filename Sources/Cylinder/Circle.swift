//
//  Circle.swift
//  
//
//  Created by Eric Canton on 8/7/21.
//

import Foundation
import _Differentiation

struct Circle {
  private var _t: Double
  @noDerivative private var _length: Double
  
  var theta: Double {
    get {
      _t
    }
    
    set(newValue) {
      self._t = newValue.truncatingRemainder(dividingBy: _length)
    }
  }
  
  var circumference: Double {
    get {
      _length
    }
  }
  
  init(withLength: Double, withAngle: Double) {
    self._length = withLength
    self._t = withAngle.truncatingRemainder(dividingBy: withLength)
  }
}

extension Circle: Peekable {
  typealias TangentVector = Double
  
  mutating func move(by vector: Self.TangentVector) {
    theta += vector
  }
}

extension Circle: CustomStringConvertible {
  @noDerivative var description: String {
    return "\(_t/_length )"
  }
}
