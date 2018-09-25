//
//  BigInt+Extension.swift
//  SwiftPrecision
//
//  Created by Gaël on 22/09/2018.
//  Copyright © 2018 Gaël Foppolo. All rights reserved.
//

import Foundation
import BigInt
import Fractional

public extension Float80 {
    /// Create an instance initialized to `value`.
    public init(_ value: FractionB) {
        self.init(Float80(value.numerator) / Float80(value.denominator))
    }
}

public extension Decimal {
    public init?(_ value: BigInt) {
        self.init(string: String(value))
    }
    public init?(_ value: FractionB) {
        guard let numerator = Decimal(value.numerator) else { return nil }
        guard let denominator = Decimal(value.denominator) else { return nil }
        self.init(string: (numerator/denominator).description)
    }
}

extension Fractional: CustomPlaygroundDisplayConvertible where Number == BigInt {
    /// Return the playground quick look representation of this integer.
    public var playgroundDescription: Any {
        guard let decimal = Decimal(self)?.description else { return "" }
        return Double(decimal) as Any
    }
}

extension Decimal: CustomPlaygroundDisplayConvertible {
    /// Return the playground quick look representation of this integer.
    public var playgroundDescription: Any {
        return Double(self.description) as Any
    }
}
