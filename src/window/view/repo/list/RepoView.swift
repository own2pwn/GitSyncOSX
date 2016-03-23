import Foundation

//1. tree-structured xml (requires you to make the DataBase class)

//2. revealInFinder and open in safari for path and URL

//3. save to xml after each remove and add and each repo-settings-update (this involves creating the dp->xml method)

//4. hook up the leftSideBar to app logic

//5. next is to create the activity list and load in the last 5 commits from each repo. and then sync repos

class RepoView:Element{//rename to RepoListView
    var topBar:TopBar?
    var list:List?
    override func resolveSkin() {
        //Swift.print("RepoView.resolveSkin()")
        StyleManager.addStyle("RepoView{padding-top:8px;}")//padding-left:6px;padding-right:6px;
        super.resolveSkin()
        topBar = addSubView(TopBar(width,24,self))
        
        //let dp:DataProvider = DataProvider()
        //dp.addItems([["title":"brown"],["title":"pink"],["title":"purple"]])
        
        let xml = FileParser.xml("~/Desktop/repo.xml")
        let dp:DataProvider = DataProvider(xml)
        StyleManager.addStyle("RepoView List Container SelectTextButton{height:32px;}")
        StyleManager.addStyle("RepoView List Container SelectTextButton Text{margin-top:8px;}")
        
        list = addSubView(List(width, height-24, NaN, dp, self))
        ListModifier.selectAt(list!, 0)
    }
    override func onEvent(event: Event) {
        if(event.type == ButtonEvent.upInside && event.origin === topBar!.addButton){
            Swift.print("addButton.click")
            list!.dataProvider.addItemAt(["title":"New repo","local-path":"","remote-path":"","interval":"30","keychain-item-name":"","branch":"master","broadcast":"true","subscribe":"true","auto-sync":"true"], 0)
            ListModifier.selectAt(list!, 0)
            list!.onEvent(ListEvent(ListEvent.select,0,list!))
        }else if(event.type == ListEvent.select){
            Swift.print("RepoView select")
            super.onEvent(event)//forward this event to the parent
        }
    }
}