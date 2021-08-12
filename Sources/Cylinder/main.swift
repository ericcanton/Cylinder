import _Differentiation

var cyl = Cylinder(amplitude: 0.8,
                   rotation: Circle(withLength: 24.0,
                                    pointAt: 8.0))

var field = LogisticAmplitude(attractingAmplitude: 0.9, thetaVelocity: 0.9)

for _ in (0...48) {
  cyl.move(by: field.value(at: cyl))
  print("R: \(cyl.amplitude), theta: \(cyl.rotation.theta)")
}
