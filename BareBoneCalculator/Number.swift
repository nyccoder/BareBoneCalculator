//
//  Number.swift
//  Calculatte
//
//  Created by window11 on 2/10/22.
//

import Foundation

enum NumTrait
{
    case whole , decimal
}

struct Number : Identifiable , MathTool
{
    let id : UUID
    enum Polarity
    {
        case positive , negative
    }
    
    let data : String
    
    let trait : NumTrait
    let polarity : Polarity
    
    init ()
    {
        self.id = UUID()
        self.data = ""
        self.trait = .whole
        self.polarity = .positive
    }
    
    init (val : String , trait : NumTrait? = nil)
    {
        self.id = UUID()
        self.data = val
        
        var numTrait : NumTrait = .decimal
        switch trait
        {
        case .whole:
            numTrait = .whole
        case .decimal:
            numTrait = .decimal
        case nil:
            numTrait = val.contains(".") ? .decimal : .whole
        }
        self.trait = numTrait
        
        let polarity : Polarity
        switch self.data
        {
        case let pos where pos.hasPrefix("+") :
            polarity = .positive
        case let neg where neg.hasPrefix("-") :
            polarity = .negative
        default : polarity = .positive
        }
        self.polarity = polarity
    }
    
    static func + (lhs: Number , rhs: Number) -> Number
    {
        var trait : NumTrait = .decimal
        switch true
        {
        case lhs.trait == .whole && rhs.trait == .whole :
            trait = .whole
        default : break
        }
        
        var ansStr = ""
        switch trait
        {
        case .whole:
            if let left = Int(lhs.data) , let right = Int(rhs.data)
            {
                let ans = left + right
                ansStr = "\(ans)"
                
            }

        case .decimal:
            if let left = Float(lhs.data) , let right = Float(rhs.data)
            {
                let ans = left + right
                ansStr = "\(ans)"
            }
        }
        
        let num = Number(val: ansStr, trait: trait)
        
        return num
    }
    
    static func - (lhs: Number , rhs: Number) -> Number
    {
        var trait : NumTrait = .decimal
        switch true
        {
        case lhs.trait == .whole && rhs.trait == .whole :
            trait = .whole

        default : break
        }
        
        var ansStr = ""
        switch trait
        {
        case .whole:
            if let left = Int(lhs.data) , let right = Int(rhs.data)
            {
                let ans = left - right
                ansStr = "\(ans)"
            }

        case .decimal:
            if let left = Float(lhs.data) , let right = Float(rhs.data)
            {
                let ans = left - right
                ansStr = "\(ans)"
            }
        }
        
        let num = Number(val: ansStr, trait: trait)
        
        return num
    }
    
    static func * (lhs: Number , rhs: Number) -> Number
    {
        var trait : NumTrait = .decimal
        switch true
        {
        case lhs.trait == .whole && rhs.trait == .whole :
            trait = .whole

        default : break
        }
        
        var ansStr = ""
        switch trait
        {
        case .whole:
            if let left = Int(lhs.data) , let right = Int(rhs.data)
            {
                let ans = left * right
                ansStr = "\(ans)"
                
            }

        case .decimal:
            if let left = Float(lhs.data) , let right = Float(rhs.data)
            {
                let ans = left * right
                ansStr = "\(ans)"
            }
        }
        
        let num = Number(val: ansStr, trait: trait)
        
        return num
    }
    
    static func / (lhs: Number , rhs: Number) -> Number
    {
        var trait : NumTrait = .decimal
        switch true
        {
        case lhs.trait == .whole && rhs.trait == .whole :
            trait = .whole

        default : break
        }
        
        var ansStr = ""
        switch trait
        {
        case .whole:
            if let left = Int(lhs.data) , let right = Int(rhs.data)
            {
                if (left % right == 0)
                {
                    let ans = left / right
                    ansStr = "\(ans)"
                }
                else
                {
                    let ans : Float = Float(left) / Float(right)
                    trait = .decimal
                    ansStr = "\(ans)"
                }

            }

        case .decimal:
            if let left = Float(lhs.data) , let right = Float(rhs.data)
            {
                let ans = left / right
                ansStr = "\(ans)"
            }
        }
        
        let num = Number(val: ansStr, trait: trait)
        
        return num
    }
}
