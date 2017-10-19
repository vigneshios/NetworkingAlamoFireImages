//
//  ViewController.swift
//  NetworkingImagesAlamoFire
//
//  Created by vignesh on 10/19/17.
//  Copyright © 2017 vignesh. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var actor = [Actor]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello AlamoFireImages")
        
        NetworkingService.shared.getMovieStarsDetails { (response) in
            self.actor = response.actor
            self.collectionView.reloadData()
        }
        
    }


}

extension ViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! CollectionCell
        cell.nameLabel.text = actor[indexPath.row].name
        guard let urlImage = URL(string: actor[indexPath.row].imageUrl) else {return UICollectionViewCell()}
        cell.imageView.af_setImage(withURL: urlImage)
        return cell
    }
    
    
    
}











