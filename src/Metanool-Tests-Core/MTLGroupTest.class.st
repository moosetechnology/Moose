Class {
	#name : #MTLGroupTest,
	#superclass : #TestCase,
	#category : #'Metanool-Tests-Core'
}

{ #category : #tests }
MTLGroupTest >> testSomething [
	| entity1 entity2 group metaDescription annotationDescription groupPlaceholder |
	entity1 := MooseEntity new.
	entity2 := MooseEntity new.
	group := MooseGroup new.
	group
		add: entity1;
		add: entity2.
	metaDescription := FM3MetaDescription new.
	annotationDescription := MTLAnnotationDescription new
		name: #something;
		type: FM3 boolean;
		yourself.
	metaDescription attributes add: annotationDescription.
	groupPlaceholder := MTLGroup new group: group.
	groupPlaceholder write: false using: annotationDescription asMagritteDescription.
	self assert: (entity1 readUsing: annotationDescription asMagritteDescription) equals: false.
	self assert: (entity2 readUsing: annotationDescription asMagritteDescription) equals: false
]
