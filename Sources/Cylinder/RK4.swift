//
//  RK4.swift
//  
//
//  Created by Eric Canton on 8/14/21.
//

import Foundation

func rk4Flow<T: VectorField>(y: T.Base, dt: Double, dy: T) -> T.Base
where T.Base.TangentVector: SIMD, T.Base.TangentVector.Scalar == Double {
  let halfDt = dt / 2.0
  let k1 = dy.value(at: y)
  let k2 = dy.value(at: y.moved(by: (halfDt * k1)))
  let k3 = dy.value(at: y.moved(by: (halfDt * k2)))
  let k4 = dy.value(at: y.moved(by: (dt * k3)))

  let twoK2 = 2.0 * k2
  let twoK3 = 2.0 * k3
  let totalShift = (dt / 6.0) * (k1 + twoK2 + twoK3 + k4)
  
  return y.moved(by: totalShift)
}

