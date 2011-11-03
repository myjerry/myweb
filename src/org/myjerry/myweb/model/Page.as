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

		[Column(name="user_created")]
		public var userCreated:Boolean = true;
		
		[Column(name="searchable")]
		public var searchable:Boolean = true;
		
		[Column(name="draft")]
		public var isDraft:Boolean = false;
		
		[Column(name="templateID")]
		public var templateID:uint = 0;
		
	}
}
