//
//  OnBoardingViewController.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 21/07/22.
//

import UIKit
import Foundation

class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var Collection: UICollectionView!
    
    //MARK: - Properties
    var Auxrow: Int8! = 0
    var ElementsArrayTutorial: [(titulo: String, imagen: UIImage)] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    func setUpUI() {
        
        ElementsArrayTutorial.append((titulo: "Find Your Favorite Sports", imagen: UIImage(named: "OnBoardingFutbol")!))
        ElementsArrayTutorial.append((titulo: "Follow The Leagues You're Passionate About", imagen: UIImage(named: "OnBoardingBaseball")!))
        ElementsArrayTutorial.append((titulo: "Find Your Favorite Teams", imagen: UIImage(named: "OnBoardingBasketball")!))
        
        Collection.reloadData()
        
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(self.Gesture(gesture:)))
        
        swipeleft.direction = .left
        
        Collection.addGestureRecognizer(swipeleft)
        
        let swiperight = UISwipeGestureRecognizer(target: self, action: #selector(self.Gesture(gesture:)))
        
        swiperight.direction = .right
        
        Collection.addGestureRecognizer(swiperight)
        
    }
    
    public func IrAlaDerecha() {
        if Auxrow != 0 {
            
            Auxrow -= 1
            
            self.Collection.scrollToItem(at: IndexPath(row: Int(Auxrow), section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
        }
    }
    
    @objc func Gesture(gesture: UISwipeGestureRecognizer) -> Void{
        
        if gesture.direction == UISwipeGestureRecognizer.Direction.right{
            
            IrAlaDerecha()
            
        }else if gesture.direction == UISwipeGestureRecognizer.Direction.left{
            
            if Auxrow != 2 {
                
                Auxrow += 1
                
                self.Collection.scrollToItem(at: IndexPath(row: Int(Auxrow), section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
                
            }
            
        }
        
    }
}

