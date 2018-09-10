Class {
	#name : #MooseChefHelp,
	#superclass : #CustomHelp,
	#category : #'Moose-Help'
}

{ #category : #accessing }
MooseChefHelp class >> bookName [ 
	^'MooseChef'
]

{ #category : #documentation }
MooseChefHelp class >> contact [
	^ HelpTopic 
		title: 'Contact'
		contents: 'You can get in touch with the author of this help by writting to: alexandre.bergel@me.com
		
Moose chef has been originally written by Simon Denier, and then revamped by Anne Etien.'
]

{ #category : #documentation }
MooseChefHelp class >> overview [
	^ HelpTopic 
		title: 'Overview'
		contents: 
'Moose chef is a domain-specific language to query dependencies between structural elements in Moose.

For example, you can have:
aFamixObject queryAllOutgoingInvocations atTypeScope
=> Return all the classes used by aFamixObject, which could be a FAMIXMethod, FAMIXClass, FAMIXNamepsace

aFamixObject queryOutgoingReferences atTypeScope
=> Return all the classes referenced by a famix object.

There are the following scope:
- atNamespaceScope
- atPackageScope
- atTypeScope
'
]

{ #category : #accessing }
MooseChefHelp class >> pages [
	^#(overview contact)
]
