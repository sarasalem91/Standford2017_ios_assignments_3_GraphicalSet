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
    var shape : String = "oval" {didSet{setNeedsDisplay()}}
    @IBInspectable
    var number : CGFloat = 3 {didSet{setNeedsDisplay()}}
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
        
        if number == 1{
            var oval_radius = bounds.width/4
            var oval_mid_y = bounds.midY
            
            path.move(to: CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y - oval_radius))
            path.addLine(to: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y - oval_radius))
            path.addArc(withCenter: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y), radius: oval_radius, startAngle:-CGFloat.pi/2, endAngle: -(3/2)*CGFloat.pi, clockwise: true)
            
            path.addLine(to:  CGPoint(x: (oval_radius+constraint_distance), y: oval_mid_y + oval_radius))
            path.addArc(withCenter:CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y), radius: oval_radius, startAngle: -(3/2)*CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
           
            path.lineWidth = 3
        
            if shading ==  "solid"{
                color.setFill()
                path.fill()
            }else if shading ==  "striped"{
                
                var const_distance:CGFloat = 10
                var distanceBetween_stripped_lines:CGFloat = const_distance
                var looping_distance:CGFloat = bounds.width - 2*constraint_distance
                
                for x in 0...Int(looping_distance/distanceBetween_stripped_lines){
                    
                    path.move(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: 0))
                    path.addLine(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: bounds.maxY ))
                    
                    distanceBetween_stripped_lines += const_distance
                }
                
                
                path.addClip()
                color.setStroke()
                path.stroke()
                
                
            }else{ //unfilled
                color.setStroke()
                path.stroke()
            }
            
        }else if number == 2{
            
            var first_drawing_height = bounds.height / number
            
            // first
            var oval_radius = bounds.width/8
            var oval_mid_y = bounds.height / 4
            
            path.move(to: CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y - oval_radius))
            path.addLine(to: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y - oval_radius))
            path.addArc(withCenter: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y), radius: oval_radius, startAngle:-CGFloat.pi/2, endAngle: -(3/2)*CGFloat.pi, clockwise: true)
            
            path.addLine(to:  CGPoint(x: (oval_radius+constraint_distance), y: oval_mid_y + oval_radius))
            path.addArc(withCenter:CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y), radius: oval_radius, startAngle: -(3/2)*CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
            
            // second
            oval_mid_y =  first_drawing_height + bounds.height / 4
            
            path.move(to: CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y - oval_radius))
            path.addLine(to: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y - oval_radius))
            path.addArc(withCenter: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y), radius: oval_radius, startAngle:-CGFloat.pi/2, endAngle: -(3/2)*CGFloat.pi, clockwise: true)
            
            path.addLine(to:  CGPoint(x: (oval_radius+constraint_distance), y: oval_mid_y + oval_radius))
            path.addArc(withCenter:CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y), radius: oval_radius, startAngle: -(3/2)*CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
           
            path.lineWidth = 3
        
            if shading ==  "solid"{
                color.setFill()
                path.fill()
            }else if shading ==  "striped"{
                
                var const_distance:CGFloat = 10
                var distanceBetween_stripped_lines:CGFloat = const_distance
                var looping_distance:CGFloat = bounds.width - 2*constraint_distance
                
                for x in 0...Int(looping_distance/distanceBetween_stripped_lines){
                    
                    path.move(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: 0))
                    path.addLine(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: bounds.maxY ))
                    
                    distanceBetween_stripped_lines += const_distance
                }
                
                
                path.addClip()
                color.setStroke()
                path.stroke()
                
                
            }else{ //unfilled
                color.setStroke()
                path.stroke()
            }
            else if number == 2{
                
                var first_drawing_height = bounds.height / number
                
                // first
                var oval_radius = bounds.width/8
                var oval_mid_y = bounds.height / 4
                
                path.move(to: CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y - oval_radius))
                path.addLine(to: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y - oval_radius))
                path.addArc(withCenter: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y), radius: oval_radius, startAngle:-CGFloat.pi/2, endAngle: -(3/2)*CGFloat.pi, clockwise: true)
                
                path.addLine(to:  CGPoint(x: (oval_radius+constraint_distance), y: oval_mid_y + oval_radius))
                path.addArc(withCenter:CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y), radius: oval_radius, startAngle: -(3/2)*CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
                
                // second
                oval_mid_y =  first_drawing_height + bounds.height / 4
                
                path.move(to: CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y - oval_radius))
                path.addLine(to: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y - oval_radius))
                path.addArc(withCenter: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y), radius: oval_radius, startAngle:-CGFloat.pi/2, endAngle: -(3/2)*CGFloat.pi, clockwise: true)
                
                path.addLine(to:  CGPoint(x: (oval_radius+constraint_distance), y: oval_mid_y + oval_radius))
                path.addArc(withCenter:CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y), radius: oval_radius, startAngle: -(3/2)*CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
               
                path.lineWidth = 3
            
                if shading ==  "solid"{
                    color.setFill()
                    path.fill()
                }else if shading ==  "striped"{
                    
                    var const_distance:CGFloat = 10
                    var distanceBetween_stripped_lines:CGFloat = const_distance
                    var looping_distance:CGFloat = bounds.width - 2*constraint_distance
                    
                    for x in 0...Int(looping_distance/distanceBetween_stripped_lines){
                        
                        path.move(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: 0))
                        path.addLine(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: bounds.maxY ))
                        
                        distanceBetween_stripped_lines += const_distance
                    }
                    
                    
                    path.addClip()
                    color.setStroke()
                    path.stroke()
                    
                    
                }else{ //unfilled
                    color.setStroke()
                    path.stroke()
                }
                
            }else if number == 2{
                
                var first_drawing_height = bounds.height / number
                
                // first
                var oval_radius = bounds.width/8
                var oval_mid_y = bounds.height / 4
                
                path.move(to: CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y - oval_radius))
                path.addLine(to: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y - oval_radius))
                path.addArc(withCenter: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y), radius: oval_radius, startAngle:-CGFloat.pi/2, endAngle: -(3/2)*CGFloat.pi, clockwise: true)
                
                path.addLine(to:  CGPoint(x: (oval_radius+constraint_distance), y: oval_mid_y + oval_radius))
                path.addArc(withCenter:CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y), radius: oval_radius, startAngle: -(3/2)*CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
                
                // second
                oval_mid_y =  first_drawing_height + bounds.height / 4
                
                path.move(to: CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y - oval_radius))
                path.addLine(to: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y - oval_radius))
                path.addArc(withCenter: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y), radius: oval_radius, startAngle:-CGFloat.pi/2, endAngle: -(3/2)*CGFloat.pi, clockwise: true)
                
                path.addLine(to:  CGPoint(x: (oval_radius+constraint_distance), y: oval_mid_y + oval_radius))
                path.addArc(withCenter:CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y), radius: oval_radius, startAngle: -(3/2)*CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
               
                path.lineWidth = 3
            
                if shading ==  "solid"{
                    color.setFill()
                    path.fill()
                }else if shading ==  "striped"{
                    
                    var const_distance:CGFloat = 10
                    var distanceBetween_stripped_lines:CGFloat = const_distance
                    var looping_distance:CGFloat = bounds.width - 2*constraint_distance
                    
                    for x in 0...Int(looping_distance/distanceBetween_stripped_lines){
                        
                        path.move(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: 0))
                        path.addLine(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: bounds.maxY ))
                        
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
            
           
            path.lineWidth = 3
        
            if shading ==  "solid"{
                color.setFill()
                path.fill()
            }else if shading ==  "striped"{
                
                var const_distance:CGFloat = 10
                var distanceBetween_stripped_lines:CGFloat = const_distance
                var looping_distance:CGFloat = bounds.width - 2*constraint_distance
                
                for x in 0...Int(looping_distance/distanceBetween_stripped_lines){
                    
                    path.move(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: 0))
                    path.addLine(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: bounds.maxY ))
                    
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
    func draw_diamond(){
        let path = UIBezierPath()//(roundedRect: bounds, cornerRadius: 10)
       
        
        if number == 1{
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
                    
                    path.move(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: 0))
                    path.addLine(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: bounds.maxY ))
                    
                    distanceBetween_stripped_lines += const_distance
                }
                
                
                path.addClip()
                color.setStroke()
                path.stroke()
                
                
            }else{ //unfilled
                color.setStroke()
                path.stroke()
            }
            
        }else  if number == 2{
            
            var first_drawing_height = bounds.height / number
            
            //first
            path.move(to: CGPoint(x: bounds.midX, y: constraint_distance))
            path.addLine(to: CGPoint(x: (bounds.width-constraint_distance), y: first_drawing_height/2))
            path.addLine(to: CGPoint(x: bounds.midX, y: (first_drawing_height-constraint_distance)))
            path.addLine(to: CGPoint(x: constraint_distance, y:  first_drawing_height/2))
            path.addLine(to: CGPoint(x: bounds.midX, y: constraint_distance))
            
            
            //second
            path.move(to: CGPoint(x: bounds.midX, y: (first_drawing_height + constraint_distance)))
            path.addLine(to: CGPoint(x: (bounds.width-constraint_distance), y: (bounds.height * 0.75)))
            path.addLine(to: CGPoint(x: bounds.midX, y: (bounds.height-constraint_distance)))
            path.addLine(to: CGPoint(x: constraint_distance, y:  (bounds.height * 0.75)))
            path.addLine(to: CGPoint(x: bounds.midX, y: (first_drawing_height + constraint_distance)))
//
            
            
            path.lineWidth = 3
            
            
            if shading ==  "solid"{
                color.setFill()
                path.fill()
            }else if shading ==  "striped"{
                
                var const_distance:CGFloat = 10
                var distanceBetween_stripped_lines:CGFloat = const_distance
                var looping_distance:CGFloat = bounds.width - 2*constraint_distance
                
                for x in 0...Int(looping_distance/distanceBetween_stripped_lines){
                    
                    path.move(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: 0))
                    path.addLine(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: bounds.maxY ))
                    
                    distanceBetween_stripped_lines += const_distance
                }
                
                
                path.addClip()
                color.setStroke()
                path.stroke()
                
                
            }else{ //unfilled
                color.setStroke()
                path.stroke()
            }
            
            
            
        }else  if number == 3{
            
            var first_drawing_height = bounds.height / number
            
            //first
            path.move(to: CGPoint(x: bounds.midX, y: constraint_distance))
            path.addLine(to: CGPoint(x: (bounds.width-constraint_distance), y: first_drawing_height/2))
            path.addLine(to: CGPoint(x: bounds.midX, y: (first_drawing_height-constraint_distance)))
            path.addLine(to: CGPoint(x: constraint_distance, y:  first_drawing_height/2))
            path.addLine(to: CGPoint(x: bounds.midX, y: constraint_distance))
            
            
            //second
            path.move(to: CGPoint(x: bounds.midX, y: (first_drawing_height + constraint_distance)))
            path.addLine(to: CGPoint(x: (bounds.width-constraint_distance), y: (bounds.height * 0.5)))
            path.addLine(to: CGPoint(x: bounds.midX, y: (bounds.height*(2/3)-constraint_distance)))
            path.addLine(to: CGPoint(x: constraint_distance, y:  (bounds.height * 0.5)))
            path.addLine(to: CGPoint(x: bounds.midX, y: (first_drawing_height + constraint_distance)))

            //third
            path.move(to: CGPoint(x: bounds.midX, y: (bounds.height*(2/3) + constraint_distance)))
            path.addLine(to: CGPoint(x: (bounds.width-constraint_distance), y: (bounds.height*(5/6))))
            path.addLine(to: CGPoint(x: bounds.midX, y: (bounds.height-constraint_distance)))
            path.addLine(to: CGPoint(x: constraint_distance, y:  (bounds.height*(5/6))))
            path.addLine(to: CGPoint(x: bounds.midX, y: (bounds.height*(2/3) + constraint_distance)))
            
            path.lineWidth = 3
            
            
            if shading ==  "solid"{
                color.setFill()
                path.fill()
            }else if shading ==  "striped"{
                
                var const_distance:CGFloat = 10
                var distanceBetween_stripped_lines:CGFloat = const_distance
                var looping_distance:CGFloat = bounds.width - 2*constraint_distance
                
                for x in 0...Int(looping_distance/distanceBetween_stripped_lines){
                    
                    path.move(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: 0))
                    path.addLine(to: CGPoint(x: (constraint_distance + distanceBetween_stripped_lines), y: bounds.maxY ))
                    
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
}
