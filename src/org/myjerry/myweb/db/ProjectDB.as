package org.myjerry.myweb.db {
	
	import flash.filesystem.File;
	
	import org.myjerry.as3extensions.db.Database;
	
	public class ProjectDB extends Database {
		
		protected var dbFile:File = null;
		
		public function ProjectDB(file:File) {
			this.dbFile = file;

			super();
		}
		
		override public function initialize():void {
			this.dbConnection = initializeFromFile(this.dbFile);
		}
	}
}
