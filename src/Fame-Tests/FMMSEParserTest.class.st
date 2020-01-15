Class {
	#name : #FMMSEParserTest,
	#superclass : #TestCase,
	#instVars : [
		'p',
		'r',
		'a'
	],
	#category : #'Fame-Tests'
}

{ #category : #accessing }
FMMSEParserTest class >> famix30mse [
	^ '((FM3.Package
		(id: 8)
		(name ''FAMIX'')
		(classes 
			(FM3.Class 
				(id: 1)
				(name ''Access'')
				(superclass (ref: 10))
				(properties 
					(FM3.Property 
						(id: 51)
						(name ''isWrite'')
						(type (ref: Boolean)))
					(FM3.Property 
						(id: 44)
						(name ''accessor'')
						(opposite (ref: 18))
						(type (ref: 19)))
					(FM3.Property 
						(id: 6)
						(name ''variable'')
						(opposite (ref: 27))
						(type (ref: 29)))
					(FM3.Property 
						(id: 22)
						(name ''isRead'')
						(derived true)
						(type (ref: Boolean)))))
			(FM3.Class 
				(id: 28)
				(name ''Parameter'')
				(superclass (ref: 29))
				(properties 
					(FM3.Property 
						(id: 62)
						(name ''parentBehaviouralEntity'')
                        (container true)
						(opposite (ref: 61))
						(type (ref: 19)))))
			(FM3.Class 
				(id: 29)
				(name ''StructuralEntity'')
				(superclass (ref: 45))
				(properties 
					(FM3.Property 
						(id: 30)
						(name ''declaredType'')
						(type (ref: 66)))
					(FM3.Property 
						(id: 27)
						(name ''incomingAccesses'')
						(derived true)
						(multivalued true)
						(opposite (ref: 6))
						(type (ref: 1)))))
			(FM3.Class 
				(id: 63)
				(name ''ContainerEntity'')
				(superclass (ref: 70))
				(properties 
					(FM3.Property 
						(id: 3)
						(name ''outgoingReferences'')
						(derived true)
						(multivalued true)
						(opposite (ref: 5))
						(type (ref: 50)))
					(FM3.Property 
						(id: 38)
						(name ''types'')
						(derived true)
						(multivalued true)
						(opposite (ref: 56))
						(type (ref: 66)))
					(FM3.Property 
						(id: 43)
						(name ''incomingReferences'')
						(derived true)
						(multivalued true)
						(opposite (ref: 9))
						(type (ref: 50)))))
			(FM3.Class 
				(id: 45)
				(name ''LeafEntity'')
				(superclass (ref: 70)))
			(FM3.Class 
				(id: 10)
				(name ''Association'')
				(superclass (ref: 33))
				(properties
					(FM3.Property 
						(id: 57)
						(name ''below'')
						(derived true)
						(opposite (ref: 35))
						(type (ref: 10)))
					(FM3.Property 
						(id: 35)
						(name ''above'')
						(opposite (ref: 57))
						(type (ref: 10))))
			)
			(FM3.Class 
				(id: 11)
				(name ''Attribute'')
				(superclass (ref: 29))
				(properties 
					(FM3.Property 
						(id: 31)
						(name ''parentClass'')
                        (container true)
						(opposite (ref: 47))
						(type (ref: 66)))))
			(FM3.Class 
				(id: 32)
				(name ''LocalVariable'')
				(superclass (ref: 29))
				(properties 
					(FM3.Property 
						(id: 4)
						(name ''parentBehaviouralEntity'')
                        (container true)
						(opposite (ref: 39))
						(type (ref: 19)))))
			(FM3.Class 
				(id: 14)
				(name ''Method'')
				(superclass (ref: 19))
				(properties 
					(FM3.Property 
						(id: 20)
						(name ''parentClass'')
                        (container true)
						(opposite (ref: 60))
						(type (ref: 66)))))
			(FM3.Class 
				(id: 13)
				(name ''Package'')
				(superclass (ref: 67))
				(properties 
					(FM3.Property 
						(id: 2)
						(name ''childNamedEntities'')
						(derived true)
						(multivalued true)
						(opposite (ref: 24))
						(type (ref: 70)))))
			(FM3.Class 
				(id: 15)
				(name ''GlobalVariable'')
				(superclass (ref: 29))
				(properties 
					(FM3.Property 
						(id: 12)
						(name ''parentNamespace'')
                        (container true)
						(opposite (ref: 59))
						(type (ref: 67)))))
			(FM3.Class 
				(id: 33)
				(name ''Entity'')
				(properties 
					(FM3.Property 
						(id: 64)
						(name ''sourceAnchor'')
						(multivalued true)
						(type (ref: String)))))
			(FM3.Class 
				(id: 66)
				(name ''Type'')
				(superclass (ref: 63))
				(properties 
					(FM3.Property 
						(id: 68)
						(name ''subInheritances'')
						(derived true)
						(multivalued true)
						(opposite (ref: 16))
						(type (ref: 23)))
					(FM3.Property 
						(id: 60)
						(name ''methods'')
						(derived true)
						(multivalued true)
						(opposite (ref: 20))
						(type (ref: 14)))
					(FM3.Property 
						(id: 56)
						(name ''container'')
                        (container true)
						(opposite (ref: 38))
						(type (ref: 63)))
					(FM3.Property 
						(id: 26)
						(name ''superInheritances'')
						(derived true)
						(multivalued true)
						(opposite (ref: 55))
						(type (ref: 23)))
					(FM3.Property 
						(id: 47)
						(name ''attributes'')
						(derived true)
						(multivalued true)
						(opposite (ref: 31))
						(type (ref: 11)))))
			(FM3.Class 
				(id: 50)
				(name ''Reference'')
				(superclass (ref: 10))
				(properties 
					(FM3.Property 
						(id: 9)
						(name ''to'')
						(opposite (ref: 43))
						(type (ref: 63)))
					(FM3.Property 
						(id: 5)
						(name ''from'')
						(opposite (ref: 3))
						(type (ref: 63)))))
			(FM3.Class 
				(id: 67)
				(name ''ScopingEntity'')
				(superclass (ref: 63))
				(properties 
					(FM3.Property 
						(id: 7)
						(name ''childNamespaces'')
						(derived true)
						(multivalued true)
						(opposite (ref: 40))
						(type (ref: 67)))
					(FM3.Property 
						(id: 40)
						(name ''parentNamespace'')
                        (container true)
						(opposite (ref: 7))
						(type (ref: 67)))
					(FM3.Property 
						(id: 59)
						(name ''globalVariables'')
						(derived true)
						(multivalued true)
						(opposite (ref: 12))
						(type (ref: 15)))))
			(FM3.Class 
				(id: 17)
				(name ''Namespace'')
				(superclass (ref: 67)))
			(FM3.Class 
				(id: 19)
				(name ''BehaviouralEntity'')
				(superclass (ref: 63))
				(properties 
					(FM3.Property 
						(id: 58)
						(name ''outgoingInvocations'')
						(derived true)
						(multivalued true)
						(opposite (ref: 65))
						(type (ref: 71)))
					(FM3.Property 
						(id: 25)
						(name ''incomingInvocations'')
						(derived true)
						(multivalued true)
						(opposite (ref: 42))
						(type (ref: 71)))						
					(FM3.Property 
						(id: 39)
						(name ''localVariables'')
						(derived true)
						(multivalued true)
						(opposite (ref: 4))
						(type (ref: 32)))
					(FM3.Property 
						(id: 61)
						(name ''parameters'')
						(derived true)
						(multivalued true)
						(opposite (ref: 62))
						(type (ref: 28)))
					(FM3.Property 
						(id: 18)
						(name ''outgoingAccesses'')
						(derived true)
						(multivalued true)
						(opposite (ref: 44))
						(type (ref: 1)))
					(FM3.Property 
						(id: 72)
						(name ''signature'')
						(type (ref: String)))))
			(FM3.Class 
				(id: 70)
				(name ''NamedEntity'')
				(superclass (ref: 33))
				(properties 
					(FM3.Property 
						(id: 69)
						(name ''name'')
						(type (ref: String)))
					(FM3.Property 
						(id: 46)
						(name ''isStub'')
						(type (ref: Boolean)))
					(FM3.Property 
						(id: 54)
						(name ''receivingInvocations'')
						(derived true)
						(multivalued true)
						(opposite (ref: 34))
						(type (ref: 71)))
					(FM3.Property 
						(id: 52)
						(name ''modifiers'')
						(multivalued true)
						(type (ref: String)))
					(FM3.Property 
						(id: 49)
						(name ''belongsTo'')
						(derived true)
						(type (ref: 63)))
					(FM3.Property 
						(id: 24)
						(name ''packagedIn'')
						(opposite (ref: 2))
						(type (ref: 13)))))
			(FM3.Class 
				(id: 21)
				(name ''Class'')
				(superclass (ref: 66))
				(properties 
					(FM3.Property 
						(id: 48)
						(name ''isAbstract'')
						(type (ref: Boolean)))))
			(FM3.Class 
				(id: 23)
				(name ''Inheritance'')
				(superclass (ref: 10))
				(properties 
					(FM3.Property 
						(id: 16)
						(name ''superclass'')
						(opposite (ref: 68))
						(type (ref: 66)))
					(FM3.Property 
						(id: 55)
						(name ''subclass'')
						(opposite (ref: 26))
						(type (ref: 66)))))
			(FM3.Class 
				(id: 71)
				(name ''Invocation'')
				(superclass (ref: 10))
				(properties 
					(FM3.Property 
						(id: 65)
						(name ''sender'')
						(opposite (ref: 58))
						(type (ref: 19)))
					(FM3.Property 
						(id: 34)
						(name ''receiver'')
						(opposite (ref: 54))
						(type (ref: 70)))
					(FM3.Property 
						(id: 53)
						(name ''receiverSourceCode'')
						(type (ref: String)))
					(FM3.Property 
						(id: 36)
						(name ''signature'')
						(type (ref: String)))
					(FM3.Property 
						(id: 42)
						(name ''candidates'')
						(multivalued true)
						(opposite (ref: 25))
						(type (ref: 19))))))))


