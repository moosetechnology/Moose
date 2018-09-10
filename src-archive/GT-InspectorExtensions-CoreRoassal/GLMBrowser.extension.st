Extension { #name : #GLMBrowser }

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
GLMBrowser >> gtInspectorOpenTreeIn: composite [
	<gtInspectorPresentationOrder: 30>  
	^ composite roassal2
		title: 'Tree';
		painting: [:view :b | 
			self viewTreeOn: view ]
]

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
GLMBrowser >> openTree [
	| composer |
	composer := GLMCompositePresentation new.
	composer 
		act: [:b | b update] 
		icon: GLMUIThemeExtraIcons glamorousRefresh 
		entitled: 'Update'.
	composer tabulator with: [:t | 
		t column: #theOne.
		t transmit to: #theOne; andShow: [:a | 
			a roassal2 
				updateOn: GLMTransmissionTriggered from: [ self announcer ];
				painting: [:view :b | self viewTreeOn: view ] ]].
	composer openOn: self
]

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
GLMBrowser >> screenshot: aFilenameString on: anObject after: aBlock [
	 
	| window |
	window := self openOn: anObject.
	aBlock glamourValue: self asGlamorousMultiValue.
	World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: aFilenameString.
	^ window
]

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
GLMBrowser >> viewAnnouncementsOn: view [
	"view shape rectangle withoutBorder.
	view node: 'Glamour' forIt: [
		self viewTreeOn: view ].
	self umlClassWithTitle: #yourself view: view nodes: (Array with: 'Announced objects') forEach: [ :eachNode |
		view interaction
				nodraggable;
				forward: ROAbstractMouseDragging.
		view shape label text: [:p | (p class name removePrefix: 'GLM') removeSuffix: 'Renderer' ].
		view nodes: 
			(self pane withAllPanes flatCollect: [:each | 
			each glmSubscriptions collect: [:eachSub | eachSub subscriber]]) asSet.
		view interaction
				nodraggable;
				forward: ROAbstractMouseDragging.
		view shape label text: [:p | (p class name removePrefix: 'GLM') removeSuffix: 'Renderer' ].
		view nodes: 
			(self pane withAllPresentations flatCollect: [:each | 
			each glmSubscriptions collect: [:eachSub | eachSub subscriber]]) asIdentitySet.
		view verticalLineLayout ].
	
	view shape line 
			color: Color red twiceLighter;
			attachPoint: (ROHorizontalAttachPoint new).
	view edges: self pane withAllPanes from: #yourself toAll: [:each | 
			each glmSubscriptions collect: [:eachSub | eachSub subscriber]].
	view shape line 
			color: Color red twiceLighter;
			attachPoint: (ROHorizontalAttachPoint new).
	view edges: self pane withAllPresentations from: #yourself toAll: [:each | 
			each glmSubscriptions collect: [:eachSub | eachSub subscriber]].
	view horizontalLineLayout horizontalGap: 50"
]

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
GLMBrowser >> viewTree [

	| view |
	view := RTView new.
	view @ RTDraggableView.
	self viewTreeOn: view.
	^ view open.
]

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
GLMBrowser >> viewTreeOn: view [
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
		
	
	
	line := RTArrowedLine new color: Color blue; attachPoint: RTShorterDistanceAttachPoint instance.
	RTEdge buildEdgesFromObjects: ((self pane withAllPresentations select: [:each | each isKindOf: GLMBrowser]) flatCollect: [:each | each transmissions])
		from: #destination toAll: #origins using: line inView: view.
		
	RTTreeLayout new on: elements.
	
]
