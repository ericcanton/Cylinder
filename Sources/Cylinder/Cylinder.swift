//
//  Cylinder.swift
//  
//
//  Created by Eric Canton on 8/6/21.
//

import Foundation
import _Differentiation

struct Cylinder: Differentiable {
  var amplitude: Double
  var rotation: Circle
  
  struct TangentVector: Differentiable & AdditiveArithmetic {
    var dr, dtheta: Double
  }
  
  mutating func move(by: Self.TangentVector) {
    amplitude += by.dr
    rotation.theta += by.dtheta
  }
}

extension Cylinder: CustomStringConvertible {
  @noDerivative var description: String {
    var string = "Point at\n  amplitude: \(amplitude)\n  rotation: \(rotation)\n"
    string += "on a Cylinder of circumference \(rotation.circumference)."
    return string
  }
}

