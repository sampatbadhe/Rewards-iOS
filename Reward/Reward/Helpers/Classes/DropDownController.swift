//
//  DropDownController.swift
//  Reward
//
//  Created by Keval Vadoliya on 15/04/21.
//

import UIKit
import RealmSwift
import SwifterSwift

class DropDownController<T, Cell: UITableViewCell>: UITableViewController, UISearchResultsUpdating where T: Equatable, T: Searchable {
    
    private var items: [T]
    var selectedItems: [T] = []
    private var filteredItems: [T] = []
    private var configure: (Cell, T) -> Void
    private var selectHandler: ([T]) -> Void
    var resultSearchController = UISearchController()
    private var closeButton = UIBarButtonItem(systemItem: .close)
    var allowsMultipleSelection: Bool = false
    var finalAction: (() -> Void)?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(items: [T], configure: @escaping (Cell, T) -> Void, selectHandler: @escaping ([T]) -> Void) {
        self.items = items
        self.configure = configure
        self.selectHandler = selectHandler
        super.init(style: .plain)
        let cellIdentifier = String(describing: Cell.self)
        if cellIdentifier == String(describing: UITableViewCell.self) {
            self.tableView.register(Cell.self, forCellReuseIdentifier: cellIdentifier)
        } else {
            let nib = UINib.init(nibName: cellIdentifier, bundle: nil)
            self.tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchBarUI()
        tableView.tableFooterView = UIView()
        tableView.bounces = false
        tableView.allowsMultipleSelection = allowsMultipleSelection
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setBarButtons()
    }
    
    func setSearchBarUI() {
        resultSearchController = ({
            let searchController = UISearchController(searchResultsController: nil)
            searchController.searchResultsUpdater = self
            self.navigationController?.navigationBar.prefersLargeTitles = false
            searchController.searchBar.sizeToFit()
            searchController.hidesNavigationBarDuringPresentation = false
            searchController.searchBar.searchBarStyle = .minimal
            searchController.searchBar.backgroundColor = R.color.background()
            tableView.tableHeaderView = searchController.searchBar
            return searchController
        })()
    }
    
    func setBarButtons() {
        if allowsMultipleSelection {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction(_:)))
            navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: R.color.text() ?? .clear], for: .normal)
        }
        navigationItem.leftBarButtonItem = closeButton
        closeButton.target = self
        closeButton.action = #selector(closeButtonAction(_:))
    }

    @objc func doneButtonAction(_ sender: UIBarButtonItem) {
        selectHandler(selectedItems)
        finalAction?()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func closeButtonAction(_ sender: UIBarButtonItem) {
        finalAction?()
        dismiss(animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearchActive() {
            return filteredItems.count
        }
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: Cell.self, for: indexPath)
        let item = isSearchActive() ? filteredItems[indexPath.row] : items[indexPath.row]
        cell.accessoryType = selectedItems.contains(item) && allowsMultipleSelection ? .checkmark : .none
        configure(cell, item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = isSearchActive() ? filteredItems[indexPath.row] : items[indexPath.row]
        if selectedItems.contains(item) {
            if let index = selectedItems.firstIndex(of: item) {
                selectedItems.remove(at: index)
            }
        } else {
            selectedItems.append(item)
        }
        if !allowsMultipleSelection {
            selectHandler(selectedItems)
            resultSearchController.dismiss(animated: true, completion: nil)
            finalAction?()
            dismiss(animated: true, completion: nil)
        }
        tableView.reloadData()
        
    }
    
    func isSearchActive() -> Bool {
        return !(resultSearchController.searchBar.text?.isEmpty ?? true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredItems = items.filter {
            let searchedText = $0.query.range(of: searchController.searchBar.text ?? String(), options: NSString.CompareOptions.caseInsensitive)
            return (searchedText != nil)
        }
        tableView.reloadData()
    }

}
