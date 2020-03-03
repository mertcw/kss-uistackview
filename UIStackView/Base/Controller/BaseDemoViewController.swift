import UIKit
import SnapKit

class BaseDemoViewController: BaseViewController {
	weak var dataSource: BaseDemoViewControllerDataSource?
	
	lazy var stackView: UIStackView = {
        let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.distribution = .fill
		stackView.spacing = 32.0
        return stackView
    }()
	
	lazy var demoStackView: DemoStackView = {
		return DemoStackView(numberOfItems: numberOfInitialItems)
	}()
	
	// MARK: - View Lifecycle
	override func loadView() {
		super.loadView()
		
		view.addSubview(stackView)
		stackView.snp.makeConstraints { make in
			make.width.equalToSuperview().multipliedBy(demoViewWidthPercentage)
			make.height.equalTo(view.snp.height).multipliedBy(demoViewHeightPercentage)
			make.center.equalToSuperview()
		}
		
		stackView.addArrangedSubview(demoStackView)
		
		navigationController?.navigationBar.isTranslucent = false
	}
	
	func view(at index: Int) -> UIView {
		return demoStackView.arrangedSubviews[index]
	}
}

// MARK: - BaseDemoViewControllerDataSource
@objc protocol BaseDemoViewControllerDataSource: AnyObject {
	var numberOfInitialItems: Int { get }
	var demoViewHeightPercentage: CGFloat { get }
	var demoViewWidthPercentage: CGFloat { get }
}

extension BaseDemoViewController: BaseDemoViewControllerDataSource {
	var numberOfInitialItems: Int { return 3 }
	var demoViewHeightPercentage: CGFloat { return 0.8 }
	var demoViewWidthPercentage: CGFloat { return 0.7 }
}
