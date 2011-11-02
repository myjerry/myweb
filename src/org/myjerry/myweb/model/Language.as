package org.myjerry.myweb.model
{
	public class Language {
		
		public static const ACTIONSCRIPT:Language = new Language(0);
		
		public static const JAVA:Language = new Language(0);
		
		private var id:int = -1;
		
		public function Language(id:uint) {
			this.id = id;
		}
	}
}