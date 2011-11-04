/**
 *
 * myweb - Static Site Generator
 * Copyright (C) 2011, myJerry Developers
 * http://www.myjerry.org/myweb
 *
 * The file is licensed under the the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package org.myjerry.myweb.service {
	
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	
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
			var statement:SQLStatement = this.database.getStatement("INSERT OR REPLACE INTO pageContents (id, content) VALUES (:id, :content)");
			statement.parameters[":id"] = pageContent.pageID;
			statement.parameters[":content"] = pageContent.content;
			statement.execute();
			
			var result:SQLResult = statement.getResult();
			return result.lastInsertRowID;
		}
		
		public function getAllPages():ArrayList {
			var list:ArrayList = this.database.findAll(Page as Class);
			return list;
		}
		
		public function deletePage(pageID:uint):void {
			this.database.removeID(Page as Class, pageID);
		}
	}
}