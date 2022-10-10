import AppKit
import SwiftUI

struct MyView: View {
    var body: some View {
        VStack {
            Text("Hello, World")
                .padding()
        }
    }
}

final class WindowController: NSWindowController {
    override init(window win: NSWindow?) {
        super.init(window: win)

        let viewController = NSHostingController(
            rootView: MyView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
        if win == nil {
            window = NSWindow(contentViewController: viewController)
        } else {
            window?.contentViewController = viewController
        }
        window?.setFrame(NSRect(x: 0, y: 0, width: 400, height: 300), display: true)
        window?.styleMask = NSWindow.StyleMask(arrayLiteral: .titled, .closable, .miniaturizable, .resizable)
        window?.makeKeyAndOrderFront(self)
        window?.center()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

final class AppDelegate: NSObject, NSApplicationDelegate {
    var windowController: WindowController!

    func applicationWillFinishLaunching(_ notification: Notification) {
        let submenu = NSMenu(title: "")
        submenu.addItem(
            withTitle: "Quit",
            action: #selector(NSApplication.terminate(_:)),
            keyEquivalent: "q"
        )
        let item = NSMenuItem(title: "", action: nil, keyEquivalent: "")
        item.submenu = submenu

        let menu = NSMenu()
        menu.addItem(item)
        NSApplication.shared.mainMenu = menu

        windowController = WindowController(window: nil)

        NSApplication.shared.activate(ignoringOtherApps: true)
    }
}

let appDelegate = AppDelegate()
NSApplication.shared.delegate = appDelegate
NSApplication.shared.setActivationPolicy(.regular)
_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
