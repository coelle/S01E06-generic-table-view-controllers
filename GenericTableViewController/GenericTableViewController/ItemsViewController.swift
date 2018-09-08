//
//  GenericTableViewController
//
//  Copyright © 2018 Cölle Online. All rights reserved.
//

import UIKit

struct Episode {
	var title: String
}

struct Season {
	var number: Int
	var title: String
}

class ItemsViewController<Item>: UITableViewController {
	private let reuseIdentifier = "Cell"
	private let cellClass: AnyClass
	private let configure: (UITableViewCell, Item) -> ()
	private var items: [Item] = []


	init (items: [Item],
	      cellClass: AnyClass = UITableViewCell.self,
	      configure: @escaping (UITableViewCell, Item) -> ()) {
		self.configure = configure
		self.cellClass = cellClass
		self.items = items
		super.init(style: .plain)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad () {
		tableView.register(cellClass, forCellReuseIdentifier: reuseIdentifier)
	}

	override func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}

	override func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
		let item = items[indexPath.row]
		configure(cell, item)
		return cell
	}
}
