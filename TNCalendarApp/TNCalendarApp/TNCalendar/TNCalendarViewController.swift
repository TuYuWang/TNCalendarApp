//
//  TNCalendarViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/20.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import JTAppleCalendar

let calendar_edege_top    = 140.toPixel()
let calendar_edege_bottom = 650.toPixel()
let calendarHeight        = SCREEN_HEIGHT - calendar_edege_bottom - calendar_edege_top
let calendar_headHeight   = calendarHeight/8

class TNCalendarViewController: TNBaseViewController {

    var calendarView: JTAppleCalendarView!
    var calendarTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "CALENDAR"
        setItemType(left: .menu, right: .setting, menu: .present)
        
        let headView = Bundle.main.loadNibNamed("CalendarHeadView", owner: nil, options: nil)?.first as! UIView
        view.addSubview(headView)
        headView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(0)
            make.top.equalTo(64)
            make.height.equalTo(calendar_headHeight)
        }
        
        calendarView = JTAppleCalendarView()
        calendarView.calendarDelegate = self
        calendarView.calendarDataSource = self
        calendarView.scrollDirection = .horizontal
        calendarView.isPagingEnabled = true
        calendarView.bounces = false
        calendarView.showsHorizontalScrollIndicator = false
        calendarView.backgroundColor = .clear
        calendarView.selectDates([Date()])
        view.addSubview(calendarView)
        calendarView.register(UINib(nibName: "CellView", bundle: nil), forCellWithReuseIdentifier: "CellView")
        calendarView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(calendar_edege_top+calendar_headHeight, 0, calendar_edege_bottom, 0))
        }
        
        calendarTableView = UITableView()
        calendarTableView.dataSource = self
        calendarTableView.delegate = self
        view.addSubview(calendarTableView)
        
        calendarTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        calendarTableView.snp.makeConstraints { (make) in
            make.top.equalTo(calendarView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(-TABBAR_HEIGHT)
        }
        
    }


    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        
        guard let myCustomCell = view as? CellView  else {
            return
        }
        
        if cellState.dateBelongsTo == .thisMonth {
            myCustomCell.dayLabel.textColor = .white
        } else {
            myCustomCell.dayLabel.textColor = Hex("#bac8e1")
        }
    }
    
    func handleCellSelection(view: JTAppleCell?, cellState: CellState) {
        guard let myCustomCell = view as? CellView  else {
            return
        }
        myCustomCell.squareLine.isHidden = !cellState.isSelected
//        myCustomCell.dayLabel.isHidden
    }
}

extension TNCalendarViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendarView.dequeueReusableJTAppleCell(withReuseIdentifier: "CellView", for: indexPath)
        let myCustomCell = cell as! CellView

        myCustomCell.dayLabel.text = cellState.text
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelection(view: cell, cellState: cellState)
        return cell
        
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        let startDate = formatter.date(from: "2017 1 1")!
        let endDate = formatter.date(from: "2018 12 31")!
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6,
                                                 calendar: Calendar.current,
                                                 generateInDates: .forAllMonths,
                                                 generateOutDates: .tillEndOfRow,
                                                 firstDayOfWeek: .sunday)
        return parameters
    }
    
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let myCustomCell = cell as! CellView
        
        // Setup Cell text
        myCustomCell.dayLabel.text = cellState.text
        
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelection(view: cell, cellState: cellState)
    }

    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelection(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelection(view: cell, cellState: cellState)
    }
    
    
}

extension TNCalendarViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    

}
