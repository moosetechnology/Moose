Class {
	#name : #RTInspectorScript,
	#superclass : #RTUsefulScript,
	#category : #'Roassal2-Plugins'
}

{ #category : #accessing }
RTInspectorScript >> description [
	^ 
'Simple visual object inspector'
]

{ #category : #hooks }
RTInspectorScript >> execute [
	"This is the initial object you would like to inspect"
	| initialObject v b block nodes outterBox |
	initialObject := RTView new.

	initialObject := RPackageOrganizer default packageNamed: 'Roassal2'.

	v := RTView new.
	v @ RTDraggableView.

	nodes := Dictionary new.

	block := [ :anObject | 
	    
	    b := RTMondrian new.
	    b shape box color: Color gray trans; withTextAbove.
	    
	    b node: anObject class name forIt: [
	        b shape label text: #key;
	            if: [:assoc | assoc value isNil ] color: Color brown.
	        b interaction 
	                noInteractions;
	                highlight;
	                when: TRMouseClick do: [ :evt | 
	                    | obj |
	                    "When we click on a label, we add the nodes, and create a link"
	                          obj := evt element model value.
	                          (nodes keys includes: obj) ifFalse: [
	                            block value: evt element model value ].

	                    v add: (RTArrowedLine new withShorterDistanceAttachPoint; edgeFrom: evt element to: (nodes at: obj)).
	                    v signalUpdate.
	                     ];
	                popupText: [ :ass | ass value asString ].

	        b nodes: (anObject class allInstVarNames collect: [ :n | n -> (anObject instVarNamed: n) ]).
	        b layout verticalLine.
	    ].
	    b build.
	    "The elements we have just built are added to the view"
	    v addAll: b view elements.
	    
	    "We refresh the view"
	    v signalUpdate.
	    
	    outterBox := b view elements first.
	    nodes at: anObject put: outterBox.
	].

	block value: initialObject.

	v inspect
]

{ #category : #accessing }
RTInspectorScript >> label [
	^ 'Simple Object Inspector'
]
