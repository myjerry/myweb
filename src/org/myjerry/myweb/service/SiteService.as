package org.myjerry.myweb.service {
	
	import org.myjerry.myweb.db.SiteDB;

	public class SiteService {
		
		private var database:SiteDB;
		
		public function SiteService(db:SiteDB) {
			this.database = db;
		}
	}
}
