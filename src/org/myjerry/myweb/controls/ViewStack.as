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
	}
}
