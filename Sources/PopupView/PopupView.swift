import UIKit

public class PopupViewNew: UIView, PopupViewDelegate {
    func exitPopUp() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
        self.removeFromSuperview()
    }
    
    public convenience init(frame: CGRect, header: PopupHeaderData, view: UIView) {
        self.init(frame: frame)
        setupView(header:header, view: view)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public func setupView(header: PopupHeaderData, view: UIView) {
        guard let popup = UIView().loadView(name: "NewPopupView", conformance: View.self) else {return}
        popup.delegate = self
        popup.frame = frame
        
        popup.setView(view:view)

        self.addSubview(popup)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
