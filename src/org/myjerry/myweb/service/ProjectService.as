/**
 *
 * myweb - Static Site Generator
 * Copyright (C) 2011, myJerry Developers
 * http://www.myjerry.org/myweb
 *
 * The file is licensed under the the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package org.myjerry.myweb.service {
	
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	
	import mx.collections.ArrayList;
	
	import org.myjerry.myweb.ApplicationContext;
	import org.myjerry.myweb.db.SiteDB;
	import org.myjerry.myweb.model.Page;
	import org.myjerry.myweb.model.Project;
	
	public class ProjectService {
		
		protected var database:SiteDB = null;
		
		public function ProjectService(db:SiteDB) {
			super();
			
			this.database = db;
		}
		
		public function saveProject(project:Project):Number {
			var newProject:Boolean = false;
			if(project.projectID == 0) {
				newProject = true;
			}
			
			// save this project
			this.database.save(project);
			
			// if this is a new project, then create its corresponding page
			if(newProject) {
				var page:Page = new Page();
				page.path = '/' + project.name + '/index.html';
				page.title = project.name;
				page.userCreated = false;
				
				ApplicationContext.pageService.savePage(page);
			}
			
			// return the project ID back
			return project.projectID;
		}
		
		public function getAllProjects():ArrayList {
			var projects:ArrayList = this.database.findAll(Project as Class);
			return projects;
		}
		
		public function deleteProject(projectID:uint):Boolean {
			this.database.removeID(Project as Class, projectID);
			return true;
		}
	}
}