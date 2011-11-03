package org.myjerry.myweb.model {
	
	[Table(name="templates")]
	public class Template {
		
		[Id]
		[Column(name="id")]
		public var templateID:uint = 0;
		
		[Column(name="name")]
		public var name:String;
		
		[Column(name="code")]
		public var code:String;
		
	}
}
