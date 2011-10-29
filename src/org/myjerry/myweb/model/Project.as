package org.myjerry.myweb.model {
	
	import flash.filesystem.File;
	
	import mx.controls.Alert;
	
	import org.myjerry.as3extensions.db.Database;
	import org.myjerry.as3extensions.io.FileChooser;
	import org.myjerry.as3extensions.io.FolderChooser;
	import org.myjerry.as3utils.StringUtils;
	import org.myjerry.myweb.ApplicationContext;
	import org.myjerry.myweb.db.ProjectDB;

	public class Project {
		
		public static const PROJECT_FILE_EXTENSION:String = 'myweb';
		
		protected var projectFile:File = null;
		
		protected var database:Database = null;
		
		public function Project(projectFile:File) {
			this.projectFile = projectFile;
			this.database = new ProjectDB(this.projectFile);
		}
		
		public static function createNewProject(projectName:String, projectFolder:String):void {
			var dbFile:File = new File(projectFolder).resolvePath(projectName + '.' + PROJECT_FILE_EXTENSION);
			if(dbFile.exists) {
				Alert.show('Project already exists, use open project.');
				return;
			}
			
			openProject(dbFile);
		}
		
		public static function openProject(projectFile:File):void {
			if(!StringUtils.equals(projectFile.extension, PROJECT_FILE_EXTENSION)) {
				Alert.show("Not a valid project file.");
				return;
			}
			
			ApplicationContext.setProject(new Project(projectFile));
		}
		
		public function closeProject():void {
			this.database.dispose();
			this.database = null;
			this.projectFile = null;
			
			ApplicationContext.popView();
		}
	}
}
