//
//  PopupViewDelegate.swift
//  
//
//  Created by Hayrettin İletmiş on 27.03.2023.
//

protocol PopupViewDelegate: AnyObject {
    func exitPopUp()
    func exitAll()
    func exitPopUp(completion: @escaping()->())
}
