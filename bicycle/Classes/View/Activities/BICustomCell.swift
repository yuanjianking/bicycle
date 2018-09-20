//
//  BICustomCell.swift
//  bicycle
//
//  Created by linkage on 2018/9/11.
//  Copyright © 2018年 yuanjian. All rights reserved.
//

import UIKit

class BICustomCell: UITableViewCell {
    
    let imageView_W = 120.0//w:h = 4:3
    let imageView_H = 90.0
    let subView_interval:CGFloat = 15.0
    
    var leftImageView : UIImageView?
    var nameLabel     : UILabel?
    var subNameLabel  : UILabel?
    var timeLabel     : UILabel?
    var browseLabel   : UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //不能被点击
        //self.selectionStyle = UITableViewCellSelectionStyle.none
        
        self.createCellUI()
    }
    
    func updateUI(title: String){
        nameLabel?.text = "自行车结伴同行" + title;
    }
    
    func createCellUI(){
        
        leftImageView = UIImageView.init(frame : CGRect(x:15.0,y:15.0,width:imageView_W,height:imageView_H))
        leftImageView!.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(leftImageView!)
        leftImageView?.image = UIImage(named: "timg.png")
        
        //name
        nameLabel = UILabel.init(frame: CGRect(x:Max_X(object:leftImageView!) + subView_interval,y:subView_interval,width:SCREEN_WIDTH - Max_X(object:leftImageView!) - 2 * subView_interval,height:25.0))
        nameLabel?.textColor = UIColor.darkText
        nameLabel?.font = UIFont.systemFont(ofSize: 18)
        
        self.contentView.addSubview(nameLabel!)
        
        subNameLabel = UILabel.init(frame: CGRect(x:X(object:nameLabel!),y:Max_Y(object: nameLabel!) + 5,width:W(object: nameLabel!),height:25))
        subNameLabel?.textColor = UIColor.darkGray
        subNameLabel?.font = UIFont.systemFont(ofSize: 15)
        subNameLabel?.text = "结伴同行";
        self.contentView.addSubview(subNameLabel!)
        
        timeLabel = UILabel.init(frame: CGRect(x:X(object:nameLabel!),y:100-15,width:W(object: subNameLabel!) * 0.6,height:20))
        timeLabel?.textColor = UIColor.cz_color(withHex: 0x43CD80)
        timeLabel?.font = UIFont.systemFont(ofSize: 13)
        timeLabel?.text = "30km (100min)"
        self.contentView.addSubview(timeLabel!)
        
//        browseLabel = UILabel.init(frame: CGRect(x:Max_X(object: timeLabel!),y:Y(object: timeLabel!),width:W(object: subNameLabel!) * 0.4,height:20))
//        browseLabel?.textAlignment = NSTextAlignment.right
//        browseLabel?.textColor = UIColor.lightGray
//        browseLabel?.font = UIFont.systemFont(ofSize: 13)
//        browseLabel?.text = "浏览："+"50"
//        self.contentView.addSubview(browseLabel!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
