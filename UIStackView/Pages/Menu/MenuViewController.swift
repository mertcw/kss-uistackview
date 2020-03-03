import UIKit

final class MenuViewController: UITableViewController {
	override func loadView() {
		super.loadView()
		
		title = "Index"
		view.backgroundColor = ColorPalette.primaryBackground
		
		tableView.tableFooterView = UIView()
		tableView.register(
			UITableViewCell.self,
			forCellReuseIdentifier: UITableViewCell.identifier)
		tableView.backgroundColor = ColorPalette.primaryBackground
		tableView.separatorColor = UIColor.clear
		tableView.separatorInset = UIEdgeInsets.zero
	}
}

// MARK: - UITableViewDataSource
extension MenuViewController {
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(
		_ tableView: UITableView,
		numberOfRowsInSection section: Int) -> Int {
		return Page.allCases.count
	}
	
	override func tableView(
		_ tableView: UITableView,
		cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(
			withIdentifier: UITableViewCell.identifier,
			for: indexPath)
		cell.textLabel?.text = Page.allCases[indexPath.row].title
		cell.textLabel?.textColor = ColorPalette.primaryText
		cell.contentView.backgroundColor = ColorPalette.primaryBackground
		return cell
	}
}

// MARK: - UITableViewDelegate
extension MenuViewController {
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		navigate(to: Page.allCases[indexPath.row])
	}
}

// MARK: - Page
enum Page: CaseIterable {
	case overview
	case managingSubviews
	case managingSubviewsDemo
	case propertyAxisDemo
	case mainAxisDistribution
	case crossAxisAlignment
	case distributionAlignmentDemo
	case spacingAndAutoLayout
	case propertySpacingDemo
	case horizontalLabelsDemo
	case references
	
	var title: String? {
		switch self {
		case .overview:
			return "Overview"
		case .managingSubviews:
			return "Managing Subviews"
		case .managingSubviewsDemo:
			return "\tDemo ~ Managing Subviews"
		case .propertyAxisDemo:
			return "\tDemo ~ Axis"
		case .mainAxisDistribution:
			return "Main Axis ~ Distribution"
		case .crossAxisAlignment:
			return "Cross Axis ~ Alignment"
		case .distributionAlignmentDemo:
			return "\tDemo ~ Distribution & Alignment"
		case .spacingAndAutoLayout:
			return "Spacing & Auto Layout"
		case .propertySpacingDemo:
			return "\tDemo ~ Spacing"
		case .horizontalLabelsDemo:
			return "\tDemo ~ Horizontal Labels"
		case .references:
			return "References"
		}
	}
}

// MARK: - Navigation
private extension MenuViewController {
	func navigate(to page: Page) {
		let viewController: UIViewController = {
			switch page {
				case .overview:
					return OverviewViewController()
				
				case .managingSubviews:
					return ManagingSubviewsViewController()
				
				case .managingSubviewsDemo:
					return ManagingSubviewsDemoViewController()
				
				case .propertyAxisDemo:
					return PropertyAxisDemoViewController()
				
				case .mainAxisDistribution:
					return MainAxisDistributionViewController()
				
				case .crossAxisAlignment:
					return CrossAxisAlignmentViewController()
				
				case .distributionAlignmentDemo:
					return DistributionAlignmentDemoViewController()
				
				case .spacingAndAutoLayout:
					return SpacingAndAutoLayoutViewController()
				
				case .propertySpacingDemo:
					return PropertySpacingDemoViewController()
				
				case .horizontalLabelsDemo:
					return HorizontalLabelsViewController()
				
				case .references:
					return ReferencesViewController()
			}
		}()
	
		navigationController?.pushViewController(viewController, animated: true)
	}
}
