import UIKit

final class ManagingSubviewsDemoViewController: BasePropertyDemoViewController {
	override func propertyTitles() -> [String] {
		return Action.allCases.map { $0.rawValue }
	}
	
	override var numberOfInitialItems: Int { return 4 }
	
	override func loadView() {
		super.loadView()
		
		propertyStackView.isSelectionEnabled = false
	}
}

extension ManagingSubviewsDemoViewController {
	override func propertyStackView(
		propertyStackView: DemoPropertyStackView,
		didReceiveTapAt index: Int) {
		UIView.animate(withDuration: 0.33) { [weak self] in
			switch Action.allCases[index] {
			case .add:
				self?.addArrangedSubviewToEnd()
			case .remove:
				self?.removeArrangedSubviewFromEnd()
			case .insert1:
				self?.insertArrangedSubviewToIndexOne()
			case .remove1:
				self?.removeArrangedSubviewAtIndexOne()
			case .toggle0:
				self?.toggleIndexZero()
			}
		}
	}
	
	private func addArrangedSubviewToEnd() {
		demoStackView.addArrangedSubview(newDemoView())
		printArrangedSubviewCount()
	}
	
	private func removeArrangedSubviewFromEnd() {
		demoStackView.arrangedSubviews.last?.removeFromSuperview()
		printArrangedSubviewCount()
	}
	
	private func insertArrangedSubviewToIndexOne() {
		demoStackView.insertArrangedSubview(newDemoView(), at: 1)
		printArrangedSubviewCount()
	}
	
	private func removeArrangedSubviewAtIndexOne() {
		guard demoStackView.arrangedSubviews.count > 1 else { return }
		demoStackView.arrangedSubviews[1].removeFromSuperview()
		printArrangedSubviewCount()
	}
	
	private func toggleIndexZero() {
		guard let demoView = demoStackView.arrangedSubviews.first else { return }
		demoView.isHidden = !demoView.isHidden
		printArrangedSubviewCount()
	}
	
	private func printArrangedSubviewCount() {
		print("arrangedSubviews.count: \(demoStackView.arrangedSubviews.count)\n")
	}
	
	private func newDemoView() -> DemoView {
		let colorIndex = (demoStackView.arrangedSubviews.count % UIColor.allSystemColors.count)
		let view = DemoView(frame: .zero)
		view.backgroundColor = UIColor.allSystemColors[colorIndex]
		return view
	}
}

extension ManagingSubviewsDemoViewController {
	enum Action: String, CaseIterable {
		case add		= "Add to End"
		case remove		= "Remove from End"
		case insert1	= "Insert Index 1"
		case remove1	= "Remove Index 1"
		case toggle0	= "Toggle Index 0"
	}
}
