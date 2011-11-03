package org.myjerry.myweb.model {
	
	[Table(name="languages")]
	public class Language {
		
		[Id]
		[Column(name="id")]
		public var languageID:uint;
		
		[Column(name="name")]
		public var name:String;
		
		[Column(name="extensions")]
		public var extensions:String;
		
	}
}
