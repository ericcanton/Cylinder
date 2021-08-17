//
//  Cylinder.swift
//  
//
//  Created by Eric Canton on 8/6/21.
//

import Foundation
import _Differentiation

struct Cylinder: Peekable {
  
  typealias TangentVector = SIMD2<Double>
  
  var height: Double
  var rotation: Circle
  
  mutating func move(by vector: TangentVector) {
    height += vector.x
    rotation.move(by: vector.y)
  }
}

extension Cylinder: CustomStringConvertible {
  @noDerivative var description: String {
    var string = "Point at\n  height: \(height)\n  angle: \(rotation)\n"
    string += "on a Cylinder of circumference \(rotation.circumference)."
    return string
  }
}

