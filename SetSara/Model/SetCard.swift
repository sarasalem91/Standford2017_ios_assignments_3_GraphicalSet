//
//  SetCard.swift
//  SetSara
//
//  Created by Sarah Mohamed on 6/25/21.
//

import Foundation

// color, number, shape, and shading // ▲●■
// data structure
struct SetCard:CustomStringConvertible {
    
    var description: String{
        return "\(shape) \(number) \(color) \(shading)"
    }
    
    
    var shape : Shape
    var number : Number
    var color : Color
    var shading : Shading
    
    
    var isSelected:Bool = false
    var isMakeSet:Bool = false
    
    
    enum Shape:String,CustomStringConvertible{
        var description: String{
            return rawValue
        }
        
        case squiggle
        case oval
        case diamond
        
        static var all = [Shape.squiggle,.oval,.diamond]
    }
    enum Color:String,CustomStringConvertible{
        var description: String{
            return rawValue
        }
        case red
        case green
        case purple
        
        static var all = [Color.red,.green,.purple]
    }
    enum Shading:String,CustomStringConvertible{
        var description: String{
            return rawValue
        }
        case striped
        case solid
        case unfilled
        
        static var all = [Shading.striped,.solid,.unfilled]
    }
    enum Number:Int,CustomStringConvertible{
        var description: String{
            return "\(rawValue)"
        }
        case one = 1
        case two = 2
        case three = 3
        
        static var all = [Number.one,.two,.three]
    }
}

extension SetCard : Equatable {
    
    static func ==(lhs:SetCard,rhs:SetCard) -> Bool{
        return lhs.color == rhs.color &&
        lhs.shape == rhs.shape &&
        lhs.shading == rhs.shading &&
        lhs.number == rhs.number
    }
    
}
