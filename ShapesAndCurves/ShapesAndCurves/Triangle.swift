//
//  Triangle.swift
//  ShapesAndCurves
//
//  Created by Dan Morse on 11/23/22.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        }
    }
}

struct Trapezoid: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
        }
    }
}

//struct CoachMark: View {
//    var text: any View {
//        Text("Hello, world!")
//    }
//
////    text height + 16 + 16
////    text width + 16 + 24 + 10
//    var Body: some View {
//        GeometryReader geometry in {
//            text.geom
//        }
//        let rect = text.
//    }
//}

struct Indicator1: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let indicatorSize: CGFloat = 10.0
            let cornerRadius: CGFloat = 4.0
            let pointRadius = cornerRadius * 0.5
            
            let rectTop = rect.minY
            let rectBottom = rect.maxY
            let rectLeft = rect.minX
            let rectRight = rect.maxX - indicatorSize
            
            let indicatorRight = rect.maxX
            let indicatorBottom = rect.midY + indicatorSize * 0.8
            let indicatorTop = rect.midY - indicatorSize * 0.8
            let indicatorPoint = CGPoint(x: indicatorRight, y: rect.midY)
            
            let startPoint = CGPoint(x: rect.midX, y: rectTop)
            
            path.move(to: startPoint)
            path.addLine(to: CGPoint(x: rectLeft + cornerRadius, y: rectTop))
            path.addQuadCurve(to: CGPoint(x: rectLeft, y: rectTop + cornerRadius), control: CGPoint(x: rectLeft, y: rectTop))
            path.addLine(to: CGPoint(x: rectLeft, y: rectBottom - cornerRadius))
            path.addQuadCurve(to: CGPoint(x: rectLeft + cornerRadius, y: rectBottom), control: CGPoint(x: rectLeft, y: rectBottom))
            path.addLine(to: CGPoint(x: rectRight - cornerRadius, y: rectBottom))
            path.addQuadCurve(to: CGPoint(x: rectRight, y: rectBottom - cornerRadius), control: CGPoint(x: rectRight, y: rectBottom))
            path.addLine(to: CGPoint(x: rectRight, y:indicatorBottom))
            path.addLine(to: CGPoint(x: indicatorPoint.x - pointRadius, y: indicatorPoint.y + pointRadius))
            
            path.addQuadCurve(to: CGPoint(x: indicatorPoint.x - pointRadius, y: indicatorPoint.y - pointRadius), control: indicatorPoint)
            path.addLine(to: CGPoint(x: rectRight, y: indicatorTop))
            path.addLine(to: CGPoint(x: rectRight, y: rectTop + cornerRadius))
            path.addQuadCurve(to: CGPoint(x: rectRight - cornerRadius, y: rectTop), control: CGPoint(x: rectRight, y: rectTop))
            path.addLine(to: startPoint)
        }
    }
}

struct CustomShape: View {
    var body: some View {
        ZStack {
            Indicator()
                .frame(width: 200, height: 70)
        }
    }
}

struct IndicatorBackground: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            let indicatorSize: CGFloat = width * 0.042
            let cornerRadius: CGFloat = width * 0.018
            let pointRadius = cornerRadius * 0.35
            
            let rectTop = height * 0
            let rectBottom = height
            let rectLeft = width * 0
            let rectRight = width - indicatorSize
            let indicatorRight = width
            
            let indicatorBottom = height / 2 + indicatorSize * 0.8
            let indicatorTop = height / 2 - indicatorSize * 0.8
            let indicatorPoint = CGPoint(x: indicatorRight, y: height / 2)
            
            let startPoint = CGPoint(x: width / 2, y: rectTop)
            
            Path { path in
                path.move(to: startPoint)
                path.addLine(to: CGPoint(x: rectLeft + cornerRadius, y: rectTop))
                path.addQuadCurve(to: CGPoint(x: rectLeft, y: rectTop + cornerRadius), control: CGPoint(x: rectLeft, y: rectTop))
                path.addLine(to: CGPoint(x: rectLeft, y: rectBottom - cornerRadius))
                path.addQuadCurve(to: CGPoint(x: rectLeft + cornerRadius, y: rectBottom), control: CGPoint(x: rectLeft, y: rectBottom))
                path.addLine(to: CGPoint(x: rectRight - cornerRadius, y: rectBottom))
                path.addQuadCurve(to: CGPoint(x: rectRight, y: rectBottom - cornerRadius), control: CGPoint(x: rectRight, y: rectBottom))
                path.addLine(to: CGPoint(x: rectRight, y:indicatorBottom))
                path.addLine(to: CGPoint(x: indicatorPoint.x - pointRadius, y: indicatorPoint.y + pointRadius))
                
                path.addQuadCurve(to: CGPoint(x: indicatorPoint.x - pointRadius, y: indicatorPoint.y - pointRadius), control: indicatorPoint)
                path.addLine(to: CGPoint(x: rectRight, y: indicatorTop))
                path.addLine(to: CGPoint(x: rectRight, y: rectTop + cornerRadius))
                path.addQuadCurve(to: CGPoint(x: rectRight - cornerRadius, y: rectTop), control: CGPoint(x: rectRight, y: rectTop))
                path.addLine(to: startPoint)
            }
            .fill(.blue)
        }
    }
}

struct Indicator: View {
    var body: some View {
        let textSize: CGFloat = 26
//        let backgroundWidth = textSize * 13.5
//        let backgroundHeight = backgroundWidth
        
        VStack{
            Spacer(minLength: 90)
            Text("Open a file to get started")
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 34))
                .background(IndicatorBackground())
                .frame(maxWidth: 320, maxHeight: 150)
//                .font(.system(size: textSize))
            //            .dynamicTypeSize(.medium)
        }
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        Indicator()
    }
}
