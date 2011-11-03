package org.myjerry.myweb.service {
	import mx.collections.ArrayList;
	
	import org.myjerry.as3extensions.db.Database;
	import org.myjerry.myweb.model.Page;
	import org.myjerry.myweb.model.PageContent;
	
	public class PageService {
		
		private var database:Database = null;
		
		public function PageService(db:Database) {
			this.database = db;
		}
		
		public function savePage(page:Page):Number {
			return NaN;
		}
		
		public function getPage(pageID:uint):Page {
			return null;
		}
		
		public function getPageContent(pageID:uint):PageContent {
			return null;
		}
		
		public function savePageContent(pageContent:PageContent):Boolean {
			return false;
		}
		
		public function getAllPages():ArrayList {
			return new ArrayList();
		}
	}
}