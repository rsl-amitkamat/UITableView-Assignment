
import SwiftUI
import UIKit

@main
struct UITableViewApp: App {

    var body: some Scene {
        WindowGroup {
            UIKitEntryView()
                .ignoresSafeArea()
        }
    }
}

struct UIKitEntryView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> UINavigationController {
        let shoppingList = ViewController()
        let navigationController = UINavigationController(
            rootViewController: shoppingList
        )

        return navigationController
    }

    func updateUIViewController(
        _ uiViewController: UINavigationController,
        context: Context
    ) {
        // No updates needed for now.
    }
}
