package org.myjerry.myweb.model {
	
	[Table(name="pages")]
	public class Page {
		
		[Id]
		[Column(name="id")]
		public var pageID:uint;
		
		[Column(name="title")]
		public var title:String;
		
		[Column(name="path")]
		public var path:String;
		
		public var userCreated:Boolean = true;
		
		public var searchable:Boolean = true;
		
		[Column(name="templateID")]
		public var templateID:uint = 0;
		
		public function Page() {
		}
	}
}
