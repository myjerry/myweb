package org.myjerry.myweb.model {
	
	import flash.filesystem.File;
	
	import mx.controls.Alert;
	
	import org.myjerry.as3extensions.db.Database;
	import org.myjerry.as3extensions.io.FileChooser;
	import org.myjerry.as3extensions.io.FolderChooser;
	import org.myjerry.as3utils.StringUtils;
	import org.myjerry.myweb.ApplicationContext;
	import org.myjerry.myweb.db.SiteDB;
	import org.myjerry.myweb.service.LanguageService;
	import org.myjerry.myweb.service.PageService;
	import org.myjerry.myweb.service.ProjectService;
	import org.myjerry.myweb.service.TemplateService;

	public class Site {
		
		public static const SITE_FILE_EXTENSION:String = 'myweb';
		
		protected var siteFile:File = null;
		
		protected var database:Database = null;
		
		protected var _projectService:ProjectService = null;
		
		protected var _templateService:TemplateService = null;
		
		protected var _languageService:LanguageService = null;
		
		protected var _pageService:PageService = null;
		
		public function Site(siteFile:File) {
			this.siteFile = siteFile;
			this.database = new SiteDB(this.siteFile);
			
			this._projectService = new ProjectService(this.database);
			this._templateService = new TemplateService(this.database);
			this._languageService = new LanguageService(this.database);
			this._pageService = new PageService(this.database);
		}
		
		public function get projectService():ProjectService {
			return this._projectService;
		}
		
		public function get templateService():TemplateService {
			return this._templateService;
		}
		
		public function get languageService():LanguageService {
			return this._languageService;
		}
		
		public function get pageService():PageService {
			return this._pageService;
		}
		
		public static function createNewSite(siteName:String, projectFolder:String):void {
			var dbFile:File = new File(projectFolder).resolvePath(siteName + '.' + SITE_FILE_EXTENSION);
			if(dbFile.exists) {
				Alert.show('Site already exists, use open site.');
				return;
			}
			
			openSite(dbFile);
		}
		
		public static function openSite(siteFile:File):void {
			if(!StringUtils.equals(siteFile.extension, SITE_FILE_EXTENSION)) {
				Alert.show("Not a valid site file.");
				return;
			}
			
			ApplicationContext.setSite(new Site(siteFile));
		}
		
		public function closeSite():void {
			this.database.dispose();
			this.database = null;
			this.siteFile = null;
			
			ApplicationContext.popView();
		}
	}
}
