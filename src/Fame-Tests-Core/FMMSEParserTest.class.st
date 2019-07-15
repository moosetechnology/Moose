Class {
	#name : #FMMSEParserTest,
	#superclass : #TestCase,
	#instVars : [
		'p',
		'r',
		'a'
	],
	#category : #'Fame-Tests-Core'
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
				(attributes 
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
				(attributes 
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
				(attributes 
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
				(attributes 
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
				(attributes
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
				(attributes 
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
				(attributes 
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
				(attributes 
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
				(attributes 
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
				(attributes 
					(FM3.Property 
						(id: 12)
						(name ''parentNamespace'')
                        (container true)
						(opposite (ref: 59))
						(type (ref: 67)))))
			(FM3.Class 
				(id: 33)
				(name ''Entity'')
				(attributes 
					(FM3.Property 
						(id: 64)
						(name ''sourceAnchor'')
						(multivalued true)
						(type (ref: String)))))
			(FM3.Class 
				(id: 66)
				(name ''Type'')
				(superclass (ref: 63))
				(attributes 
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
				(attributes 
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
				(attributes 
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
				(attributes 
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
				(attributes 
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
				(attributes 
					(FM3.Property 
						(id: 48)
						(name ''isAbstract'')
						(type (ref: Boolean)))))
			(FM3.Class 
				(id: 23)
				(name ''Inheritance'')
				(superclass (ref: 10))
				(attributes 
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
				(attributes 
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
               (attributes
                   (FM3.Property
                       (name ''librarian'')
                       (type (ref: 2)))
                   (FM3.Property
                       (name ''books'')
                       (multivalued true)
                       (type (ref: 1)))))
           (FM3.Class (id: 1)
               (name ''Book'')
               (attributes
                   (FM3.Property
                       (name ''title'')
                       (type (ref: String)))
                   (FM3.Property (id: 100)
                       (name ''authors'')
                       (multivalued true)
                       (type (ref: 2)))))
           (FM3.Class (id: 2)
               (name ''Person'')
               (attributes
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
	r := FMDebugClient new.
	p client: r.

	
]

{ #category : #running }
FMMSEParserTest >> testAttribute [
	a := #(#(#beginAttribute: 'name') #(#endAttribute: 'name')).
	r reset.
	p fromString: '(name)'.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue.
	r reset.
	p fromString: '(  name  )  '.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testAttributeNameWithUnderscore [
	a := #(#(#beginAttribute: 'name_with_underscore') #(#endAttribute: 'name_with_underscore')).
	r reset.
	p fromString: '(name_with_underscore)'.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue.
	r reset.
	p fromString: '(  name_with_underscore  )  '.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testAttributeWithBoolean [
	a := #(#(#beginAttribute: 'name') #(#primitive: true) #(#primitive: false) #(#endAttribute: 'name')).
	r reset.
	p fromString: '(name true false)'.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue.
	r reset.
	p fromString: '(  name   true   false  )  '.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testAttributeWithElements [
	a := #(#(#beginAttribute: 'name') #(#beginElement: 'Foo') #(#endElement: 'Foo') #(#beginElement: 'Bar') #(#endElement: 'Bar') #(#endAttribute: 'name')).
	r reset.
	p fromString: '(name(Foo)(Bar))'.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue.
	r reset.
	p fromString: '(  name  (  Foo  )  (  Bar  )     )  '.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testAttributeWithNumbers [
	a := #(#(#beginAttribute: 'name') #(#primitive: 1) #(#primitive: 2) #(#primitive: 3) #(#endAttribute: 'name')).
	r reset.
	p fromString: '(name 1 2 3)'.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue.
	r reset.
	p fromString: '(  name    1    2    3  )  '.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testAttributeWithReferences [
	a := #(#(#beginAttribute: 'name') #(#referenceNumber: 2) #(#referenceNumber: 3) #(#endAttribute: 'name')).
	r reset.
	p fromString: '(name(ref:2)(ref:3))'.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue.
	r reset.
	p fromString: '(  name  (  ref:  2  )  (  ref:  3  )     )  '.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testAttributeWithStrings [
	a := #(#(#beginAttribute: 'name') #(#primitive: 'bar') #(#primitive: 'ba') #(#primitive: 'rossa') #(#endAttribute: 'name')).
	r reset.
	p fromString: '(name ''bar'' ''ba'' ''rossa'')'.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue.
	r reset.
	p fromString: '(  name  ''bar''      ''ba''      ''rossa'')  '.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testAttributeWithStrings2 [
	a := #(#(#beginAttribute: 'name') #(#primitive: 'bar''ba''rossa') #(#endAttribute: 'name')).
	r reset.
	p fromString: '(name ''bar''''ba''''rossa'')'.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue.
	r reset.
	p fromString: '(  name  ''bar''''ba''''rossa''     )  '.
	p Attribute.
	r contents should = a.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testBacktracking [
	| pos |
	p fromString: 'abcdefg'.
	p peek should = $a.
	p next should = $b.
	pos := p pos.
	p peek should = $b.
	p next should = $c.
	p next should = $d.
	p next should = $e.
	p backtrack: pos.
	p peek should = $b.
	p next should = $c.
	p next should = $d.
	p next should = $e
]

{ #category : #running }
FMMSEParserTest >> testClient [
	p client should = r
]

{ #category : #running }
FMMSEParserTest >> testElement [
	a := #(#(#beginElement: 'Foo') #(#endElement: 'Foo')).
	r reset.
	p fromString: '(Foo)'.
	p Element.
	r contents should = a.
	p atEnd should beTrue.
	r reset.
	p fromString: '(  Foo  )  '.
	p Element.
	r contents should = a.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testElementWithAttributes [
	a := #(#(#beginElement: 'Foo') #(#beginAttribute: 'name') #(#endAttribute: 'name') #(#beginAttribute: 'count') #(#endAttribute: 'count') #(#endElement: 'Foo')).
	r reset.
	p fromString: '(Foo(name)(count))'.
	p Element.
	r contents should = a.
	p atEnd should beTrue.
	r reset.
	p fromString: '(  Foo  (  name  )  (  count  )  )  '.
	p Element.
	r contents should = a.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testElementWithAttributesAndID [
	a := #(#(#beginElement: 'Foo') #(#serial: 42) #(#beginAttribute: 'name') #(#endAttribute: 'name') #(#beginAttribute: 'count') #(#endAttribute: 'count') #(#endElement: 'Foo')).
	r reset.
	p fromString: '(Foo(id:42)(name)(count))'.
	p Element.
	r contents should = a.
	p atEnd should beTrue.
	r reset.
	p fromString: '(  Foo  (  id:  42  )  (  name  )  (  count  )  )  '.
	p Element.
	r contents should = a.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testElementWithID [
	a := #(#(#beginElement: 'Foo') #(#serial: 42) #(#endElement: 'Foo')).
	r reset.
	p fromString: '(Foo(id:42))'.
	p Element.
	r contents should = a.
	p atEnd should beTrue.
	r reset.
	p fromString: '(  Foo  (  id:  42  )  )  '.
	p Element.
	r contents should = a.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testEmptyDocument [
	p fromString: ''.
	p Document.
	r contents should = #(#(#beginDocument) #(#endDocument)).
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testEmptyExportString [
	p fromString: ''.
	p Document.
	r exportString should = '()'
]

{ #category : #running }
FMMSEParserTest >> testFamixModel [
	| repo names famixPackage accessClass accessorProperty behaviouralEntity outgoingAccesses |
	repo := FMTower new metamodel.
	repo importString: self class famix30mse.
	names := repo elements collect: [ :each | each fullName ].
	names size should = 70.
	names should include: 'FAMIX.Access'.
	names should include: 'FAMIX.Method'.
	names should include: 'FAMIX.NamedEntity.belongsTo'.
	names should include: 'FAMIX.Class'.
	names should include: 'FAMIX'.
	names should include: 'FAMIX.Entity.sourceAnchor'.
	names should include: 'FAMIX.Access.accessor'.
	names should include: 'FAMIX.Type.methods'.
	names should include: 'FAMIX.Package.childNamedEntities'.
	names should include: 'FAMIX.Type.attributes'.
	names should include: 'FAMIX.Attribute.parentClass'.
	names should include: 'FAMIX.GlobalVariable'.
	names should include: 'FAMIX.ScopingEntity.parentNamespace'.
	names should include: 'FAMIX.Type'.
	names should include: 'FAMIX.Parameter'.
	names should include: 'FAMIX.Access.isRead'.
	names should include: 'FAMIX.Attribute'.
	names should include: 'FAMIX.ContainerEntity.incomingReferences'.
	names should include: 'FAMIX.Method.parentClass'.
	names should include: 'FAMIX.BehaviouralEntity'.
	names should include: 'FAMIX.BehaviouralEntity.incomingInvocations'.
	names should include: 'FAMIX.StructuralEntity'.
	names should include: 'FAMIX.Access.isWrite'.
	names should include: 'FAMIX.Invocation.sender'.
	names should include: 'FAMIX.ScopingEntity.globalVariables'.
	names should include: 'FAMIX.ContainerEntity'.
	names should include: 'FAMIX.ScopingEntity'.	"self assert: (names includes: 'FAMIX.Invocation.above')."
	names should include: 'FAMIX.Association'.
	names should include: 'FAMIX.StructuralEntity.declaredType'.
	names should include: 'FAMIX.Invocation.receiver'.
	names should include: 'FAMIX.Package'.
	names should include: 'FAMIX.ScopingEntity.childNamespaces'.
	names should include: 'FAMIX.Entity'.
	names should include: 'FAMIX.Reference.from'.
	names should include: 'FAMIX.ContainerEntity.outgoingReferences'.
	names should include: 'FAMIX.BehaviouralEntity.localVariables'.
	names should include: 'FAMIX.Invocation.candidates'.
	names should include: 'FAMIX.Invocation.receiverSourceCode'.
	names should include: 'FAMIX.NamedEntity.name'.
	names should include: 'FAMIX.NamedEntity.receivingInvocations'.
	names should include: 'FAMIX.StructuralEntity.incomingAccesses'.
	names should include: 'FAMIX.LeafEntity'.
	names should include: 'FAMIX.Class.isAbstract'.
	names should include: 'FAMIX.BehaviouralEntity.signature'.
	names should include: 'FAMIX.Inheritance.subclass'.
	names should include: 'FAMIX.Reference'.
	names should include: 'FAMIX.BehaviouralEntity.outgoingInvocations'.
	names should include: 'FAMIX.Access.variable'.
	names should include: 'FAMIX.LocalVariable.parentBehaviouralEntity'.
	names should include: 'FAMIX.LocalVariable'.
	names should include: 'FAMIX.BehaviouralEntity.outgoingAccesses'.
	names should include: 'FAMIX.Inheritance'.
	names should include: 'FAMIX.Parameter.parentBehaviouralEntity'.	"... and tons more ... "
	famixPackage := repo at: 'FAMIX'.
	famixPackage isFM3Package should beTrue.
	accessClass := famixPackage classNamed: 'Access'.
	accessClass isFM3Class should beTrue.
	accessorProperty := accessClass attributeNamed: 'accessor'.
	accessorProperty isFM3Property should beTrue.
	accessorProperty name should = #accessor.
	accessorProperty opposite notNil should beTrue.
	behaviouralEntity := famixPackage classNamed: 'BehaviouralEntity'.
	behaviouralEntity isFM3Class should beTrue.
	outgoingAccesses := behaviouralEntity attributeNamed: 'outgoingAccesses'.
	outgoingAccesses isFM3Property should beTrue.
	accessorProperty opposite should = outgoingAccesses
]

{ #category : #running }
FMMSEParserTest >> testFullDocument [
	r reset.
	p fromString: self class famix30mse.
	p Document.
	r contents first should = #(#beginDocument).
	r contents size should > 200.	" = many"
	r contents last should = #(#endDocument).
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testFullName [
	p fromString: 'Foo'.
	r := p tFULLNAME.
	r should = 'Foo'.
	p atEnd should beTrue.
	p fromString: 'A'.
	r := p tFULLNAME.
	r should = 'A'.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testFullName2 [
	p fromString: 'Foo.Bar'.
	r := p tFULLNAME.
	r should = 'Foo.Bar'.
	p atEnd should beTrue.
	p fromString: 'A.b'.
	r := p tFULLNAME.
	r should = 'A.b'.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testFullName3 [
	p fromString: 'Foo.Bar.Qux'.
	r := p tFULLNAME.
	r should = 'Foo.Bar.Qux'.
	p atEnd should beTrue.
	p fromString: 'A.b.q'.
	r := p tFULLNAME.
	r should = 'A.b.q'.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testFullNameDotDotFails [
	p fromString: 'Foo..Bar'.
	self 
		should: [ p tFULLNAME ]
		raise: Error
]

{ #category : #running }
FMMSEParserTest >> testFullNameTrailingDotFails [
	p fromString: 'Foo.'.
	self 
		should: [ p tFULLNAME ]
		raise: Error
]

{ #category : #running }
FMMSEParserTest >> testMatchString [
	p fromString: '''Lorem'''.
	r := p String.
	r should = 'Lorem'.
	p atEnd should beTrue.
	p fromString: '''Eo''ipso'''.
	r := p String.
	r should = 'Eo'.
	p peek should = $i.
	p fromString: '''Eo''''ipso'''.
	r := p String.
	r should = 'Eo''ipso'.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testNumber [
	p fromString: '14'.
	r := p Number.
	r should = 14.
	p atEnd should beTrue.
	p fromString: '-23x'.
	r := p Number.
	r should = -23.
	p peek should = $x.
	p fromString: '1'.
	r := p Number.
	r should = 1.
	p atEnd should beTrue.
	p fromString: '-1'.
	r := p Number.
	r should = -1.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testNumber2 [
	p fromString: '12.91'.
	r := p Number.
	p atEnd should beTrue.
	r should = 12.91.
	p fromString: '-47.11'.
	r := p Number.
	r should = -47.11.
	p atEnd should beTrue.
	p fromString: '1.1'.
	r := p Number.
	r should = 1.1.
	p atEnd should beTrue.
	p fromString: '-1.1'.
	r := p Number.
	r should = -1.1.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testNumber3 [
	p fromString: '12.91e33'.
	r := p Number.
	p atEnd should beTrue.
	r should = 1.291e34.
	p fromString: '-47.11e22'.
	r := p Number.
	r should = -4.711e23.
	p atEnd should beTrue.
	p fromString: '-23.11e-15'.
	r := p Number.
	r should = -2.311e-14.
	p atEnd should beTrue.
	p fromString: '1.1e2'.
	r := p Number.
	r should = 110.0.
	p atEnd should beTrue.
	p fromString: '-1.1e2'.
	r := p Number.
	r should = -110.0.
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testNumberTrailingDotFails [
	p fromString: '12.'.
	self 
		should: [ p Number ]
		raise: Error
]

{ #category : #running }
FMMSEParserTest >> testNumberTrailingLetterFails [
	p fromString: '12.11e'.
	self 
		should: [ p Number ]
		raise: Error
]

{ #category : #running }
FMMSEParserTest >> testSerial [
	p fromString: '(id:42)'.
	p Serial.
	r contents should = #(#(#serial: 42)).
	p atEnd should beTrue.
	self setUp.
	p fromString: '(  id:  42  )'.
	p Serial.
	r contents should = #(#(#serial: 42)).
	p atEnd should beTrue.
	self setUp
]

{ #category : #running }
FMMSEParserTest >> testSimpleDocument [
	p fromString: '()'.
	p Document.
	r contents should = #(#(#beginDocument) #(#endDocument)).
	p atEnd should beTrue.
	r reset.
	p fromString: '  (  )  '.
	p Document.
	r contents should = #(#(#beginDocument) #(#endDocument)).
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testValueFloat [
	r reset.
	p fromString: '3.14'.
	p Value.
	r contents should = #(#(#primitive: 3.14)).
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testValueFloatError [
	r reset.
	p fromString: '3.14e$'.
	self 
		should: [ p Value ]
		raise: FMSyntaxError
]

{ #category : #running }
FMMSEParserTest >> testValueFloatError2 [
	r reset.
	p fromString: '1..2'.
	self 
		should: [ p Value ]
		raise: FMSyntaxError
]

{ #category : #running }
FMMSEParserTest >> testValueFloatWithExponent [
	r reset.
	p fromString: '1.291e3'.
	p Value.
	r contents should = #(#(#primitive: 1291)).
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testValueNegativeNumber [
	r reset.
	p fromString: '-42'.
	p Value.
	r contents should = #(#(#primitive: -42)).
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testValueNegativeNumberError [
	r reset.
	p fromString: '--42'.
	p Value.
	r contents isEmpty should beTrue.
	p pos should = 1
]

{ #category : #running }
FMMSEParserTest >> testValueNumber [
	r reset.
	p fromString: '13'.
	p Value.
	r contents should = #(#(#primitive: 13)).
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testValueReference [
	r reset.
	p fromString: '(ref: 24)'.
	p Value.
	r contents should = #(#(#referenceNumber: 24)).
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testValueReferenceBigInteger [
	r reset.
	p fromString: '(ref: 112233445566778899)'.
	p Value.
	r contents should = #(#(#referenceNumber: 112233445566778899)).
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testValueReferenceFullName [
	r reset.
	p fromString: '(ref: EG.Foo)'.
	p Value.
	r contents should = #(#(#referenceName: 'EG.Foo')).
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testValueReferenceName [
	r reset.
	p fromString: '(ref: Foo)'.
	p Value.
	r contents should = #(#(#referenceName: 'Foo')).
	p atEnd should beTrue
]

{ #category : #running }
FMMSEParserTest >> testValueReferenceStringError [
	r reset.
	p fromString: '(ref: ''String'')'.
	self 
		should: [ p Value ]
		raise: FMSyntaxError
]
