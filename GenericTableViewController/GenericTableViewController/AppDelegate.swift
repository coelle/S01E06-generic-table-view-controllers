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


	func application (_ application: UIApplication,
	                  didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		let rootVC = EpisodesViewController(episodes: sampleEpisodes)
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = rootVC
		window?.makeKeyAndVisible()
		return true
	}
}
