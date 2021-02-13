//
//  CollectionViewController.swift
//  ExampleApp
//
//  Created by 영준 이 on 2021/02/13.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import RxCollectionExtensions

class CollectionViewController: UIViewController {
    
    class Cells{
        static let `default` = "item";
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel : MainViewModel = .init();
    var disposeBag : DisposeBag = .init();
    
    override func viewWillAppear(_ animated: Bool) {
        self.refresh();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupBindings();
    }
    
    func setupBindings(){
        self.viewModel.items
//            .asObservable()
            .bind(toCollectionView: self.collectionView, cellIdentifier: Cells.default, cellType: CollectionViewCell.self, disposeBag: self.disposeBag) { (index, row, cell) in
                cell.label?.text = row.name;
            }
    }

    func refresh(){
        self.viewModel.load();
    }
}
