//
//  ViewController.swift
//  ExampleApp
//
//  Created by 영준 이 on 2021/02/13.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import RxCollectionExtensions

class TableViewController: UIViewController {
    
    class Cells{
        static let `default` = "item";
    }

    @IBOutlet weak var tableView: UITableView!
    
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
            .bind(toTableView: self.tableView, cellIdentifier: Cells.default, cellType: UITableViewCell.self, disposeBag: self.disposeBag) { (index, row, cell) in
                cell.textLabel?.text = row.name;
            }
    }

    func refresh(){
        self.viewModel.load();
    }
}

