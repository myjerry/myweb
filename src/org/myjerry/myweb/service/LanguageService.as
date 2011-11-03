package org.myjerry.myweb.service {
	
	import mx.collections.ArrayList;
	
	import org.myjerry.myweb.db.SiteDB;
	import org.myjerry.myweb.model.Language;
	
	public class LanguageService {
		
		protected var database:SiteDB = null;
		
		public function LanguageService(db:SiteDB) {
			this.database = db;
		}
		
		public function saveLanguage(language:Language):uint {
			this.database.save(language);
			return language.languageID;
		}
		
		public function getAllLanguages():ArrayList {
			var langs:ArrayList = this.database.findAll(Language as Class);
			return langs;
		}
		
		public function deleteLanguage(languageID:uint):void {
			this.database.removeID(Language as Class, languageID);
		}
	}
}
