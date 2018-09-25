//
//  Muller.swift
//  SwiftPrecision
//
//  Created by Gaël on 22/09/2018.
//  Copyright © 2018 Gaël Foppolo. All rights reserved.
//

import Foundation
import BigInt
import Fractional

public typealias FractionB = Fractional<BigInt>

public class Muller {

    private static func ffixed(y: Decimal, z: Decimal) -> Decimal {
        return 108 - (815-1500/z)/y
    }

    private static func ffloating<T: FloatingPoint>(y: T, z: T) -> T {
        return 108 - (815-1500/z)/y
    }

    private static func ffractional(y: Fraction, z: Fraction) -> Fraction {
        return 108 - (815-1500/z)/y
    }

    private static func ffractionalBig(y: FractionB, z: FractionB) -> FractionB {
        return FractionB(108) - (FractionB(815) - FractionB(1500)/z)/y
    }

    public static func fixedPoint(n: Int) -> [Decimal] {

        var xi: [Decimal] = [4, 4.25]

        guard n > 2 else {
            return xi
        }

        for i in 2..<n {
            xi.append(ffixed(y: xi[i-1], z: xi[i-2]))
        }

        return xi
    }

    public static func floattingPoint<T: FloatingPoint>(n: Int) -> [T] {

        var xi: [T] = [T(4), T(17)/T(4)]

        guard n > 2 else {
            return xi
        }

        for i in 2..<n {
            xi.append(ffloating(y: xi[i-1], z: xi[i-2]))
        }

        return xi
    }

    public static func fractionalPoint(n: Int) -> [Fraction] {

        var xi: [Fraction] = [Fraction(4), (Fraction(17) / Fraction(4))]

        guard n > 2 else {
            return xi
        }

        for i in 2..<n {
            xi.append(ffractional(y: xi[i-1], z: xi[i-2]))
        }

        return xi
    }

    public static func fractionalBigIntPoint(n: Int) -> [FractionB] {

        var xi: [FractionB] = [FractionB(4), (FractionB(17) / FractionB(4))]

        guard n > 2 else {
            return xi
        }

        for i in 2..<n {
            xi.append(ffractionalBig(y: xi[i-1], z: xi[i-2]))
        }

        return xi
    }

}
