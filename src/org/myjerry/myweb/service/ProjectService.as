package org.myjerry.myweb.service {
	
	import flash.data.SQLStatement;
	
	import org.myjerry.as3extensions.db.Database;
	import org.myjerry.myweb.model.Project;
	
	public class ProjectService {
		
		protected var database:Database = null;
		
		public function ProjectService(db:Database) {
			super();
			
			this.database = db;
		}
		
		public function saveProject(project:Project):Boolean {
			return false;
		}
		
	}
}