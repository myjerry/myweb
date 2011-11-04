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

package org.myjerry.myweb.model {
	
	[Table(name="pages")]
	public class Page {
		
		[Id]
		[Column(name="id")]
		public var pageID:uint;
		
		[Column(name="title")]
		public var title:String;
		
		[Column(name="path")]
		public var path:String;

		[Column(name="user_created")]
		public var userCreated:Boolean = true;
		
		[Column(name="searchable")]
		public var searchable:Boolean = true;
		
		[Column(name="draft")]
		public var isDraft:Boolean = false;
		
		[Column(name="templateID")]
		public var templateID:uint = 0;
		
	}
}
