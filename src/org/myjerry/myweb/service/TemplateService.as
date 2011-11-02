package org.myjerry.myweb.service {
	
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	
	import mx.collections.ArrayList;
	
	import org.myjerry.as3extensions.db.Database;
	import org.myjerry.myweb.model.Template;

	public class TemplateService {
		
		protected var database:Database = null;
		
		public function TemplateService(db:Database) {
			this.database = db;
		}
		
		public function saveTemplate(template:Template):Number {
			var statement:SQLStatement;
			
			if(template.templateID == 0) {
				statement = this.database.getStatement("INSERT INTO templates (name, code) VALUES (:name, :code)");
			} else {
				statement = this.database.getStatement("UPDATE templates SET name = :name, code = :code WHERE id = :id");
				statement.parameters[":id"] = template.templateID;
			}
			
			statement.parameters[":name"] = template.name;
			statement.parameters[":code"] = template.code;
			
			statement.execute();
			
			return statement.getResult().lastInsertRowID;
		}
		
		public function getTemplates():ArrayList {
			var vector:ArrayList = new ArrayList();
			
			var statement:SQLStatement = this.database.getStatement("SELECT * FROM templates");
			statement.execute();
			
			var result:SQLResult = statement.getResult();
			if(result != null && result.data != null && result.data.length > 0) {
				for(var index:int = 0; index < result.data.length; index++) {
					var row:Object = result.data[index];
					
					var template:Template = new Template();
					template.templateID = row.id;
					template.name = row.name;
					template.code = row.code;
					
					vector.addItem(template);
				}
			}
			
			return vector;
		}
	}
}
