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
	import flash.filesystem.File;
	
	import mx.controls.Alert;
	
	import org.myjerry.as3utils.StringUtils;
	import org.myjerry.myweb.ApplicationContext;
	import org.myjerry.myweb.db.SiteDB;
	import org.myjerry.myweb.model.Site;
	import org.myjerry.myweb.model.SitePreference;

	public class SiteService {
		
		public static const SITE_FILE_EXTENSION:String = 'myweb';
		
		private var database:SiteDB;
		
		public function SiteService(db:SiteDB) {
			this.database = db;
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
		
		public function savePreference(sitePreference:SitePreference):uint {
			this.database.save(sitePreference);
			return sitePreference.prefID;
		}
		
		public function getPreference(key:String):SitePreference {
			try {
				var result:SQLResult = this.database.executeSQLQuery("SELECT * FROM sitePreferences WHERE key = '" + key + "'");
				if(result != null && result.data != null) {
					var row:Object = result.data[0];
					var sp:SitePreference = new SitePreference();
					sp.prefID = row.id;
					sp.key = row.key;
					sp.value = row.value;
					
					return sp;
				}
			} catch(e:Error) {
				trace(e.getStackTrace());
			}
			
			return null;
		}
	}
}
