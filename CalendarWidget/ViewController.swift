import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var choosenDate=""
    
    @IBOutlet weak var Calendar: UICollectionView!
    @IBOutlet weak var currenyDateLabel: UILabel!
    
    let Months = ["Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień"]
    let Days = ["Poniedziałek","Wtorek","Środa","Czwartek","Piątek","Sobota","Niedziela"]
    let weekeendDaysCells = [5,6,12,13,19,20,26,27,33,34]
    let DaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonth = String()
    var monthId = month
    var yearId = year
    var currentCell: UICollectionViewCell?
    var previousCell: UICollectionViewCell?
    
    var NumberOfEmptyBox = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        currentMonth = Months[month]
        monthId = month+1
        currenyDateLabel.text="\(currentMonth) \(year)"
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
 -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateViewCell
        cell.backgroundColor = UIColor.clear
    cell.isHidden=false
    
        if NumberOfEmptyBox < 1     // if first day in calander shoud be moved add empty boxes if box content is less than 1 hide this cell
        {
            cell.dayLabel.text = "\(indexPath.row+1+NumberOfEmptyBox)"
        }
    
        if Int(cell.dayLabel.text!)! < 1
        {
            cell.isHidden=true
        }
        cell.dayLabel.textColor = UIColor.black
        if weekeendDaysCells.contains(indexPath.row)
        {
            cell.dayLabel.textColor = UIColor.lightGray
        }
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dateComponent.month = monthId
        dateComponent.year = yearId
        date = calendar.date(from: dateComponent)!
        monthRange = calendar.range(of: .day, in: .month, for: date)!
        NumberOfEmptyBox = 0 - calendar.component(.weekday, from: date)
        if NumberOfEmptyBox == -7
        {
            NumberOfEmptyBox = 0
        }
        let daysInMonth = monthRange.count-NumberOfEmptyBox //total cells in calendar with empty boxes
        return daysInMonth
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row > 1
        {
            if previousCell != nil
            {
                previousCell?.layer.borderWidth = 0
                previousCell?.layer.borderColor = UIColor.clear.cgColor
            }
            currentCell = collectionView.cellForItem(at: indexPath)
            currentCell?.layer.borderWidth = 3
            currentCell?.layer.cornerRadius = 5
            currentCell?.layer.borderColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0).cgColor
            let label = currentCell as! DateViewCell
            var choosenDay = label.dayLabel.text
            previousCell = currentCell
        }
    }

    @IBAction func nextMonth(_ sender: Any) {
        
        switch currentMonth {
        case "Grudzień":
            month = 0
            monthId=1
            year+=1
        default:
            month+=1
            monthId+=1
        }
        currentMonth = Months[month]
        currenyDateLabel.text="\(currentMonth) \(year)"
        Calendar.reloadData()
    }
    
    
    @IBAction func previousMonth(_ sender: Any) {
        switch currentMonth {
        case "Styczeń":
            month = 11
            monthId=12
            year-=1

        default:
            month-=1
            monthId-=1
        }
        currentMonth = Months[month]
        currenyDateLabel.text="\(currentMonth) \(year)"
        Calendar.reloadData()
    }
    


}

