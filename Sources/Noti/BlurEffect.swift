import SwiftUI

public struct BlurEffect: UIViewRepresentable {
    public var style: UIBlurEffect.Style
    public var cornerRadius: CGFloat?
    
    public init(_ style: UIBlurEffect.Style, cornerRadius: CGFloat? = nil) {
        self.style = style
        self.cornerRadius = cornerRadius
    }
    
    public func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        if let cornerRadius = self.cornerRadius {
            uiView.clipsToBounds = true
            uiView.layer.cornerRadius = cornerRadius
        }
    }
}
