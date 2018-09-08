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

class ItemsViewController<Item, Cell:UITableViewCell>: UITableViewController {
	private let reuseIdentifier = "Cell"
	private let configure: (Cell, Item) -> ()
	private var items: [Item] = []


	init (items: [Item],
	      configure: @escaping (Cell, Item) -> ()) {
		self.configure = configure
		self.items = items
		super.init(style: .plain)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad () {
		tableView.register(Cell.self, forCellReuseIdentifier: reuseIdentifier)
	}

	override func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}

	override func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! Cell
		let item = items[indexPath.row]
		configure(cell, item)
		return cell
	}
}
