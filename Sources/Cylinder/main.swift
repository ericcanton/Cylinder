import _Differentiation

var cyl = Cylinder(height: 0.8,
                   rotation: Circle(withLength: 24.0,
                                    withAngle: 8.0))

var field = LogisticAmplitude(attractingAmplitude: 0.9, thetaVelocity: 0.9)

print("Naive movement:")
for _ in (0...48) {
  cyl.move(by: field.value(at: cyl))
  print("R: \(cyl.height), theta: \(cyl.rotation.theta)")
}

// Reset
cyl.height = 0.8
cyl.rotation.theta = 8.0

print("RK4 flow:")

let dt = 0.25
let dtPerHour = Int(1.0/dt)

for i in (0...(dtPerHour*48)) {
  cyl = rk4Flow(y: cyl, dt: dt, dy: field)
  
  if (i % dtPerHour == 0) {
    print("R: \(cyl.height), theta: \(cyl.rotation.theta)")
  }
}
