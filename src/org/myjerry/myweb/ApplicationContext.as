package org.myjerry.myweb {
	
	import flash.errors.IllegalOperationError;
	
	import mx.core.FlexGlobals;
	import mx.core.IVisualElement;
	
	import org.myjerry.myweb.model.Site;
	import org.myjerry.myweb.views.SiteHomeView;

	public class ApplicationContext {
		
		public static const instance:ApplicationContext = new ApplicationContext();
		
		private static var count:uint = 0;
		
		public function ApplicationContext() {
			if(count > 0) {
				throw new IllegalOperationError('The class cannot be initialized.');
			}
			
			count++;
		}
		
		public static const application:myweb = FlexGlobals.topLevelApplication as myweb;
		
		public static function pushView(component:IVisualElement):void {
			application.myViewStack.push(component);
		}
		
		public static function popView():IVisualElement {
			return application.myViewStack.pop();
		}
		
		public static function removeView(element:IVisualElement):Boolean {
			return application.myViewStack.removeView(element);
		}
		
		private static var _site:Site;
		
		public static function get site():Site {
			return _site;
		}
		
		public static function setSite(site:Site):void {
			_site = site;
			
			pushView(new SiteHomeView());
		}
	}
}
