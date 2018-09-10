Extension { #name : #GLMCompositePresentation }

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
GLMCompositePresentation >> gtInspectorOpenTreeIn: composite [
	<gtInspectorPresentationOrder: 30>  
	^ composite roassal2
		title: 'Tree';
		painting: [:view :b | 
			self viewTreeOn: view ]
]

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
GLMCompositePresentation >> viewTreeOn: view [
	| b label line elements |

	b := RTUMLClassBuilder new.
	b
		addObjects: self pane withAllPanes;
		classname: #name;
		instanceVariables: nil;
		methodsNames: #ports;
		methodselector: #name;
		attributeselector: nil;
		buildSchema: view.
	elements := RTGroup new.
	elements addAll: b classesGroup.
	
	label := RTLabel new height: 10; text: [:p | (p class name removePrefix: 'GLM') removeSuffix: 'Presentation' ].
	
	self pane withAllPresentations do: [ :p | | e |
		view add: (e:= (label elementOn: p ) @ RTDraggable).
		elements add: e ].
	
	line := RTMultiLine new orthoVertical attachPoint: RTVerticalAttachPoint instance.
	
	RTEdge buildEdgesFromObjects: self pane withAllPanes 
		from: #yourself to: [ :each | each presentations ] using: line inView: view.
	
	RTEdge buildEdgesFromObjects: self pane withAllPanes 
		from: #browser to: #yourself using: line inView: view.
		
	RTEdge buildEdgesFromObjects: (self pane withAllPresentations select: [:each | each isKindOf: GLMDynamicPresentation])
		from: #yourself to: #cachedPresentation using: line inView: view scope: elements.
		
	RTEdge buildEdgesFromObjects: (self pane withAllPresentations select: [:each | each isKindOf: GLMCompositePresentation])
		from: #yourself toAll: #presentations using: line inView: view scope: elements.
		
	RTTreeLayout new on: elements.
	
	line := RTLine new color: Color blue; attachPoint: RTShorterDistanceAttachPoint instance.
	RTEdge buildEdgesFromObjects: ((self pane withAllPresentations select: [:each | each isKindOf: GLMBrowser]) flatCollect: [:each | each transmissions])
		from: #destination toAll: #origins using: line inView: view.
	
]
