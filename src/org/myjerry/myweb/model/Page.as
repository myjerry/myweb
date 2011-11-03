package org.myjerry.myweb.model {
	
	public class Page {
		
		public var pageID:uint;
		
		public var title:String;
		
		public var path:String;
		
		public var userCreated:Boolean = true;
		
		public var searchable:Boolean = true;
		
		public var templateID:uint = 0;
		
		public function Page() {
		}
	}
}
