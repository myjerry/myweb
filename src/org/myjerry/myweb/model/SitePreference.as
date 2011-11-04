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
	
	[Table(name="sitePreferences")]
	public class SitePreference {
		
		[Id]
		[Column(name="id")]
		public var prefID:uint;
		
		[Column(name="key")]
		public var key:String;
		
		[Column(name="value")]
		public var value:String;
		
		public function SitePreference(key:String = null, value:String = null) {
			this.key = key;
			this.value = value;
		}
		
	}
}
