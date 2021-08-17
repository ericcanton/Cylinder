//
//  VectorFields.swift
//  
//
//  Created by Eric Canton on 8/7/21.
//

import Foundation
import _Differentiation

protocol VectorField {
  associatedtype Base: Peekable
  
  func value(at: Base) -> Base.TangentVector
}

struct LogisticAmplitude: VectorField {
  var attractingAmplitude: Double
  var thetaVelocity: Double
  
  func value(at point: Cylinder) -> Cylinder.TangentVector {
    Cylinder.TangentVector(point.height * (attractingAmplitude - point.height),
                           thetaVelocity)
  }
}
