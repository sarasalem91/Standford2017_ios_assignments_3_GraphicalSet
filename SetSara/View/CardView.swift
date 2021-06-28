//
//  CardView.swift
//  SetSara
//
//  Created by OSX 12 on 6/28/21.
//

import UIKit


@IBDesignable
class CardView: UIView {
    @IBInspectable
    var shape : String = "diamond" {didSet{setNeedsDisplay()}}
    @IBInspectable
    var number : Int = 1 {didSet{setNeedsDisplay()}}
    @IBInspectable
    var color : UIColor = UIColor.red {didSet{setNeedsDisplay()}}
    @IBInspectable
    var shading : String = "striped" {didSet{setNeedsDisplay()}}
    
    var constraint_distance : CGFloat = 16
    
    //redraw when bounds change
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay()
        setNeedsLayout()
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
        
        switch shape {
        case "squiggle":
            draw_squiggle()
            break
            
            
        case "oval":
            draw_oval()
            break
            
            
        case "diamond":
            draw_diamond()
            break
            
        default: break
        }
        
        
    }
    
    func draw_squiggle(){
        let path = UIBezierPath()
        path.addClip()
        
        
    }
    func draw_oval(){
        let path = UIBezierPath()
        path.addClip()
        
        
    }
    func draw_diamond(){
        let path = UIBezierPath()//(roundedRect: bounds, cornerRadius: 10)
       
        
        
        path.move(to: CGPoint(x: bounds.midX, y: constraint_distance))
        path.addLine(to: CGPoint(x: (bounds.width-constraint_distance), y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.midX, y: (bounds.height-constraint_distance)))
        path.addLine(to: CGPoint(x: constraint_distance, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.midX, y: constraint_distance))
        path.lineWidth = 3
        
       
        if shading ==  "solid"{
            color.setFill()
            path.fill()
        }else if shading ==  "striped"{
            
            var const_distance:CGFloat = 10
            var distanceBetween_stripped_lines:CGFloat = const_distance
            var looping_distance:CGFloat = bounds.width - 2*constraint_distance
            
            for x in 0...Int(looping_distance/distanceBetween_stripped_lines){
                
                path.move(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: (bounds.midY - distanceBetween_stripped_lines)))
                path.addLine(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: (bounds.midY + distanceBetween_stripped_lines) ))
                
                distanceBetween_stripped_lines += const_distance
            }
            
            
            path.addClip()
            color.setStroke()
            path.stroke()
            
            
        }else{ //unfilled
            color.setStroke()
            path.stroke()
        }
        
        
       
       
    }
}
