Class {
	#name : #FamixTagImportAndExportManyObjectsTest,
	#superclass : #FamixTagMooseModelTest,
	#category : #'Famix-Tagging-Tests'
}

{ #category : #running }
FamixTagImportAndExportManyObjectsTest >> setUp [
	super setUp.
	model := FamixTagTestModel new.
	1 to: 1000 do: [ :n |
		(FamixTagTestPackage named: 'package' , n asString model: model)
			addType: (FamixTagTestClass named: 'class' , n asString model: model) ].
	model allClasses withIndexDo: [ :each :idx | each tagWithName: 'tag' , idx asString ]
]

{ #category : #tests }
FamixTagImportAndExportManyObjectsTest >> testNumberOfClasses [
	self assert: model allClasses size equals: 1000.
	model allClasses do: [ :aClass | self denyEmpty: aClass tags ]
]

{ #category : #tests }
FamixTagImportAndExportManyObjectsTest >> testNumberOftags [
	self assert: model tags size equals: 1000
]
