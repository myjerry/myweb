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

package org.myjerry.myweb.model {
	
	import flash.filesystem.File;
	
	import mx.controls.Alert;
	
	import org.myjerry.as3extensions.db.Database;
	import org.myjerry.as3extensions.io.FileChooser;
	import org.myjerry.as3extensions.io.FolderChooser;
	import org.myjerry.as3utils.StringUtils;
	import org.myjerry.myweb.ApplicationContext;
	import org.myjerry.myweb.db.SiteDB;
	import org.myjerry.myweb.service.LanguageService;
	import org.myjerry.myweb.service.PageService;
	import org.myjerry.myweb.service.ProjectService;
	import org.myjerry.myweb.service.TemplateService;

	public class Site {
		
		private static const TITLE_KEY:String = 'site.title';
		
		private static const TEMPLATE_ID:String = 'site.template.id';
		
		protected var siteFile:File = null;
		
		protected var database:SiteDB = null;
		
		public var title:String;
		
		public var templateID:int;
		
		public function Site(siteFile:File) {
			this.siteFile = siteFile;
			this.database = new SiteDB(this.siteFile);

			ApplicationContext.initializeServices(this.database);
		}
		
		public function closeSite():void {
			this.database.dispose();
			this.database = null;
			this.siteFile = null;
			
			ApplicationContext.popView();
		}
		
		public function loadSiteDetails():void {
			this.title = getPreference(TITLE_KEY);
			
			var temp:String = getPreference(TEMPLATE_ID);
			if(temp != null) {
				this.templateID = int(temp);
			} else {
				this.templateID = -1;
			}
		}
		
		public function saveSiteDetails():void {
			// do for site title
			saveSitePreference(TITLE_KEY, this.title);
			saveSitePreference(TEMPLATE_ID, String(this.templateID));
		}
		
		private function saveSitePreference(key:String, value:String):void {
			var pref:SitePreference = ApplicationContext.siteService.getPreference(key);
			if(pref == null) {
				pref = new SitePreference(key, value);
			} else {
				pref.value = value;
			}
			this.database.save(pref);
		}
		
		private function getPreference(key:String):String {
			var pref:SitePreference = ApplicationContext.siteService.getPreference(key);
			if(pref != null) {
				return pref.value;
			}
			
			return '';
		}
	}
}
