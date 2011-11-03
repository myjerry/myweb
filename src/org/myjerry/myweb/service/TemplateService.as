package org.myjerry.myweb.service {
	
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	
	import mx.collections.ArrayList;
	
	import org.myjerry.myweb.db.SiteDB;
	import org.myjerry.myweb.model.Template;

	public class TemplateService {
		
		protected var database:SiteDB = null;
		
		public function TemplateService(db:SiteDB) {
			this.database = db;
		}
		
		public function deleteTemplate(templateID:uint):Boolean {
			this.database.removeID(Template as Class, templateID);
			return true;
		}
		
		public function saveTemplate(template:Template):Number {
			this.database.save(template);
			return template.templateID;
		}
		
		public function getTemplates():ArrayList {
			var templates:ArrayList = this.database.findAll(Template as Class);
			return templates;
		}
	}
}
