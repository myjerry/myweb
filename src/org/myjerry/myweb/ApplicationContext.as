package org.myjerry.myweb {
	
	import flash.errors.IllegalOperationError;
	
	import mx.core.FlexGlobals;
	import mx.core.IVisualElement;
	
	import org.myjerry.myweb.db.SiteDB;
	import org.myjerry.myweb.model.Site;
	import org.myjerry.myweb.service.LanguageService;
	import org.myjerry.myweb.service.PageService;
	import org.myjerry.myweb.service.ProjectService;
	import org.myjerry.myweb.service.SiteService;
	import org.myjerry.myweb.service.TemplateService;
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

		private static var _projectService:ProjectService = null;
		
		public static function get projectService():ProjectService {
			return _projectService;
		}
		
		private static var _templateService:TemplateService = null;
		
		public static function get templateService():TemplateService {
			return _templateService;
		}
		
		private static var _languageService:LanguageService = null;
		
		public static function get languageService():LanguageService {
			return _languageService;
		}
		
		private static var _pageService:PageService = null;
		
		public static function get pageService():PageService {
			return _pageService;
		}
		
		private static var _siteService:SiteService = null;
		
		public static function get siteService():SiteService {
			return _siteService;
		}
		
		public static function initializeServices(database:SiteDB):void {
			_projectService = new ProjectService(database);
			_templateService = new TemplateService(database);
			_languageService = new LanguageService(database);
			_pageService = new PageService(database);
			_siteService = new SiteService(database);
		}
	}
}
