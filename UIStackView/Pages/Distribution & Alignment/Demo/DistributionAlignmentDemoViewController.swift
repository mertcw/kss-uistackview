import UIKit

final class DistributionAlignmentDemoViewController: BaseViewController {
	private lazy var defaultSizes: [CGSize] = {
		return [
			CGSize(width: 60.0, height: 120.0),
			CGSize(width: 180.0, height: 180.0),
			CGSize(width: 120.0, height: 60.0)
		]
	}()
	
	private lazy var distributionList: [UIStackView.Distribution] = {
		return [.fill, .fillEqually, .fillProportionally, .equalSpacing, .equalCentering]
	}()
	
	private lazy var distributionTitles: [String] = {
		return ["Fill", "Fill Equally", "Fill Proportionally", "Equal Spacing", "Equal Centering"]
	}()
	
	lazy var distributionStackView: DemoPropertyStackView = {
		let stackView = DemoPropertyStackView(titles: distributionTitles)
		stackView.delegate = self
		return stackView
	}()
	
	
	private lazy var alignmentList: [UIStackView.Alignment] = {
		return [.fill, .leading, .firstBaseline, .center, .trailing, .lastBaseline, .top, .bottom]
	}()
	
	private lazy var alignmentTitles: [String] = {
		return ["Fill", "Leading", "First Baseline", "Center", "Trailing", "Last Baseline", "Top", "Bottom"]
	}()
	
	lazy var alignmentStackView: DemoPropertyStackView = {
		let stackView = DemoPropertyStackView(titles: alignmentTitles)
		stackView.delegate = self
		return stackView
	}()
	
	private lazy var axisList: [NSLayoutConstraint.Axis] = {
		return [.vertical, .horizontal]
	}()
	
	private lazy var axisTitles: [String] = {
		return ["Vertical", "Horizontal"];
	}()
	
	lazy var axisStackView: DemoPropertyStackView = {
		let stackView = DemoPropertyStackView(titles: axisTitles)
		stackView.delegate = self
		return stackView
	}()
	
	
	private lazy var demoStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.distribution = .fill
		stackView.alignment = .fill
		return stackView
	}()
	
	private lazy var propertiesStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.distribution = .fillProportionally
		stackView.spacing = 32.0
		return stackView
	}()
	
	private lazy var mainContentView: UIView = {
		let view = UIView()
		view.backgroundColor = ColorPalette.primaryBackground
		return view
	}()
	
	private lazy var demoContentView: UIView = {
		let view = UIView()
		view.backgroundColor = ColorPalette.primaryBackground
		return view
	}()
	
	override func loadView() {
		super.loadView()
		title = "Distribution & Alignment"
		
		view.addSubview(mainContentView)
		mainContentView.snp.makeConstraints { make in
			make.edges.equalToSuperview().inset(UIEdgeInsets(
				top: 0.0,
				left: 64.0,
				bottom: 64.0,
				right: 64.0))
		}
		
		
		mainContentView.addSubview(propertiesStackView)
		propertiesStackView.snp.makeConstraints { make in
			make.leading.bottom.trailing.equalToSuperview()
		}
		
		alignmentStackView.snp.makeConstraints { make in
			make.height.equalTo(56.0)
		}
		
		[axisStackView, distributionStackView, alignmentStackView].forEach { stackView in
			propertiesStackView.addArrangedSubview(stackView)
		}
		
		
		mainContentView.addSubview(demoContentView)
		demoContentView.snp.makeConstraints { make in
			make.leading.top.trailing.equalToSuperview()
			make.bottom.equalTo(propertiesStackView.snp.top)
		}
		
		demoContentView.addSubview(demoStackView)
		demoStackView.snp.makeConstraints { make in
			make.center.equalToSuperview()
		}
		
		defaultSizes.forEach { size in
			let colorIndex = (demoStackView.arrangedSubviews.count % UIColor.allSystemColors.count)
			let demoView = DemoView(frame: .zero)
			demoView.backgroundColor = UIColor.allSystemColors[colorIndex]
			
			demoView.snp.makeConstraints { make in
				make.size.equalTo(size)
			}
			
			demoStackView.addArrangedSubview(demoView)
		}
		
		axisStackView.selectButton(atIndex: 1)
		distributionStackView.selectButton(atIndex: 0)
		alignmentStackView.selectButton(atIndex: 0)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		updateInterface(withDistributionAtIndex: 0, animated: false)
		updateInterface(withAlignmentAtIndex: 0, animated: false)
		updateInterface(withAxisAtIndex: 1, animated: false)
	}

	private func updateDemoViewsTitles() {
		guard let demoViews = demoStackView.arrangedSubviews as? [DemoView] else { return }
		
		for (index, demoView) in demoViews.enumerated() {
			let attributedString = NSMutableAttributedString()
			
			let defaultSize = defaultSizes[index]
			let defaultSizeText = "\(Int(defaultSize.width)) x \(Int(defaultSize.height))"
			attributedString.append(NSAttributedString(
				string: defaultSizeText + "\n",
				attributes: [
					NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1),
					NSAttributedString.Key.foregroundColor: UIColor.white
			]))
			
			let originalSize = demoView.frame.size
			let originalSizeText = "\(Int(originalSize.width)) x \(Int(originalSize.height))"
			attributedString.append(NSAttributedString(
				string: originalSizeText,
				attributes: [
					NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1),
					NSAttributedString.Key.foregroundColor: UIColor.white
			]))
			
			demoView.label.attributedText = attributedString
		}
	}
	
	private func updateInterface(withDistributionAtIndex index: Int, animated: Bool = true) {
		if animated {
			UIView.animate(
				withDuration: 0.33,
				animations: {
					self.demoStackView.distribution = self.distributionList[index]
				}
			) { _ in
				self.updateDemoViewsTitles()
			}
		} else {
			demoStackView.distribution = self.distributionList[index]
			updateDemoViewsTitles()
		}
	}
	
	private func updateInterface(withAlignmentAtIndex index: Int, animated: Bool = true) {
		if animated {
			UIView.animate(
				withDuration: 0.33,
				animations: {
					self.demoStackView.alignment = self.alignmentList[index]
				}
			) { _ in
				self.updateDemoViewsTitles()
			}
		} else {
			demoStackView.alignment = self.alignmentList[index]
			updateDemoViewsTitles()
		}
	}
	
	private func updateInterface(withAxisAtIndex index: Int, animated: Bool = true) {
		if animated {
			UIView.animate(
				withDuration: 0.33,
				animations: {
					self.demoStackView.axis = self.axisList[index]
				}
			) { _ in
				self.updateDemoViewsTitles()
			}
		} else {
			demoStackView.axis = self.axisList[index]
			updateDemoViewsTitles()
		}
	}
}

// MARK: - DemoPropertyStackViewDelegate
extension DistributionAlignmentDemoViewController: DemoPropertyStackViewDelegate {
	func propertyStackView(propertyStackView: DemoPropertyStackView, didReceiveTapAt index: Int) {
		switch propertyStackView {
		case distributionStackView:
			updateInterface(withDistributionAtIndex: index)
		case alignmentStackView:
			updateInterface(withAlignmentAtIndex: index)
		case axisStackView:
			updateInterface(withAxisAtIndex: index)
		default:
			break
		}
	}
}
