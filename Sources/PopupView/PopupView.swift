import UIKit
import Models

public class PopupViewNew {
    
    public static let shared: PopupViewNew = PopupViewNew()
    
    private var views : [UIView] = []
    private var index: Int8 = 0
    
    public init() {}
    
    public var isBalanceHidden: Bool = false
    
    public func setPopupView(header: PopupHeaderData, view: UIView, frame: CGRect) -> UIView? {
        guard let popup = UIView().loadView(name: "NewPopupView", conformance: View.self) else {return nil}

        popup.delegate = self
        popup.setView(view:view)
        popup.frame = frame
        views.append(popup)

        return popup
    }
    
    public func setFullscreenView(view: UIView, frame: CGRect) -> UIView? {
        guard let popup = UIView().loadView(name: "FullscreenView",
                                            conformance: FullscreenViewController.self) else {return nil}
        popup.delegate = self
        popup.setView(view:view)
        popup.frame = frame
        views.append(popup)
        return popup
    }
    
    public func setBanxaCell(model: BanxaModels.BanxaOrdersResponseElement) -> UITableViewCell {
        let cell = UITableViewCell().loadXib(name: "BanxaCell") as! BanxaCell
        cell.setCell(model: model)
        return cell
    }
    
    public func setCoinTableCell(model: BalanceModel, icon: UIImage) -> UITableViewCell {
        let cell = UITableViewCell().loadXib(name: "CoinTableViewCell") as! CoinTableViewCell
        cell.setModel(model:model, icon: icon)
        return cell
    }
}

extension PopupViewNew: PopupViewDelegate {
    public func exitPopUp() {
        if let view = views.last {
            UIView.animate(withDuration: 1, animations: {
                view.frame.origin.x = -1 * view.frame.width
            }) {_ in
                view.removeFromSuperview()
                self.views.removeLast()
            }
        }
    }
    
    public func exitAll() {
        for view in views {
            UIView.animate(withDuration: 1, animations: {
                view.frame.origin.x = -1 * view.frame.width
            }) {_ in
                view.removeFromSuperview()
            }
        }
    }
    
    public func exitPopUp(completion: @escaping ()->()) {
        if let view = views.last {
            UIView.animate(withDuration: 1, animations: {
                view.frame.origin.x = -1 * view.frame.width
            }) {_ in
                view.removeFromSuperview()
                self.views.removeLast()
                completion()
            }
        }
    }
}
