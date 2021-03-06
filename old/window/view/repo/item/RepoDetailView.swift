import Foundation

class RepoDetailView:Element{
    var nameTextInput:TextInput?
    var localPathTextInput:TextInput?
    var remotePathTextInput:TextInput?
    var broadCastCheckBoxButton:CheckBoxButton?
    var subscribeCheckBoxButton:CheckBoxButton?
    var autoSyncCheckBoxButton:CheckBoxButton?
    var autoSyncIntervalLeverSpinner:LeverSpinner?
    var topBar:RepoItemTopBar?
    override func resolveSkin() {
        StyleManager.addStyle("RepoDetailView{padding-top:8px;padding-left:6px;padding-right:6px;}")
        super.resolveSkin()
        
        topBar = addSubView(RepoItemTopBar(width-12,24,self))

        StyleManager.addStyle("RepoDetailView TextInput Text{width:90px;}")
        StyleManager.addStyle("RepoDetailView TextInput TextArea{width:380px;}RepoDetailView TextInput TextArea Text{width:370px;}")
        //StyleManager.addStyle("RepoDetailView TextInput TextArea{drop-shadow:none;line-alpha:0;line-thickness:0px;}")
        StyleManager.addStyle("RepoDetailView CheckBoxButton{clear:left;}")
        StyleManager.addStyle("RepoDetailView CheckBoxButton CheckBox{float:right;}")
        StyleManager.addStyle("RepoDetailView CheckBoxButton{width:105px;height:24px;}")
        StyleManager.addStyle("RepoDetailView Spinner TextInput Text{width:90px;}")
        StyleManager.addStyle("RepoDetailView Spinner TextInput TextArea{width:60px;}")
        StyleManager.addStyle("RepoDetailView Spinner TextInput{width:150px;}")
        
        nameTextInput = addSubView(TextInput(width, 32, "Name: ", "", self))
        localPathTextInput = addSubView(TextInput(width, 32, "Local-path: ", "", self))
        remotePathTextInput = addSubView(TextInput(width, 32, "Remote-path: ", "", self))
        broadCastCheckBoxButton = addSubView(CheckBoxButton(width, 32, "Broadcast:", false, self))
        subscribeCheckBoxButton = addSubView(CheckBoxButton(width, 32, "Subscribe:", false, self))
        autoSyncCheckBoxButton = addSubView(CheckBoxButton(width, 32, "Auto-sync:", false, self))
        autoSyncIntervalLeverSpinner = addSubView(LeverSpinner(width, 32, "Auto-Interval: ", 0, 1, Int.min.cgFloat, Int.max.cgFloat, 0, 100, 200, self))
    
        /*
        let repoData = RepoData.sharedInstance
        let repoItem = repoData.node.xml//repoData.dp.getItemAt(repoData.selectedIndex!)!
        setRepoData(repoItem)//updates the UI elements with the selected repo data
        */
    }
    /**
     *
     */
    func setRepoData(repoData:Dictionary<String,String>){
        nameTextInput!.inputTextArea!.setTextValue(repoData["title"]!)
        localPathTextInput!.inputTextArea!.setTextValue(repoData["local-path"]!)
        remotePathTextInput!.inputTextArea!.setTextValue(repoData["remote-path"]!)
        broadCastCheckBoxButton!.setChecked(repoData["broadcast"]!.bool)
        subscribeCheckBoxButton!.setChecked(repoData["subscribe"]!.bool)
        autoSyncCheckBoxButton!.setChecked(repoData["auto-sync"]!.bool)
        autoSyncIntervalLeverSpinner!.setValue(repoData["interval"]!.cgFloat)
    }
    
}

