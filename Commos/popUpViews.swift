//
//  popUpViews.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 22/07/22.
//

import Foundation
import Lottie



var viewInfo = VistaInfo()

func showViewInfo(vista: UIViewController, info: String, titulo: String, closeAction: UITapGestureRecognizer) {
    
    viewInfo = (Bundle.main.loadNibNamed("VistaInfo", owner: vista, options: nil)?.first as? VistaInfo)!
    vista.view.addSubview((viewInfo))
    
    viewInfo.frame = CGRect(x: vista.view.center.x - (vista.view.frame.width/2), y: vista.view.center.y - (vista.view.frame.height/2), width: vista.view.frame.width, height: vista.view.frame.height)
    viewInfo.InfoLabel.text = info
    viewInfo.sportLabel.text = titulo
    viewInfo.vistaContenida.layer.cornerRadius = 8
    viewInfo.vistaContenida.clipsToBounds = true
    let numofLine = viewInfo.InfoLabel.numberOfLine() + 1
    print("numofLine \(numofLine)")
    print("viewInfo.InfoLabel.font!.lineHeight \(viewInfo.InfoLabel.font!.lineHeight)")
    viewInfo.heightText.constant = CGFloat(numofLine > 26 ? 26 : numofLine) * (viewInfo.InfoLabel.font!.lineHeight + 2.8)
    viewInfo.cancelarButton.addGestureRecognizer(closeAction)
    viewInfo.isHidden = false
    
}

func hideViewInfo(vista: UIViewController) {
    DispatchQueue.main.async {
        
        viewInfo.isHidden = true
        viewInfo.removeFromSuperview()
    }
    
}


extension UITextView {
    func sizeFit(width: CGFloat) -> CGSize {
        let fixedWidth = width
        let newSize = sizeThatFits(CGSize(width: fixedWidth, height: .greatestFiniteMagnitude))
        return CGSize(width: fixedWidth, height: newSize.height)
    }

    func numberOfLine() -> Int {
        let size = self.sizeFit(width: self.bounds.width)
        let numLines = Int(size.height / (self.font?.lineHeight ?? 1.0))
        return numLines
    }
}
