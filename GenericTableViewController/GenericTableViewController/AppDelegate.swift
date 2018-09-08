//
//  GenericTableViewController
//
//  Copyright © 2018 Cölle Online. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	let sampleEpisodes = [
		Episode(title: "First Episode"),
		Episode(title: "Second Episode"),
		Episode(title: "Third Episode")
	]
	let sampleSeasons = [
		Season(number: 1, title: "Season One"),
		Season(number: 2, title: "Season Two"),
		Season(number: 3, title: "Season Three")
	]


	func application (_ application: UIApplication,
	                  didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		let rootVC = ItemsViewController(items: sampleEpisodes, configure: {
			cell, episode in
			cell.textLabel?.text = episode.title
		})

		let seasonsVC = ItemsViewController(items: sampleSeasons,
			configure: {
				cell, season in
				cell.textLabel?.text = "\(season.number)"
			})

		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = rootVC
		window?.makeKeyAndVisible()
		return true
	}
}
