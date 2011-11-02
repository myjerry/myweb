package org.myjerry.myweb.model {
	
	public class ProjectHost {
		
		public static const GIT_HUB:ProjectHost = new ProjectHost(0);
		
		public static const SOURCE_FORGE:ProjectHost = new ProjectHost(1);
		
		private var id:int = -1;
		
		public function ProjectHost(id:uint) {
			this.id = id;
		}
	}
}
