package org.myjerry.myweb.service {
	
	import org.myjerry.myweb.db.SiteDB;
	import org.myjerry.myweb.model.Language;
	
	public class LanguageService {
		
		protected var database:SiteDB = null;
		
		public function LanguageService(db:SiteDB) {
			this.database = db;
		}
		
		public function saveLanguage(language:Language):void {
			this.database.save(language);
		}
	}
}
