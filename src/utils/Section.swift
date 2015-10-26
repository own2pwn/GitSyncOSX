import Foundation
import Cocoa

class Section:Container {
    var fillColor:NSColor = NSColor.clearColor()
    var strokeColor:NSColor = NSColor.clearColor()
    init(_ fillColor:NSColor = NSColor.clearColor(), _ strokeColor:NSColor = NSColor.clearColor(), _ width: Int = 100, _ height: Int = 100) {
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        super.init(width, height)
        self.wantsLayer = true
    }
    /*
    *
    */
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        if(fillColor != NSColor.clearColor()){
            let fillColor = NSColorParser.cgColor(self.fillColor)
            layer?.backgroundColor = fillColor//CGColorCreateGenericRGB(1, 0, 1, 1)
        }
        if(strokeColor != NSColor.clearColor()){
            let strokeColor = NSColorParser.cgColor(self.strokeColor)
            layer?.borderColor = strokeColor//CGColorCreateGenericRGB(0, 1, 0, 1)
            layer?.borderWidth = 1
        }
    }
    /*
    * Required by super class
    */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}