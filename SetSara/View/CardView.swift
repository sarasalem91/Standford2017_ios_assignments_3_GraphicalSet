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
    var shape : String = "squiggle" {didSet{setNeedsDisplay()}}
    @IBInspectable
    var number : CGFloat = 2 {didSet{setNeedsDisplay()}}
    @IBInspectable
    var color : UIColor = UIColor.red {didSet{setNeedsDisplay()}}
    @IBInspectable
    var shading : String = "unfilled" {didSet{setNeedsDisplay()}}
    
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
        
        if number == 1{
            
            path.move(to: CGPoint(x: 2*constraint_distance, y: bounds.height/4))
            let cp1 =  CGPoint(x: bounds.width/2, y: 0)
            let cp2 =  CGPoint(x: bounds.width/2, y: 0.75*bounds.height)
            
            path.addCurve(to: CGPoint(x: (bounds.width-2*constraint_distance), y: bounds.height/4), controlPoint1: cp1, controlPoint2: cp2)
            
            path.addQuadCurve(to: CGPoint(x: bounds.width-3*constraint_distance, y: 0.75*bounds.height), controlPoint:CGPoint(x: bounds.maxX, y:bounds.midY))
            
            let cp11 =  CGPoint(x: bounds.width/2, y: bounds.maxY)
            let cp22 =  CGPoint(x: bounds.width/2, y: bounds.height/4)
            path.addCurve(to: CGPoint(x: (2*constraint_distance), y: 0.75*bounds.height), controlPoint1: cp11, controlPoint2: cp22)
            
            
            path.addQuadCurve(to: CGPoint(x: 2*constraint_distance, y: bounds.height/4), controlPoint:CGPoint(x: bounds.minX, y: bounds.midY))
            
            
            
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
          
            //first
            path.move(to: CGPoint(x: 2*constraint_distance, y: bounds.height/8))
            let cp1 =  CGPoint(x: bounds.width/2, y: 0)
            let cp2 =  CGPoint(x: bounds.width/2, y: (3/8)*bounds.height)
            
            path.addCurve(to: CGPoint(x: (bounds.width-2*constraint_distance), y: bounds.height/8), controlPoint1: cp1, controlPoint2: cp2)
            
            path.addQuadCurve(to: CGPoint(x: bounds.width-3*constraint_distance, y: (3/8)*bounds.height), controlPoint:CGPoint(x: bounds.maxX, y:bounds.height/8))
            
            let cp11 =  CGPoint(x: bounds.width/2, y: bounds.height/2)
            let cp22 =  CGPoint(x: bounds.width/2, y: bounds.height/8)
            path.addCurve(to: CGPoint(x: (2*constraint_distance), y: (3/8)*bounds.height), controlPoint1: cp11, controlPoint2: cp22)
            
            path.addQuadCurve(to: CGPoint(x: 2*constraint_distance, y: bounds.height/8), controlPoint:CGPoint(x: bounds.minX, y: (3/8)*bounds.height))
            
            
            //second
            path.move(to: CGPoint(x: 2*constraint_distance, y: bounds.height*(5/8)))
            let scp1 =  CGPoint(x: bounds.width/2, y: bounds.height/2)
            let scp2 =  CGPoint(x: bounds.width/2, y: bounds.height)
            
            path.addCurve(to: CGPoint(x: (bounds.width-2*constraint_distance), y: bounds.height*(5/8)), controlPoint1: scp1, controlPoint2: scp2)
            
            path.addQuadCurve(to: CGPoint(x: bounds.width-3*constraint_distance, y: bounds.height*(7/8)), controlPoint:CGPoint(x: bounds.maxX, y:bounds.height*(3/4)))
            
            let scp11 =  CGPoint(x: bounds.width/2, y: bounds.maxY)
            let scp22 =  CGPoint(x: bounds.width/2, y: (3/4)*bounds.height)
            path.addCurve(to: CGPoint(x: (2*constraint_distance), y: (7/8)*bounds.height), controlPoint1: scp11, controlPoint2: scp22)
            
            path.addQuadCurve(to: CGPoint(x: 2*constraint_distance, y: (5/8)*bounds.height), controlPoint:CGPoint(x: bounds.minX, y: bounds.height*(3/4)))
            
            
            
            
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
            
            //first
            path.move(to: CGPoint(x: 2*constraint_distance, y: bounds.height/12))
            let cp1 =  CGPoint(x: bounds.width/2, y: 0)
            let cp2 =  CGPoint(x: bounds.width/2, y: (1/3)*bounds.height)
            
            path.addCurve(to: CGPoint(x: (bounds.width-2*constraint_distance), y: bounds.height/12), controlPoint1: cp1, controlPoint2: cp2)
            
            path.addQuadCurve(to: CGPoint(x: bounds.width-3*constraint_distance, y: (1/4)*bounds.height), controlPoint:CGPoint(x: bounds.maxX, y:bounds.height/6))
            
            let cp11 =  CGPoint(x: bounds.width/2, y: bounds.height/3)
            let cp22 =  CGPoint(x: bounds.width/2, y: 0)
            path.addCurve(to: CGPoint(x: (2*constraint_distance), y: (1/4)*bounds.height), controlPoint1: cp11, controlPoint2: cp22)
            
            path.addQuadCurve(to: CGPoint(x: 2*constraint_distance, y: bounds.height/12), controlPoint:CGPoint(x: bounds.minX, y: (1/6)*bounds.height))
            
            
            //second
            path.move(to: CGPoint(x: 2*constraint_distance, y: bounds.height*(5/12)))
            let scp1 =  CGPoint(x: bounds.width/2, y: bounds.height/3)
            let scp2 =  CGPoint(x: bounds.width/2, y: bounds.height*(2/3))

            path.addCurve(to: CGPoint(x: (bounds.width-2*constraint_distance), y: bounds.height*(5/12)), controlPoint1: scp1, controlPoint2: scp2)

            path.addQuadCurve(to: CGPoint(x: bounds.width-3*constraint_distance, y: bounds.height*(7/12)), controlPoint:CGPoint(x: bounds.maxX, y:bounds.height*(1/2)))

            let scp11 =  CGPoint(x: bounds.width/2, y: (2/3)*bounds.height)
            let scp22 =  CGPoint(x: bounds.width/2, y: (1/3)*bounds.height)
            path.addCurve(to: CGPoint(x: (2*constraint_distance), y: (7/12)*bounds.height), controlPoint1: scp11, controlPoint2: scp22)

            path.addQuadCurve(to: CGPoint(x: 2*constraint_distance, y: (5/12)*bounds.height), controlPoint:CGPoint(x: bounds.minX, y: bounds.height*(1/2)))
            
            
            //third
            path.move(to: CGPoint(x: 2*constraint_distance, y: bounds.height*(9/12)))
            let scp13 =  CGPoint(x: bounds.width/2, y: bounds.height*(2/3))
            let scp23 =  CGPoint(x: bounds.width/2, y: bounds.height)

            path.addCurve(to: CGPoint(x: (bounds.width-2*constraint_distance), y: bounds.height*(9/12)), controlPoint1: scp13, controlPoint2: scp23)

            path.addQuadCurve(to: CGPoint(x: bounds.width-3*constraint_distance, y: bounds.height*(11/12)), controlPoint:CGPoint(x: bounds.maxX, y:bounds.height*(5/6)))

            let scp113 =  CGPoint(x: bounds.width/2, y: bounds.height)
            let scp223 =  CGPoint(x: bounds.width/2, y: (2/3)*bounds.height)
            path.addCurve(to: CGPoint(x: (2*constraint_distance), y: (11/12)*bounds.height), controlPoint1: scp113, controlPoint2: scp223)

            path.addQuadCurve(to: CGPoint(x: 2*constraint_distance, y: (9/12)*bounds.height), controlPoint:CGPoint(x: bounds.minX, y: bounds.height*(5/6)))
            
            
            
            
            
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
        }else if number == 3{
                
                var first_drawing_height = bounds.height / number
                
                // first
                var oval_radius = bounds.width/12
                var oval_mid_y = bounds.height / 6
                
                path.move(to: CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y - oval_radius))
                path.addLine(to: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y - oval_radius))
                path.addArc(withCenter: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y), radius: oval_radius, startAngle:-CGFloat.pi/2, endAngle: -(3/2)*CGFloat.pi, clockwise: true)
                
                path.addLine(to:  CGPoint(x: (oval_radius+constraint_distance), y: oval_mid_y + oval_radius))
                path.addArc(withCenter:CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y), radius: oval_radius, startAngle: -(3/2)*CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
                
                // second
                oval_mid_y =  first_drawing_height + bounds.height / 6
                
                path.move(to: CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y - oval_radius))
                path.addLine(to: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y - oval_radius))
                path.addArc(withCenter: CGPoint(x: (bounds.width-oval_radius-constraint_distance), y: oval_mid_y), radius: oval_radius, startAngle:-CGFloat.pi/2, endAngle: -(3/2)*CGFloat.pi, clockwise: true)
                
                path.addLine(to:  CGPoint(x: (oval_radius+constraint_distance), y: oval_mid_y + oval_radius))
                path.addArc(withCenter:CGPoint(x: oval_radius+constraint_distance, y: oval_mid_y), radius: oval_radius, startAngle: -(3/2)*CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
            
            // third
            oval_mid_y =  2*first_drawing_height + bounds.height / 6
            
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