'
]

{ #category : #accessing }
FMMSEParserTest class >> sampleMetaMse [
	^ '("Meta-model of above file"
   (FM3.Package
       (name ''LIB'')
       (classes
           (FM3.Class
               (name ''Library'')
               (properties
                   (FM3.Property
                       (name ''librarian'')
                       (type (ref: 2)))
                   (FM3.Property
                       (name ''books'')
                       (multivalued true)
                       (type (ref: 1)))))
           (FM3.Class (id: 1)
               (name ''Book'')
               (properties
                   (FM3.Property
                       (name ''title'')
                       (type (ref: String)))
                   (FM3.Property (id: 100)
                       (name ''authors'')
                       (multivalued true)
                       (type (ref: 2)))))
           (FM3.Class (id: 2)
               (name ''Person'')
               (properties
                   (FM3.Property
				(opposite (ref: 100))
				(name ''books'')
                       (multivalued true)
                       (type (ref: 1)))
                   (FM3.Property
                       (name ''name'')
                       (type (ref: String))))))))'
]

{ #category : #accessing }
FMMSEParserTest class >> sampleMse [
	^ '("Sample MSE file"
   (LIB.Library
       (librarian
           (LIB.Person
               (name ''Adrian Kuhn'')))
       (books
           (LIB.Book
               (title ''Design Patterns'')
               (authors (ref: 1) (ref: 2) (ref: 3) (ref: 4)))
           (LIB.Book
               (title ''Eclipse: Principles, Patterns, and Plug-Ins'')
               (authors (ref: 1) (ref: 5)))
           (LIB.Book
               (title ''Smalltalk Best Practice Patterns'')
               (authors (ref: 5)))))
   (LIB.Person (id: 1)
       (name ''Erich Gamma''))
   (LIB.Person (id: 2)
       (name ''Richard Helm''))
   (LIB.Person(id: 3)
       (name ''Ralph Johnson''))
   (LIB.Person(id: 4)
       (name ''John Vlissides''))
   (LIB.Person(id: 5)
       (name ''Kent Beck'')))'
]

