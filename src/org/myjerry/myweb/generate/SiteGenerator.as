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

package org.myjerry.myweb.generate {
	
	import com.fxmarker.FxMarker;
	import com.fxmarker.dataModel.DataModel;
	import com.fxmarker.template.Template;
	import com.fxmarker.writer.Writer;
	
	import flash.filesystem.File;
	
	import mx.collections.ArrayList;
	
	import org.myjerry.as3utils.FileUtils;
	import org.myjerry.as3utils.StringUtils;
	import org.myjerry.myweb.ApplicationContext;
	import org.myjerry.myweb.model.Page;
	import org.myjerry.myweb.model.PageContent;
	import org.myjerry.myweb.model.Site;
	
	public class SiteGenerator {
		
		private var baseFolder:File = null;
		
		private var site:Site = null;
		
		public function SiteGenerator(base:File) {
			this.site = ApplicationContext.site;
			this.baseFolder = base;
		}
		
		public function generate():Number {
			const start:Number = new Date().time;
			
			// iterate for all pages
			var pages:ArrayList = ApplicationContext.pageService.getAllPages();
			for(var index:int = 0; index < pages.length; index++) {
				var page:Page = pages.getItemAt(index) as Page;
				
				// build the page
				var builtPage:String = buildPage(page);
				
				// write page to disk
				writePage(page, builtPage);
			}
			
			const end:Number = new Date().time;
			var timeConsumed:Number = end - start;
			return timeConsumed;
		}
		
		private function buildPage(page:Page):String {
			// load the template
			var templateID:int = page.templateID;
			var templateCode:String = ApplicationContext.templateService.getTemplate(templateID).code;
			
			// compile the template
			var template:Template = FxMarker.instance.getTemplate(templateCode);
			
			// build the model
			const model:DataModel = getSiteModel();
			addPageModel(model, page);
			
			// process the template
			var writer:Writer = new Writer();
			template.process(model, writer);
			
			return writer.writtenData;
		}
		
		private function addPageModel(model:DataModel, page:Page):void {
			model.putValue('pageTitle', page.title);
			
			var pageContent:PageContent = ApplicationContext.pageService.getPageContent(page.pageID);
			if(pageContent != null) {
				model.putValue('pageContents', pageContent.content);
			} else {
				model.putValue('pageContents', '');
			}
		}
		
		private function getSiteModel():DataModel {
			var model:DataModel = new DataModel();

			// add generic properties
			model.putValue('today', new Date());
			
			// add myweb properties
			model.putValue('mywebVersion', ApplicationContext.VERSION);
			
			// set the site properties
			model.putValue('siteTitle', site.title);

			var t:Number = Number(this.site.getSitePreference(Site.CREATION_DATE));
			var date:Date = new Date();
			date.time = t;
			model.putValue('siteCreated', date);
			
			return model;
		}
		
		private function writePage(page:Page, contents:String):void {
			var path:String = page.path;
			if(!StringUtils.startsWith(path, "/")) {
				path = '/' + path;
			}
			
			var filePath:String = this.baseFolder.nativePath + path;
			
			FileUtils.writeStringToFile(new File(filePath), contents);
		}
	}
}
