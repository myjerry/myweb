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

package org.myjerry.myweb.db {
	
	import flash.filesystem.File;
	
	import org.myjerry.as3extensions.db.ORMDatabase;
	
	public class SiteDB extends ORMDatabase {
		
		protected var dbFile:File = null;
		
		public function SiteDB(file:File) {
			this.dbFile = file;

			// do not generate the database tables
			super(false);
		}
		
		override public function initialize():void {
			this.dbConnection = initializeFromFile(this.dbFile);
			
			createDatabaseTables();
		}
		
		protected function createDatabaseTables():void {
			var query:String;
			
			query = "CREATE TABLE IF NOT EXISTS projects (" +
				"    id       		INTEGER PRIMARY KEY AUTOINCREMENT," +
				"    name      		TEXT NOT NULL," +
				"    description    TEXT," +
				"	 summary		TEXT" +
				")";
			executeSQLQuery(query);
			
			query = "CREATE TABLE IF NOT EXISTS templates (" +
				"    id       		INTEGER PRIMARY KEY AUTOINCREMENT," +
				"    name      		TEXT NOT NULL," +
				"    code		    TEXT" +
				")";
			executeSQLQuery(query);
			
			query = "CREATE TABLE IF NOT EXISTS pages (" +
				"	id				INTEGER PRIMARY KEY AUTOINCREMENT," +
				"	path			TEXT NOT NULL," +
				"	searchable		BOOLEAN," +
				"	title			TEXT," +
				"	draft			BOOLEAN," +
				"	templateID		INTEGER," +
				"	userCreated		BOOLEAN," +
				"	FOREIGN KEY(templateID) REFERENCES templates(id)" +
				")";
			executeSQLQuery(query);
			
			query = "CREATE TABLE IF NOT EXISTS languages (" +
				"	id				INTEGER PRIMARY KEY AUTOINCREMENT," +
				"	name			TEXT NOT NULL," +
				"	extensions		TEXT NOT NULL" +
				")";
			executeSQLQuery(query);
			
			query = "CREATE TABLE IF NOT EXISTS sitePreferences (" +
				"	id				INTEGER PRIMARY KEY AUTOINCREMENT," +
				"	key				TEXT NOT NULL," +
				"	value			TEXT" +
				")";
			executeSQLQuery(query);
			
			query = "CREATE TABLE IF NOT EXISTS pageContents (" +
				"	id				INTEGER," +
				"	content			TEXT NOT NULL," +
				"	FOREIGN KEY(id) REFERENCES pages(id)" +
				")";
			executeSQLQuery(query);
		}
		
	}
}
