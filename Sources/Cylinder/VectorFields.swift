//
//  VectorFields.swift
//  
//
//  Created by Eric Canton on 8/7/21.
//

import Foundation
import _Differentiation

protocol VectorField {
  associatedtype Base: Differentiable
  
  func value(at: Base) -> Base.TangentVector
}

struct LogisticAmplitude: VectorField {
  var attractingAmplitude: Double
  var thetaVelocity: Double
  
  func value(at point: Cylinder) -> Cylinder.TangentVector {
    Cylinder.TangentVector(dr: point.amplitude * (attractingAmplitude - point.amplitude),
                           dtheta: thetaVelocity)
  }
}
