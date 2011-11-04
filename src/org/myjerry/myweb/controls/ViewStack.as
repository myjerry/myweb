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

package org.myjerry.myweb.controls {
	
	import mx.core.IVisualElement;
	import mx.core.UIComponent;
	
	import spark.components.Group;
	
	public class ViewStack extends Group {
		
		protected var currentIndex:int = -1;
		
		public function ViewStack() {
			super();
		}
		
		public function push(component:IVisualElement):void {
			setCurrentElementVisible(false);
			this.addElement(component);
			currentIndex++;
		}
		
		public function setCurrentElementVisible(visible:Boolean):void {
			var element:IVisualElement = currentElement;
			if(element != null) {
				element.visible = visible;
			}
		}
		
		protected function get currentElement():IVisualElement {
			if(currentIndex >= 0) {
				return this.getElementAt(currentIndex);
			}
			
			return null;
		}
		
		public function pop():IVisualElement {
			if(currentIndex >= 0) {
				var element:IVisualElement = this.removeElementAt(this.currentIndex);
				this.currentIndex--;
				setCurrentElementVisible(true);
				return element;
			}
			
			return null;
		}
		
		public function removeView(element:IVisualElement):Boolean {
			if(currentIndex < 0) {
				return false;
			}
			
			for(var index:int = 0; index <= currentIndex; index++) {
				if(this.getElementAt(index) === element) {
					this.removeElementAt(index);
					this.currentIndex--;
					return true;
				}
			}
			
			return false;
		}
	}
}
