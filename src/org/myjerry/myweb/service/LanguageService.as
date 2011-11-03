package org.myjerry.myweb.service {
	
	import org.myjerry.as3extensions.db.Database;
	import org.myjerry.myweb.model.Language;
	
	public class LanguageService {
		
		protected var database:Database = null;
		
		public function LanguageService(db:Database) {
			this.database = db;
		}
		
		public function saveLanguage(language:Language):void {
			
		}
	}
}
