package org.myjerry.myweb.service {
	import flash.utils.getDefinitionByName;
	
	import mx.collections.ArrayList;
	
	import org.myjerry.myweb.db.SiteDB;
	import org.myjerry.myweb.model.Page;
	import org.myjerry.myweb.model.PageContent;
	
	public class PageService {
		
		private var database:SiteDB = null;
		
		public function PageService(db:SiteDB) {
			this.database = db;
		}
		
		public function savePage(page:Page):Number {
			this.database.save(page);
			return page.pageID;
		}
		
		public function getPage(pageID:uint):Page {
			var page:Page = this.database.find(Page as Class, pageID) as Page;
			return page;
		}
		
		public function getPageContent(pageID:uint):PageContent {
			var pageContent:PageContent = this.database.find(PageContent as Class, pageID) as PageContent;
			return pageContent;
		}
		
		public function savePageContent(pageContent:PageContent):Number {
			this.database.save(pageContent);
			return pageContent.pageID;
		}
		
		public function getAllPages():ArrayList {
			var list:ArrayList = this.database.findAll(Page as Class);
			return list;
		}
	}
}