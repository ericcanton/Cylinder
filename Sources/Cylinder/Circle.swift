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
  @noDerivative private var _circumference: Double
  
  var theta: Double {
    get {
      _t
    }
    
    set(newValue) {
      self._t = newValue.truncatingRemainder(dividingBy: _circumference)
    }
  }
  
  var circumference: Double {
    get {
      _circumference
    }
  }
  
  init(withLength: Double, pointAt: Double) {
    self._circumference = withLength
    self._t = pointAt.truncatingRemainder(dividingBy: withLength)
  }
}

extension Circle: Differentiable {
  mutating func move(by offset: Double) {
    _t = _t.truncatingRemainder(dividingBy: _circumference)
  }
}

extension Circle: CustomStringConvertible {
  @noDerivative var description: String {
    return "\(_t/_circumference )"
  }
}