{ #category : #running }
FMMSEParserTest >> setUp [
	super setUp.
	p := FMMSEParser new.
	r := FMDebugImporter new.
	p importer: r
]

{ #category : #tests }
FMMSEParserTest >> testBacktrack [
	| pos |
	p fromString: 'abcdefg'.
	self assert: p peek equals: $a.
	self assert: p next equals: $b.
	pos := p position.
	self assert: p peek equals: $b.
	self assert: p next equals: $c.
	self assert: p next equals: $d.
	self assert: p next equals: $e.
	p backtrack: pos.
	self assert: p peek equals: $b.
	self assert: p next equals: $c.
	self assert: p next equals: $d.
	self assert: p next equals: $e
]

{ #category : #tests }
FMMSEParserTest >> testEmptyDocument [
	p fromString: ''.
	p Document.
	self assert: r contents equals: #(#(#beginDocument) #(#endDocument)).
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testEmptyExportString [
	p fromString: ''.
	p Document.
	self assert: r exportString equals: '()'
]

{ #category : #tests }
FMMSEParserTest >> testEntity [
	a := #(#(#beginEntity: 'Foo') #(#endEntity: 'Foo')).
	r reset.
	p fromString: '(Foo)'.
	p Entity.
	self assert: r contents equals: a.
	self assert: p atEnd.
	r reset.
	p fromString: '(  Foo  )  '.
	p Entity.
	self assert: r contents equals: a.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testEntityWithID [
	a := #(#(#beginEntity: 'Foo') #(#serial: 42) #(#endEntity: 'Foo')).
	r reset.
	p fromString: '(Foo(id:42))'.
	p Entity.
	self assert: r contents equals: a.
	self assert: p atEnd.
	r reset.
	p fromString: '(  Foo  (  id:  42  )  )  '.
	p Entity.
	self assert: r contents equals: a.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testEntityWithPropertys [
	a := #(#(#beginEntity: 'Foo') #(#beginProperty: 'name') #(#endProperty: 'name') #(#beginProperty: 'count') #(#endProperty: 'count') #(#endEntity: 'Foo')).
	r reset.
	p fromString: '(Foo(name)(count))'.
	p Entity.
	self assert: r contents equals: a.
	self assert: p atEnd.
	r reset.
	p fromString: '(  Foo  (  name  )  (  count  )  )  '.
	p Entity.
	self assert: r contents equals: a.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testEntityWithPropertysAndID [
	a := #(#(#beginEntity: 'Foo') #(#serial: 42) #(#beginProperty: 'name') #(#endProperty: 'name') #(#beginProperty: 'count') #(#endProperty: 'count') #(#endEntity: 'Foo')).
	r reset.
	p fromString: '(Foo(id:42)(name)(count))'.
	p Entity.
	self assert: r contents equals: a.
	self assert: p atEnd.
	r reset.
	p fromString: '(  Foo  (  id:  42  )  (  name  )  (  count  )  )  '.
	p Entity.
	self assert: r contents equals: a.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testFamixModel [
	| metamodel names famixPackage accessClass accessorProperty behaviouralEntity outgoingAccesses |
	metamodel := FMMetaModel fromString: self class famix30mse.
	names := metamodel elements collect: [ :each | each fullName ].
	self assert: names size equals: 70.
	self assert: (names includes: 'FAMIX.Access').
	self assert: (names includes: 'FAMIX.Method').
	self assert: (names includes: 'FAMIX.NamedEntity.belongsTo').
	self assert: (names includes: 'FAMIX.Class').
	self assert: (names includes: 'FAMIX').
	self assert: (names includes: 'FAMIX.Entity.sourceAnchor').
	self assert: (names includes: 'FAMIX.Access.accessor').
	self assert: (names includes: 'FAMIX.Type.methods').
	self assert: (names includes: 'FAMIX.Package.childNamedEntities').
	self assert: (names includes: 'FAMIX.Type.attributes').
	self assert: (names includes: 'FAMIX.Attribute.parentClass').
	self assert: (names includes: 'FAMIX.GlobalVariable').
	self assert: (names includes: 'FAMIX.ScopingEntity.parentNamespace').
	self assert: (names includes: 'FAMIX.Type').
	self assert: (names includes: 'FAMIX.Parameter').
	self assert: (names includes: 'FAMIX.Access.isRead').
	self assert: (names includes: 'FAMIX.Attribute').
	self assert: (names includes: 'FAMIX.ContainerEntity.incomingReferences').
	self assert: (names includes: 'FAMIX.Method.parentClass').
	self assert: (names includes: 'FAMIX.BehaviouralEntity').
	self assert: (names includes: 'FAMIX.BehaviouralEntity.incomingInvocations').
	self assert: (names includes: 'FAMIX.StructuralEntity').
	self assert: (names includes: 'FAMIX.Access.isWrite').
	self assert: (names includes: 'FAMIX.Invocation.sender').
	self assert: (names includes: 'FAMIX.ScopingEntity.globalVariables').
	self assert: (names includes: 'FAMIX.ContainerEntity').
	self assert: (names includes: 'FAMIX.ScopingEntity').	"self assert: (names includes: 'FAMIX.Invocation.above')."
	self assert: (names includes: 'FAMIX.Association').
	self assert: (names includes: 'FAMIX.StructuralEntity.declaredType').
	self assert: (names includes: 'FAMIX.Invocation.receiver').
	self assert: (names includes: 'FAMIX.Package').
	self assert: (names includes: 'FAMIX.ScopingEntity.childNamespaces').
	self assert: (names includes: 'FAMIX.Entity').
	self assert: (names includes: 'FAMIX.Reference.from').
	self assert: (names includes: 'FAMIX.ContainerEntity.outgoingReferences').
	self assert: (names includes: 'FAMIX.BehaviouralEntity.localVariables').
	self assert: (names includes: 'FAMIX.Invocation.candidates').
	self assert: (names includes: 'FAMIX.Invocation.receiverSourceCode').
	self assert: (names includes: 'FAMIX.NamedEntity.name').
	self assert: (names includes: 'FAMIX.NamedEntity.receivingInvocations').
	self assert: (names includes: 'FAMIX.StructuralEntity.incomingAccesses').
	self assert: (names includes: 'FAMIX.LeafEntity').
	self assert: (names includes: 'FAMIX.Class.isAbstract').
	self assert: (names includes: 'FAMIX.BehaviouralEntity.signature').
	self assert: (names includes: 'FAMIX.Inheritance.subclass').
	self assert: (names includes: 'FAMIX.Reference').
	self assert: (names includes: 'FAMIX.BehaviouralEntity.outgoingInvocations').
	self assert: (names includes: 'FAMIX.Access.variable').
	self assert: (names includes: 'FAMIX.LocalVariable.parentBehaviouralEntity').
	self assert: (names includes: 'FAMIX.LocalVariable').
	self assert: (names includes: 'FAMIX.BehaviouralEntity.outgoingAccesses').
	self assert: (names includes: 'FAMIX.Inheritance').
	self assert: (names includes: 'FAMIX.Parameter.parentBehaviouralEntity').	"... and tons more ... "
	famixPackage := metamodel packageNamed: 'FAMIX'.
	self assert: famixPackage isFM3Package.
	accessClass := famixPackage classNamed: 'Access'.
	self assert: accessClass isFM3Class.
	accessorProperty := accessClass propertyNamed: 'accessor'.
	self assert: accessorProperty isFM3Property.
	self assert: accessorProperty name equals: #accessor.
	self assert: accessorProperty opposite notNil.
	behaviouralEntity := famixPackage classNamed: 'BehaviouralEntity'.
	self assert: behaviouralEntity isFM3Class.
	outgoingAccesses := behaviouralEntity propertyNamed: 'outgoingAccesses'.
	self assert: outgoingAccesses isFM3Property.
	self assert: accessorProperty opposite equals: outgoingAccesses
]

{ #category : #tests }
FMMSEParserTest >> testFullDocument [
	r reset.
	p fromString: self class famix30mse.
	p Document.
	self assert: r contents first equals: #(#beginDocument).
	self assert: r contents size > 200.	" = many"
	self assert: r contents last equals: #(#endDocument).
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testFullName [
	p fromString: 'Foo'.
	r := p tFULLNAME.
	self assert: r equals: 'Foo'.
	self assert: p atEnd.
	p fromString: 'A'.
	r := p tFULLNAME.
	self assert: r equals: 'A'.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testFullName2 [
	p fromString: 'Foo.Bar'.
	r := p tFULLNAME.
	self assert: r equals: 'Foo.Bar'.
	self assert: p atEnd.
	p fromString: 'A.b'.
	r := p tFULLNAME.
	self assert: r equals: 'A.b'.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testFullName3 [
	p fromString: 'Foo.Bar.Qux'.
	r := p tFULLNAME.
	self assert: r equals: 'Foo.Bar.Qux'.
	self assert: p atEnd.
	p fromString: 'A.b.q'.
	r := p tFULLNAME.
	self assert: r equals: 'A.b.q'.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testFullNameDotDotFails [
	p fromString: 'Foo..Bar'.
	self should: [ p tFULLNAME ] raise: Error
]

{ #category : #tests }
FMMSEParserTest >> testFullNameTrailingDotFails [
	p fromString: 'Foo.'.
	self should: [ p tFULLNAME ] raise: Error
]

{ #category : #tests }
FMMSEParserTest >> testImporter [
	self assert: p importer equals: r
]

{ #category : #tests }
FMMSEParserTest >> testMatchString [
	p fromString: '''Lorem'''.
	r := p String.
	self assert: r equals: 'Lorem'.
	self assert: p atEnd.
	p fromString: '''Eo''ipso'''.
	r := p String.
	self assert: r equals: 'Eo'.
	self assert: p peek equals: $i.
	p fromString: '''Eo''''ipso'''.
	r := p String.
	self assert: r equals: 'Eo''ipso'.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testNumber [
	p fromString: '14'.
	r := p Number.
	self assert: r equals: 14.
	self assert: p atEnd.
	p fromString: '-23x'.
	r := p Number.
	self assert: r equals: -23.
	self assert: p peek equals: $x.
	p fromString: '1'.
	r := p Number.
	self assert: r equals: 1.
	self assert: p atEnd.
	p fromString: '-1'.
	r := p Number.
	self assert: r equals: -1.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testNumber2 [
	p fromString: '12.91'.
	r := p Number.
	self assert: p atEnd.
	self assert: r equals: 12.91.
	p fromString: '-47.11'.
	r := p Number.
	self assert: r equals: -47.11.
	self assert: p atEnd.
	p fromString: '1.1'.
	r := p Number.
	self assert: r equals: 1.1.
	self assert: p atEnd.
	p fromString: '-1.1'.
	r := p Number.
	self assert: r equals: -1.1.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testNumber3 [
	p fromString: '12.91e33'.
	r := p Number.
	self assert: p atEnd.
	self assert: r equals: 1.291e34.
	p fromString: '-47.11e22'.
	r := p Number.
	self assert: r equals: -4.711e23.
	self assert: p atEnd.
	p fromString: '-23.11e-15'.
	r := p Number.
	self assert: r equals: -2.311e-14.
	self assert: p atEnd.
	p fromString: '1.1e2'.
	r := p Number.
	self assert: r equals: 110.0.
	self assert: p atEnd.
	p fromString: '-1.1e2'.
	r := p Number.
	self assert: r equals: -110.0.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testNumberTrailingDotFails [
	p fromString: '12.'.
	self should: [ p Number ] raise: Error
]

{ #category : #tests }
FMMSEParserTest >> testNumberTrailingLetterFails [
	p fromString: '12.11e'.
	self should: [ p Number ] raise: Error
]

{ #category : #tests }
FMMSEParserTest >> testProperty [
	a := #(#(#beginProperty: 'name') #(#endProperty: 'name')).
	r reset.
	p fromString: '(name)'.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd.
	r reset.
	p fromString: '(  name  )  '.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyNameWithUnderscore [
	a := #(#(#beginProperty: 'name_with_underscore') #(#endProperty: 'name_with_underscore')).
	r reset.
	p fromString: '(name_with_underscore)'.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd.
	r reset.
	p fromString: '(  name_with_underscore  )  '.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyWithBoolean [
	a := #(#(#beginProperty: 'name') #(#primitive: true) #(#primitive: false) #(#endProperty: 'name')).
	r reset.
	p fromString: '(name true false)'.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd.
	r reset.
	p fromString: '(  name   true   false  )  '.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyWithEntitys [
	a := #(#(#beginProperty: 'name') #(#beginEntity: 'Foo') #(#endEntity: 'Foo') #(#beginEntity: 'Bar') #(#endEntity: 'Bar') #(#endProperty: 'name')).
	r reset.
	p fromString: '(name(Foo)(Bar))'.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd.
	r reset.
	p fromString: '(  name  (  Foo  )  (  Bar  )     )  '.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyWithNumbers [
	a := #(#(#beginProperty: 'name') #(#primitive: 1) #(#primitive: 2) #(#primitive: 3) #(#endProperty: 'name')).
	r reset.
	p fromString: '(name 1 2 3)'.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd.
	r reset.
	p fromString: '(  name    1    2    3  )  '.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyWithReferences [
	a := #(#(#beginProperty: 'name') #(#referenceNumber: 2) #(#referenceNumber: 3) #(#endProperty: 'name')).
	r reset.
	p fromString: '(name(ref:2)(ref:3))'.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd.
	r reset.
	p fromString: '(  name  (  ref:  2  )  (  ref:  3  )     )  '.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyWithStrings [
	a := #(#(#beginProperty: 'name') #(#primitive: 'bar') #(#primitive: 'ba') #(#primitive: 'rossa') #(#endProperty: 'name')).
	r reset.
	p fromString: '(name ''bar'' ''ba'' ''rossa'')'.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd.
	r reset.
	p fromString: '(  name  ''bar''      ''ba''      ''rossa'')  '.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyWithStrings2 [
	a := #(#(#beginProperty: 'name') #(#primitive: 'bar''ba''rossa') #(#endProperty: 'name')).
	r reset.
	p fromString: '(name ''bar''''ba''''rossa'')'.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd.
	r reset.
	p fromString: '(  name  ''bar''''ba''''rossa''     )  '.
	p Property.
	self assert: r contents equals: a.
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testSerial [
	p fromString: '(id:42)'.
	p Serial.
	self assert: r contents equals: #(#(#serial: 42)).
	self assert: p atEnd.
	self setUp.
	p fromString: '(  id:  42  )'.
	p Serial.
	self assert: r contents equals: #(#(#serial: 42)).
	self assert: p atEnd.
	self setUp
]

{ #category : #tests }
FMMSEParserTest >> testSimpleDocument [
	p fromString: '()'.
	p Document.
	self assert: r contents equals: #(#(#beginDocument) #(#endDocument)).
	self assert: p atEnd.
	r reset.
	p fromString: '  (  )  '.
	p Document.
	self assert: r contents equals: #(#(#beginDocument) #(#endDocument)).
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueFloat [
	r reset.
	p fromString: '3.14'.
	p Value.
	self assert: r contents equals: #(#(#primitive: 3.14)).
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueFloatError [
	r reset.
	p fromString: '3.14e$'.
	self should: [ p Value ] raise: FMSyntaxError
]

{ #category : #tests }
FMMSEParserTest >> testValueFloatError2 [
	r reset.
	p fromString: '1..2'.
	self should: [ p Value ] raise: FMSyntaxError
]

{ #category : #tests }
FMMSEParserTest >> testValueFloatWithExponent [
	r reset.
	p fromString: '1.291e3'.
	p Value.
	self assert: r contents equals: #(#(#primitive: 1291)).
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueNegativeNumber [
	r reset.
	p fromString: '-42'.
	p Value.
	self assert: r contents equals: #(#(#primitive: -42)).
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueNegativeNumberError [
	r reset.
	p fromString: '--42'.
	p Value.
	self assertEmpty: r contents.
	self assert: p position equals: 1
]

{ #category : #tests }
FMMSEParserTest >> testValueNumber [
	r reset.
	p fromString: '13'.
	p Value.
	self assert: r contents equals: #(#(#primitive: 13)).
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueReference [
	r reset.
	p fromString: '(ref: 24)'.
	p Value.
	self assert: r contents equals: #(#(#referenceNumber: 24)).
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueReferenceBigInteger [
	r reset.
	p fromString: '(ref: 112233445566778899)'.
	p Value.
	self assert: r contents equals: #(#(#referenceNumber: 112233445566778899)).
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueReferenceFullName [
	r reset.
	p fromString: '(ref: EG.Foo)'.
	p Value.
	self assert: r contents equals: #(#(#referenceName: 'EG.Foo')).
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueReferenceName [
	r reset.
	p fromString: '(ref: Foo)'.
	p Value.
	self assert: r contents equals: #(#(#referenceName: 'Foo')).
	self assert: p atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueReferenceStringError [
	r reset.
	p fromString: '(ref: ''String'')'.
	self should: [ p Value ] raise: FMSyntaxError
]
