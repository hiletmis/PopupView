import UIKit

public class PopupViewNew: PopupViewDelegate {
    
    public static let shared: PopupViewNew = PopupViewNew()
    
    private var views : [UIView] = []
    private var index: Int8 = 0
    
    public init() {}
    
    public func setupView(header: PopupHeaderData, view: UIView, frame: CGRect) -> UIView? {
        guard let popup = UIView().loadView(name: "NewPopupView", conformance: View.self) else {return nil}

        popup.delegate = self
        popup.setView(view:view)
        popup.frame = frame
        views.append(popup)

        return popup
    }
    
    public func exitPopUp() {
        views.removeLast()
    }
    
    public func exitAll() {
        for view in views {
            view.removeFromSuperview()
        }
    }
}
