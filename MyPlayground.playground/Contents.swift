import Foundation
import SwiftPrecisionFramework
import BigInt
import Fractional

let N: Int = 50
let maxNFraction: Int = 25
let floatting: [Double] = Muller.floattingPoint(n: N)
let fixed = Muller.fixedPoint(n: N)
let fractional: [Fractional] = Muller.fractionalPoint(n: maxNFraction)
let fractionalBig: [FractionB] = Muller.fractionalBigIntPoint(n: N)

for i in 0..<N {
    let float = floatting[i]
    let fix = fixed[i]
    let fraction = i < maxNFraction ? fractional[i].description : "ERR"
    let fractionBig = fractionalBig[i]
    print(String(format: "%i %@ %@ %@ %@ (~%@)", i, float.description, fix.description, fraction.description, fractionBig.description, Decimal(fractionBig)?.description ?? ""))
}
