Class {
	#name : #FMReadMe,
	#superclass : #Object,
	#category : #'Fame-Util'
}

{ #category : #'useful scripts' }
FMReadMe >> export: class name: name on: stream [ 
	stream
		nextPutAll: 'm class: ' , name printString , ' instVarNames: ' , class class instVarNames printString;
		nextPut: $.;
		cr.
	class selectors do: 
		[ :selector | 
		stream
			nextPutAll: 'm class: ' , name printString , 
				' heading: ', (class organization categoryOfElement: selector) printString ,
				' compile: ' , (class sourceCodeAt: selector) asString printString;
			nextPut: $.;
			cr ]
]

{ #category : #'useful scripts' }
FMReadMe >> exportSources [
	"((( 		self new exportSources 		 )))"
	| classes stream |
	classes := Smalltalk allClasses select: [ :each | each category beginsWith: 'Fame' ].
	stream := FileStream fileNamed: '/Users/akuhn/Desktop/fame.st'.
	classes do: [ :class |
		self export: class name: class name on: stream. 
		self export: class class name: (class name, '_class') asSymbol on: stream. 
		].
	stream close
]

{ #category : #todo }
FMReadMe >> fameTodos [ '
[ ] Implement FMRepository >> #completeAdd:, which follows ALL meta-described navigation.
[ ] Implement FMRepository >> #compositeAdd:, which follows OWNERSHIP meta-described navigation.
[ ] Implement FMRepository >> #completeDelete:, which follows ALL meta-described navigation.
[ ] Implement FMRepository >> #compositeDelete:, which follows OWNERSHIP meta-described navigation.
[ ] Please dont annotate the test method to test annotations (just use a example class)
[x] Fix issues with the parser.
[x] Test that annotation updating works when rerunning a test
[x] Rewrite all those moron tests (and mail people not to use math or loops in tests!)
[x] Teach people to never commit if tests fail
[x] See that all developers are on fame-dev mailing list
[x] Have a look at how the setup of Fame towers works?
[x] Get rid of the #defaultDescriptionFor: cancer!
[x] Fix #asFameDescription
[x] Hunt down all singeltons and remove them'	
]

{ #category : #'design notes' }
FMReadMe >> note20080603a [
	"On the removal of global methods, or why the Tower of babylon must fall.
	----
		The global methods Object#fameDescription and Class#asFameDescription had always been the cause of much headache and code smells. They introduced global scope, which should be avoided. In particular in an eternal system like Smalltalk, we must take care to avoid global scope. Other than in slant-run systems like Ruby or Python, a Smalltalk system contains instances beloning to different execution context in the same image at the same time. The most obvious example is application and test instances. The best way to handle context  is to make it explicit. Therefore I decided to no longer support a global context (formerly known as 'reference' for historical reasons) in Fame.
		
		Implicit handling of context has both technical and conceptually disadvantages. Technically, because both its implementation techniques (ie installing a dynamic variable on the stack or in the current thread) are not fully supported when debugging. This has lead to quite some pain (lost hours if not days of debugging) in previous versions of Fame. Conceptually, because implicit context always implies the notion of a default context---which is a very dangerous concept, as it might (and was in the past) get used as global context. As long as we only run one application using Fame, that is not a problem, but running two applications running Fame on the default context at same time is surely a one-way ticket to more headache and pain.
		
		All in all, global context is bad for the same reasons any Singelton is a bad thing."
	
	
]

{ #category : #todo }
FMReadMe >> notesESUG2008Talk [
	'
	[ ] versioning, what happen to model elements when metamodel changes?
	[ ] not truely causaly connected (stef)
	[ ] inferrencer missing in Squeak
	[ ] how to extend with new primitive types? (reinout)
	[ ] (re)connect metamodel to freshly generated classes (reinout)
	[ ] mention that Java version is not eternal
	[ ] OBVIOUSLY NEED A LOGO!!! 
	'
]

{ #category : #todo }
FMReadMe >> squeakQuestions [ '
[ ] Can we extend the inspector / explorer with an Fame pane?
[ ] How can I mark broken tests to be skipped?
[ ] Maybe even extend TestRunner to know about skipped tests.
[ ] How can I auto-generate documentation (kinda SqDoc)?
[ ] How can I document the public (=published) interface of classes?
[ ] How can I prevent morons to mess up the public interface?
[ ] How can I document @since information?



'	
]

{ #category : #'useful scripts' }
FMReadMe >> value: class with: stream [ 
	stream
		nextPutAll: 'm metaclass: ' , class name printString , ' instVarNames: ' , class class instVarNames printString;
		nextPut: $.;
		cr.
	class selectors do: 
		[ :selector | 
		stream
			nextPutAll: 'm class: ' , class name printString , ' compile: ' , (class sourceCodeAt: selector) asString printString;
			nextPut: $.;
			cr ]
]
