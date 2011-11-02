package org.myjerry.myweb.service {
	
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	
	import mx.collections.ArrayList;
	
	import org.myjerry.as3extensions.db.Database;
	import org.myjerry.myweb.model.Project;
	
	public class ProjectService {
		
		protected var database:Database = null;
		
		public function ProjectService(db:Database) {
			super();
			
			this.database = db;
		}
		
		public function saveProject(project:Project):Number {
			var statement:SQLStatement;
			
			if(project.projectID == 0) {
				statement = this.database.getStatement("INSERT INTO projects (name, description, summary) VALUES (:name, :description, :summary)");
			} else {
				statement = this.database.getStatement("UPDATE projects SET name = :name, description = :description, summary = :summary WHERE id = :id");
				statement.parameters[":id"] = project.projectID;
			}
			
			statement.parameters[":name"] = project.name;
			statement.parameters[":description"] = project.description;
			statement.parameters[":summary"] = project.summary;
			
			statement.execute();
			
			var result:SQLResult = statement.getResult();
			return result.lastInsertRowID;
		}
		
		public function getAllProjects():ArrayList {
			var projects:ArrayList = new ArrayList();
			
			var statement:SQLStatement = this.database.getStatement("SELECT * FROM projects");
			statement.execute();
			
			var result:SQLResult = statement.getResult();
			if(result != null && result.data != null && result.data.length > 0) {
				for(var index:int = 0; index < result.data.length; index++) {
					var row:Object = result.data[index];
					
					var project:Project = new Project();
					project.projectID = row.id;
					project.name = row.name;
					project.description = row.description;
					project.summary = row.summary;
					
					projects.addItem(project);
				}
			}
			
			return projects;
		}
		
		public function deleteProject(projectID:uint):Boolean {
			var statement:SQLStatement = this.database.getStatement("DELETE FROM projects WHERE id = :id");
			statement.parameters[":id"] = projectID;
			
			statement.execute();
			
			var result:SQLResult = statement.getResult();
			if(result.rowsAffected == 1) {
				return true;
			}
			
			return false;
		}
	}
}