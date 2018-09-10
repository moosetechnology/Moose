Extension { #name : #DeepTraverserWithoutAction }

{ #category : #'*DeepTraverser-UI' }
DeepTraverserWithoutAction class >> gtExampleDeepTraverserWithoutAction [
	<gtExample>
	<label: 'DeepTraverserWithoutAction'>
	
	| graph traverser |

	graph := Dictionary new.
	graph at: 0 put: { 1 }.
	graph at: 1 put: { 2 . 3 }.
	graph at: 2 put: { 3 }.
	graph at: 4 put: { 3 }.
	graph at: 10 put: { 11 }.

	traverser := (DeepTraverserWithoutAction new 
				onNodeTraverse: [ :each | graph at: each ifAbsent: [ #() ] ];
				on: graph startWith: (graph at: 0);
				yourself).
				
	traverser upToEnd	.
	^ traverser.
				
		
]

{ #category : #'*DeepTraverser-UI' }
DeepTraverserWithoutAction >> gtInspectorObjectsTraversedIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite list
		title: 'Traversed';
		display: [ self objectsTraversed ];
		format: [ :each | each gtDisplayString ]
]
