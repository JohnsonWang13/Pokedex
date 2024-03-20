//
//  UITableView+Extension.swift
//  Pokedex
//
//  Created by 王富生 on 2024/3/19.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) {
        let identifier = String(describing: T.self)
        if Bundle.main.path(forResource: identifier, ofType: "nib") != nil {
            let nib = UINib(nibName: identifier, bundle: nil)
            register(nib, forCellReuseIdentifier: identifier)
        } else {
            register(T.self, forCellReuseIdentifier: identifier)
        }
    }
    
    func dequeue<T: UITableViewCell>(_: T.Type, indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            return T.init()
        }
        return cell
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) {
        let identifier = String(describing: T.self)
        if Bundle.main.path(forResource: identifier, ofType: "nib") != nil {
            let nib = UINib(nibName: identifier, bundle: nil)
            register(nib, forHeaderFooterViewReuseIdentifier: identifier)
        } else {
            register(T.self, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
    
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) -> T {
        let identifier = String(describing: T.self)
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else {
            return T.init()
        }
        return view
    }
}
