Extension { #name : #HashedCollection }

{ #category : #'*DeepTraverser' }
HashedCollection >> deep: aTraversalBlock do: anObjectActionBlock [
	(DeepTraverserWithoutEdges new 
		onNodeTraverse: aTraversalBlock;
		onNodeAction: anObjectActionBlock;
		on: self startWithout: self keys anyOne;
		yourself) run
]

{ #category : #'*DeepTraverser' }
HashedCollection >> deep: aTraversalBlock do: anObjectActionBlock relationDo: aRelationBlock [
	" wie cannot traverse this graph without all items of self - so we include them "
	(DeepTraverser new 
		onNodeTraverse: aTraversalBlock;
		onNodeAction: anObjectActionBlock;
		onEdgeAction: aRelationBlock;
		on: self startWithout: self keys anyOne;
		yourself) run
]

{ #category : #'*DeepTraverser' }
HashedCollection >> deep: aTraversalBlock relationDo: anObjectEdgeActionBlock [
	" wie cannot traverse this graph without all items of self - so we include them "
	(DeepTraverser new 
		onNodeTraverse: aTraversalBlock;
		onEdgeAction: anObjectEdgeActionBlock;
		on: self startWithout: self keys anyOne;
		yourself) run
]

{ #category : #'*DeepTraverser' }
HashedCollection >> withDeep: aTraversalBlock do: anObjectActionBlock [
	" wie cannot traverse this graph without all items of self - so we include them "
	(DeepTraverserWithoutEdges new 
		onNodeTraverse: aTraversalBlock;
		onNodeAction: anObjectActionBlock;
		on: self startWith: self keys anyOne;
		yourself) run
]

{ #category : #'*DeepTraverser' }
HashedCollection >> withDeep: aTraversalBlock do: anObjectActionBlock relationDo: aRelationBlock [
	(DeepTraverser new 
		onNodeTraverse: aTraversalBlock;
		onNodeAction: anObjectActionBlock;
		onEdgeAction: aRelationBlock;
		on: self startWith: self keys anyOne;
		yourself) run
]

{ #category : #'*DeepTraverser' }
HashedCollection >> withDeep: aTraversalBlock relationDo: anObjectEdgeActionBlock [

	(DeepTraverser new 
		onNodeTraverse: aTraversalBlock;
		onEdgeAction: anObjectEdgeActionBlock;
		on: self startWith: self keys anyOne;
		yourself) run
]
