//
//  ImagesCollectionViewCell.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 23/07/22.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    @IBOutlet var Imagen : UIImageView!
    @IBOutlet weak var pageviwew: UIPageControl!
}

extension TeamDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "showCollectionCell", for: indexPath) as? ImagesCollectionViewCell
        cell?.Imagen.sd_setImage(with: URL(string: (arrayImage[index])), placeholderImage: (UIImage.init(named: "launchscreen")!))
        cell?.pageviwew.currentPage = index
        
        return cell!
    }
}
