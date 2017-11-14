//
//  TNCalendarViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/20.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import JTAppleCalendar

class TNCalendarViewController: TNBaseViewController {

    var calendarView: JTAppleCalendarView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "CALENDAR"
        
        calendarView = JTAppleCalendarView()
        calendarView.cellSize = SCREEN_WIDTH/7
        calendarView.calendarDelegate = self
        calendarView.calendarDataSource = self
        calendarView.scrollDirection = .horizontal
        calendarView.isPagingEnabled = true
        calendarView.bounces = false
        calendarView.showsHorizontalScrollIndicator = false
        calendarView.backgroundColor = .clear
        view.addSubview(calendarView)
        calendarView.register(UINib(nibName: "CellView", bundle: nil), forCellWithReuseIdentifier: "CellView")
        calendarView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 470.toPixel(), 0))
        }
    }


    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        
        guard let myCustomCell = view as? CellView  else {
            return
        }

        if cellState.isSelected {
//            myCustomCell.dayLabel.textColor = .gray
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                myCustomCell.dayLabel.textColor = .white
            } else {
                myCustomCell.dayLabel.textColor = .gray
            }
        }
    }
    
    func handleCellSelection(view: JTAppleCell?, cellState: CellState) {
        guard let myCustomCell = view as? CellView  else {
            return
        }
        if cellState.isSelected {
            myCustomCell.selectedView.isHidden = false
        } else {
            myCustomCell.selectedView.isHidden = true
        }
    }
}

extension TNCalendarViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendarView.dequeueReusableJTAppleCell(withReuseIdentifier: "CellView", for: indexPath)
        let myCustomCell = cell as! CellView

        myCustomCell.dayLabel.text = cellState.text

        return cell
        
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        let startDate = formatter.date(from: "2016 02 01")!
        let endDate = Date()
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6,
                                                 calendar: Calendar.current,
                                                 generateInDates: .forAllMonths,
                                                 generateOutDates: .tillEndOfGrid,
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
