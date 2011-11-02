package org.myjerry.myweb.db {
	
	import flash.filesystem.File;
	
	import org.myjerry.as3extensions.db.Database;
	
	public class SiteDB extends Database {
		
		protected var dbFile:File = null;
		
		public function SiteDB(file:File) {
			this.dbFile = file;

			super();
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
		}
	}
}
