Extension { #name : #SequenceableCollection }

{ #category : #'*DeepTraverser' }
SequenceableCollection >> deep: aTraversalBlock do: anObjectActionBlock [
	(DeepTraverserWithoutEdges new 
		onNodeTraverse: aTraversalBlock;
		onNodeAction: anObjectActionBlock;
		on: self startWithoutAll: self;
		yourself) run
]

{ #category : #'*DeepTraverser' }
SequenceableCollection >> deep: aTraversalBlock do: anObjectActionBlock relationDo: aRelationBlock [
	" wie cannot traverse this graph without all items of self - so we include them "
	(DeepTraverser new 
		onNodeTraverse: aTraversalBlock;
		onNodeAction: anObjectActionBlock;
		onEdgeAction: aRelationBlock;
		on: self startWithoutAll: self;
		yourself) run
]

{ #category : #'*DeepTraverser' }
SequenceableCollection >> deep: aTraversalBlock relationDo: anObjectEdgeActionBlock [
	" wie cannot traverse this graph without all items of self - so we include them "
	(DeepTraverser new 
		onNodeTraverse: aTraversalBlock;
		onEdgeAction: anObjectEdgeActionBlock;
		on: self startWithoutAll: self;
		yourself) run
]

{ #category : #'*DeepTraverser' }
SequenceableCollection >> withDeep: aTraversalBlock do: anObjectActionBlock [
	" wie cannot traverse this graph without all items of self - so we include them "
	(DeepTraverserWithoutEdges new 
		onNodeTraverse: aTraversalBlock;
		onNodeAction: anObjectActionBlock;
		on: self startWithAll: self;
		yourself) run
]

{ #category : #'*DeepTraverser' }
SequenceableCollection >> withDeep: aTraversalBlock do: anObjectActionBlock relationDo: aRelationBlock [
	(DeepTraverser new 
		onNodeTraverse: aTraversalBlock;
		onNodeAction: anObjectActionBlock;
		onEdgeAction: aRelationBlock;
		on: self startWithAll: self;
		yourself) run
]

{ #category : #'*DeepTraverser' }
SequenceableCollection >> withDeep: aTraversalBlock relationDo: anObjectEdgeActionBlock [

	(DeepTraverser new 
		onNodeTraverse: aTraversalBlock;
		onEdgeAction: anObjectEdgeActionBlock;
		on: self startWithAll: self;
		yourself) run
]
