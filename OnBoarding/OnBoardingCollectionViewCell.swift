//
//  OnBoardingCollectionViewCell.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 21/07/22.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var ImagenFondo : UIImageView!
    @IBOutlet var titulo1 : UILabel!
    @IBOutlet var SaltarButton : UIButton!
    @IBOutlet weak var pageviwew: UIPageControl!
    
}


extension OnBoardingViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ElementsArrayTutorial.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCell", for: indexPath) as? OnBoardingCollectionViewCell
        
        cell!.titulo1.text = ElementsArrayTutorial[index].titulo
        cell!.ImagenFondo.image = ElementsArrayTutorial[index].imagen
        cell!.pageviwew.currentPage = index
        var tituloSaltar = "Saltar"
        if (ElementsArrayTutorial.count - 1) == indexPath.row {
            tituloSaltar = "Terminar"
        }
        let attributeString = NSMutableAttributedString(
                string: tituloSaltar
             )
        
        cell?.SaltarButton.setAttributedTitle(attributeString, for: .normal)
        
        return cell!
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = UIScreen.main.bounds
        print("si entre \(self.view.frame.width)")
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
        
    }
    }

