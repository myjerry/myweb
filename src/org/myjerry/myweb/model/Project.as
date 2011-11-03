package org.myjerry.myweb.model {
	
	[Table(name="projects")]
	public class Project {
		
		[Id]
		[Column(name="id")]
		public var projectID:uint;
		
		[Column(name="name")]
		public var name:String;
		
		[Column(name="description")]
		public var description:String;
		
		[Column(name="summary")]
		public var summary:String;
		
		public function Project() {
		}
	}
}
