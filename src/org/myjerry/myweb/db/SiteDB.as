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
		}
	}
}
