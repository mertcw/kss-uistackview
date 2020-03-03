import UIKit
import SnapKit

final class HorizontalLabelsViewController: BaseViewController {
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.dataSource = self
		tableView.register(
			HorizontalLabelDemoCell.self,
			forCellReuseIdentifier: HorizontalLabelDemoCell.identifier)
		tableView.separatorColor = UIColor.clear
		tableView.separatorInset = .zero
		tableView.tableFooterView = UIView()
		tableView.showsVerticalScrollIndicator = false
		tableView.layer.cornerRadius = 4.0
		tableView.layer.masksToBounds = true
		
		return tableView
	}()
	
	private var demoMode: DemoMode = .left {
		didSet {
			tableView.reloadData()
		}
	}
	
	lazy var demoModesStackView: DemoPropertyStackView = {
		let titles = DemoMode.allCases.map { $0.rawValue }
		let stackView = DemoPropertyStackView(titles: titles)
		stackView.delegate = self
		return stackView
	}()
	
	
	// MARK: - View Lifecycle
	override func loadView() {
		super.loadView()
		
		view.addSubview(demoModesStackView)
		demoModesStackView.snp.makeConstraints { make in
			make.width.equalToSuperview().multipliedBy(0.54)
			make.height.equalTo(64.0)
			make.bottom.equalToSuperview().inset(48.0)
			make.centerX.equalToSuperview()
		}
		
		
		view.addSubview(tableView)
		tableView.snp.makeConstraints { make in
			make.top.equalToSuperview().inset(48.0)
			make.bottom.equalTo(demoModesStackView.snp.top).inset(-48.0)
			make.width.equalToSuperview().multipliedBy(0.54)
			make.centerX.equalToSuperview()
		}
		
		demoModesStackView.selectButton(atIndex: 0)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
extension HorizontalLabelsViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return teams.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(
			withIdentifier: HorizontalLabelDemoCell.identifier,
			for: indexPath) as! HorizontalLabelDemoCell
	
		updateCell(cell, for: demoMode)
		
		cell.leftLabel.text = teams[indexPath.row]
		cell.rightLabel.text = stadiums[indexPath.row]
		
		return cell
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
}

// MARK: - Demo Mode
private extension HorizontalLabelsViewController {
	enum DemoMode: String, CaseIterable {
		case left			= "Left"
		case right			= "Right"
		case leftSuperior	= "Left Superior"
		case rightSuperior	= "Right Superior"
	}
	
	func updateCell(_ cell: HorizontalLabelDemoCell, for demoMode: DemoMode) {
		cell.leftLabel.setContentHuggingPriority(
			UILayoutPriority(rawValue: 250.0),
			for: .horizontal)
		cell.rightLabel.setContentHuggingPriority(
			UILayoutPriority(rawValue: 250.0),
			for: .horizontal)
		
		switch demoMode {
		case .left:
			leftSetup(cell)
		case .right:
			rightSetup(cell)
		case .leftSuperior:
			leftSuperiorSetup(cell)
		case .rightSuperior:
			rightSuperiorSetup(cell)
		}
	}
	
	func leftSetup(_ cell: HorizontalLabelDemoCell) {
		cell.leftLabel.numberOfLines = 1
		cell.leftLabel.setContentHuggingPriority(
			.defaultHigh,
			for: .horizontal)
		cell.leftLabel.setContentCompressionResistancePriority(
			.defaultHigh,
			for: .horizontal)
		
		cell.rightLabel.numberOfLines = 0
		cell.rightLabel.setContentHuggingPriority(
			.defaultLow,
			for: .horizontal)
		cell.rightLabel.setContentCompressionResistancePriority(
			.defaultLow,
			for: .horizontal)
	}
	
	func rightSetup(_ cell: HorizontalLabelDemoCell) {
		cell.leftLabel.numberOfLines = 0
		cell.leftLabel.setContentHuggingPriority(
			.defaultLow,
			for: .horizontal)
		cell.leftLabel.setContentCompressionResistancePriority(
			.defaultLow,
			for: .horizontal)
		
		cell.rightLabel.numberOfLines = 1
		cell.rightLabel.setContentHuggingPriority(
			.defaultHigh,
			for: .horizontal)
		cell.rightLabel.setContentCompressionResistancePriority(
			.defaultHigh,
			for: .horizontal)
	}
	
