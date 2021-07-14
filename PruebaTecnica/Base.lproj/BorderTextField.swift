//
//  BorderTextField.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import UIKit
@IBDesignable
class BorderTextField: UITextField {

    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
                layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 28 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return  bounds.insetBy(dx: 20, dy: 0)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
    }
    @IBInspectable var rightImage: UIImage = UIImage() {
        didSet {
            let imageView = UIImageView(image: rightImage)
            self.rightView = imageView
        }
    }
    @IBInspectable var isRightViewVisible: Bool = false {
        didSet {
            if isRightViewVisible {
                rightViewMode = .always
            } else {
                rightViewMode = .never
            }
        }
    }
}
