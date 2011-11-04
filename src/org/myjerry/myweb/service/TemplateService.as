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
	
	import org.myjerry.myweb.db.SiteDB;
	import org.myjerry.myweb.model.Template;

	public class TemplateService {
		
		protected var database:SiteDB = null;
		
		public function TemplateService(db:SiteDB) {
			this.database = db;
		}
		
		public function getTemplate(templateID:uint):Template {
			return this.database.find(Template as Class, templateID) as Template;
		}
		
		public function deleteTemplate(templateID:uint):Boolean {
			this.database.removeID(Template as Class, templateID);
			return true;
		}
		
		public function saveTemplate(template:Template):Number {
			this.database.save(template);
			return template.templateID;
		}
		
		public function getTemplates():ArrayList {
			var templates:ArrayList = this.database.findAll(Template as Class);
			return templates;
		}
	}
}
