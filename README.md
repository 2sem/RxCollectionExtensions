# RxCollectionExtensions

[![CI Status](https://img.shields.io/travis/2sem/RxCollectionExtensions.svg?style=flat)](https://travis-ci.org/2sem/RxCollectionExtensions)
[![Version](https://img.shields.io/cocoapods/v/RxCollectionExtensions.svg?style=flat)](https://cocoapods.org/pods/RxCollectionExtensions)
[![License](https://img.shields.io/cocoapods/l/RxCollectionExtensions.svg?style=flat)](https://cocoapods.org/pods/RxCollectionExtensions)
[![Platform](https://img.shields.io/cocoapods/p/RxCollectionExtensions.svg?style=flat)](https://cocoapods.org/pods/RxCollectionExtensions)

## Installation

RxCollectionExtensions is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

## Bind to TableView

```swift
self.viewModel.items
//            .asObservable()
    .bind(toTableView: self.tableView, cellIdentifier: Cells.default, cellType: UITableViewCell.self, disposeBag: self.disposeBag) { (index, row, cell) in
        cell.textLabel?.text = row.name;
    }
```

## Bind to CollectionView

```swift
self.viewModel.items
//            .asObservable()
    .bind(toCollectionView: self.collectionView, cellIdentifier: Cells.default, cellType: CollectionViewCell.self, disposeBag: self.disposeBag) { (index, row, cell) in
        cell.label?.text = row.name;
    }
```


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

RxSwfit, RxCocoa

```ruby
pod 'RxCollectionExtensions'
```

## Author

2sem, toyboy2@hanmail.net

## License

RxCollectionExtensions is available under the MIT license. See the LICENSE file for more info.
