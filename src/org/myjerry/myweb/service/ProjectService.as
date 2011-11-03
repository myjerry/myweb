package org.myjerry.myweb.service {
	
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	
	import mx.collections.ArrayList;
	
	import org.myjerry.myweb.db.SiteDB;
	import org.myjerry.myweb.model.Project;
	
	public class ProjectService {
		
		protected var database:SiteDB = null;
		
		public function ProjectService(db:SiteDB) {
			super();
			
			this.database = db;
		}
		
		public function saveProject(project:Project):Number {
			this.database.save(project);
			return project.projectID;
		}
		
		public function getAllProjects():ArrayList {
			var projects:ArrayList = this.database.findAll(Project as Class);
			return projects;
		}
		
		public function deleteProject(projectID:uint):Boolean {
			this.database.removeID(Project as Class, projectID);
			return true;
		}
	}
}