	func leftSuperiorSetup(_ cell: HorizontalLabelDemoCell) {
		cell.leftLabel.numberOfLines = 1
		cell.leftLabel.setContentCompressionResistancePriority(
			.defaultHigh,
			for: .horizontal)
		
		cell.rightLabel.numberOfLines = 0
		cell.rightLabel.setContentCompressionResistancePriority(
			.defaultLow,
			for: .horizontal)
	}
	
	func rightSuperiorSetup(_ cell: HorizontalLabelDemoCell) {
		cell.leftLabel.numberOfLines = 0
		cell.leftLabel.setContentCompressionResistancePriority(
			.defaultLow,
			for: .horizontal)
		
		cell.rightLabel.numberOfLines = 1
		cell.rightLabel.setContentCompressionResistancePriority(
			.defaultHigh,
			for: .horizontal)
	}
	
	func testSetup(_ cell: HorizontalLabelDemoCell) {
		cell.leftLabel.setContentCompressionResistancePriority(
			UILayoutPriority(rawValue: 250.0),
			for: .horizontal)
		cell.rightLabel.setContentCompressionResistancePriority(
			UILayoutPriority(rawValue: 250.0),
			for: .horizontal)
		
		cell.leftLabel.numberOfLines = 1
		cell.rightLabel.numberOfLines = 0
	}
}

// MARK: - Data
extension HorizontalLabelsViewController {
	private var teams: [String] {
		return [
			"Arsenal",
			"Aston Villa",
			"Barnsley",
			"Birmingham City",
			"Blackburn Rovers",
			"Blackpool",
			"Bolton Wanderers",
			"AFC Bournemouth",
			"Bradford City",
			"Brighton and Hove Albion",
			"Burnley",
			"Cardiff City",
			"Charlton Athletic",
			"Chelsea",
			"Coventry City",
			"Crystal Palace",
			"Derby County",
			"Everton",
			"Fulham",
			"Huddersfield Town",
			"Hull City",
			"Ipswich Town",
			"Leeds United",
			"Leicester City",
			"Liverpool",
			"Manchester City",
			"Manchester United",
			"Middlesbrough",
			"Newcastle United",
			"Norwich City",
			"Nottingham Forest",
			"Oldham Athletic",
			"Portsmouth",
			"Queens Park Rangers",
			"Reading",
			"Sheffield United",
			"Sheffield Wednesday",
			"Southampton",
			"Stoke City",
			"Sunderland",
			"Swansea City",
			"Swindon Town",
			"Tottenham Hotspur",
			"Watford",
			"West Bromwich Albion",
			"West Ham United",
			"Wigan Athletic",
			"Wimbledon",
			"Wolverhampton Wanderers"
		]
	}
		
	private var stadiums: [String] {
		return [
			"Emirates Stadium",
			"Villa Park",
			"Oakwell",
			"St. Andrew's Trillion Trophy Stadium",
			"Ewood Park",
			"Bloomfield Road",
			"University of Bolton Stadium",
			"Vitality Stadium",
			"Valley Parade",
			"Amex Stadium",
			"Turf Moor",
			"Cardiff City Stadium",
			"The Valley",
			"Stamford Bridge",
			"Highfield Road",
			"Selhurst Park",
			"Pride Park Stadium",
			"Goodison Park",
			"Craven Cottage",
			"John Smith's Stadium",
			"KCOM Stadium",
			"Portman Road",
			"Elland Road",
			"King Power Stadium",
			"Anfield",
			"Etihad Stadium",
			"Old Trafford",
			"Riverside Stadium",
			"St. James' Park",
			"Carrow Road",
			"City Ground",
			"Boundary Park",
			"Fratton Park",
			"Loftus Road",
			"Madejski Stadium",
			"Bramall Lane",
			"Hillsborough",
			"St. Mary's Stadium",
			"bet365 Stadium",
			"Stadium of Light",
			"Liberty Stadium",
			"County Ground",
			"Tottenham Hotspur Stadium",
			"Vicarage Road",
			"The Hawthorns",
			"London Stadium",
			"DW Stadium",
			"Selhurst Park",
			"Molineux Stadium"
		]
	}
}

// MARK: - Property
extension HorizontalLabelsViewController: DemoPropertyStackViewDelegate {
	func propertyStackView(propertyStackView: DemoPropertyStackView, didReceiveTapAt index: Int) {
		demoMode = DemoMode.allCases[index]
	}
}
