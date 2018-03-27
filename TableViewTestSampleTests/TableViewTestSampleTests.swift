import XCTest
@testable import TableViewTestSample

class TableViewTestSampleTests: XCTestCase {
    
    func test_tableViewが表示されること() {
        let vc = ViewController()
        XCTAssertNotNil(vc.tableView)
        XCTAssertTrue(vc.view.subviews.contains(vc.tableView))
    }
    
    func test_sectionが2つあること() {
        let vc = ViewController()
        
        let sectionCount = vc.numberOfSections(in: vc.tableView)
        XCTAssertEqual(sectionCount, 2)
    }
    
    func test_1つ目のsectionにはセルが1つだけであること() {
        let vc = ViewController()
        
        let rowCount = vc.tableView(vc.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, 1)
    }

    func test_2つ目のsectionには与えられたアイテムの数だけセルが表示されること() {
        let vc = ViewController()
        
        // ダミーのデータを設定する
        let testItems = ["test-item-1", "test-item-2"]
        vc.items = testItems
        
        let rowCount = vc.tableView(vc.tableView, numberOfRowsInSection: 1)
        XCTAssertEqual(rowCount, testItems.count)
    }
    
    func test_Cellのテキストに期待されたラベルが表示されていること() {
        let vc = ViewController()
        
        let testItems = ["test-item-1"]
        vc.items = testItems
        
//        このメソッドは表示中のセルしか取得できない
//        vc.tableView.cellForRow(at: IndexPath(row: 0, section: 1))
        let cell = vc.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 1))
        XCTAssertEqual(cell.textLabel?.text, "test-item-1")
    }
}
