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
		
		public static const SITE_FILE_EXTENSION:String = 'myweb';
		
		protected var siteFile:File = null;
		
		protected var database:SiteDB = null;
		
		public function Site(siteFile:File) {
			this.siteFile = siteFile;
			this.database = new SiteDB(this.siteFile);

			ApplicationContext.initializeServices(this.database);
		}
		
		public static function createNewSite(siteName:String, projectFolder:String):void {
			var dbFile:File = new File(projectFolder).resolvePath(siteName + '.' + SITE_FILE_EXTENSION);
			if(dbFile.exists) {
				Alert.show('Site already exists, use open site.');
				return;
			}
			
			openSite(dbFile);
		}
		
		public static function openSite(siteFile:File):void {
			if(!StringUtils.equals(siteFile.extension, SITE_FILE_EXTENSION)) {
				Alert.show("Not a valid site file.");
				return;
			}
			
			ApplicationContext.setSite(new Site(siteFile));
		}
		
		public function closeSite():void {
			this.database.dispose();
			this.database = null;
			this.siteFile = null;
			
			ApplicationContext.popView();
		}
	}
}
