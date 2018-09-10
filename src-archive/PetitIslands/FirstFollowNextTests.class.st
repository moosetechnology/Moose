Class {
	#name : #FirstFollowNextTests,
	#superclass : #TestCase,
	#category : #'PetitIslands-Tests'
}

{ #category : #support }
FirstFollowNextTests >> assert: set allMatches: string [
	self assert: (set allSatisfy: [:e | e end matches: string])
]

{ #category : #support }
FirstFollowNextTests >> assert: set allSatisfy: aBlock [
	self assert: (set allSatisfy: aBlock)
]

{ #category : #support }
FirstFollowNextTests >> assert: set anyMatches: string [
	self assert: (set anySatisfy: [:e | e end matches: string])
]

{ #category : #support }
FirstFollowNextTests >> assert: set anySatisfy: aBlock [
	self assert: (set anySatisfy: aBlock)

]

{ #category : #support }
FirstFollowNextTests >> assert: set noneMatches: string [
	self assert: (set noneSatisfy: [:e | e end matches: string])
]

{ #category : #support }
FirstFollowNextTests >> assert: set noneSatisfy: aBlock [
	self assert: (set noneSatisfy: aBlock)	
]

{ #category : #support }
FirstFollowNextTests >> assert: set size: anInteger [
	self assert: (set size = anInteger )
]

{ #category : #support }
FirstFollowNextTests >> first: aParser [ 
	^ aParser firstSet
]

{ #category : #support }
FirstFollowNextTests >> first: aParser terminalPredicate: predicate [
	^ aParser firstSetPredicate: predicate
]

{ #category : #support }
FirstFollowNextTests >> follow: aParser in: rootParser [
	^ rootParser followSets at: aParser
	
]

{ #category : #support }
FirstFollowNextTests >> identifier [
	^ ((#letter asParser / $# asParser), (#letter asParser / #digit asParser) star) flatten 
]

{ #category : #support }
FirstFollowNextTests >> next: aParser in: rootParser [
	^ rootParser nextSets at: aParser
	
]

{ #category : #'test first' }
FirstFollowNextTests >> testFirst1 [
	| p first |
	p := nil asParser / 'a' asParser.
	
	self assert: (self first: p) anyMatches: ''.
	self assert: (self first: p) anyMatches: 'a'.

]

{ #category : #'test first' }
FirstFollowNextTests >> testFirst2 [
	| p first |
	p := 'a' asParser optional, 'b' asParser.
	
	self assert: (self first: p) anyMatches: 'a'.
	self assert: (self first: p) anyMatches: 'b'.

]

{ #category : #'test first' }
FirstFollowNextTests >> testFirst3 [
	| p first |
	p := ('a' asParser optional, 'b' asParser asParser optional), 'c' asParser.
	
	self assert: (self first: p) anyMatches: 'a'.
	self assert: (self first: p) anyMatches: 'b'.

]

{ #category : #'test first' }
FirstFollowNextTests >> testFirst4 [
	| p first |
	p := ('a' asParser plus) optional, 'b' asParser.
	
	self assert: (self first: p) anyMatches: 'a'.
	self assert: (self first: p) anyMatches: 'b'.

]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstChoice1 [
	| p first |
	p := nil asParser / '' asParser.
	
	self assert: (self first: p) anySatisfy: [:e | e matches: ''].

]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstChoice2 [
	| p first |
	p := 'a' asParser / nil asParser.
	
	first := (self first: p).
	
	self assert: first anySatisfy: [:e | e matches: 'a'].
	self assert: first anySatisfy: [:e | e matches: ''].

]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstChoice3 [
	| p first |
	p := 'a' asParser / nil asParser / 'b' asParser.
	
	first := (self first: p).
	
	self assert: first anySatisfy: [:e | e matches: 'a'].
	self assert: first anySatisfy: [:e | e matches: 'b'].
	self assert: first anySatisfy: [:e | e matches: ''].
]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstComplex1 [
	| p first root |

	p := 'a' asParser / nil asParser.
	root := p, 'c' asParser.
	
	first := (self first: root).
	
	self assert: first size: 2.
	self assert: first anySatisfy: [:e | e matches: 'a'].
	self assert: first anySatisfy: [:e | e matches: 'c'].
	self assert: first noneSatisfy: [:e | e matches: ''].
]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstComplex2 [
	| p first root |

	p := 'a' asParser / nil asParser / 'b' asParser.
	root := p, 'c' asParser.
	
	first := (self first: root).
	
	self assert: first size: 3.
	self assert: first anySatisfy: [:e | e matches: 'a'].
	self assert: first anySatisfy: [:e | e matches: 'b'].
	self assert: first anySatisfy: [:e | e matches: 'c'].

]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstComplex3 [
	| p first root |

	p := 'a' asParser / nil asParser / 'b' asParser.
	root := p, 'c' asParser not.
	
	first := (self first: root).
	
	self assert: first anySatisfy: [:e | e matches: 'a'].
	self assert: first anySatisfy: [:e | e matches: 'b'].
	self assert: first anySatisfy: [:e | e matches: ''].
	self assert: first noneSatisfy: [:e | e end matches: 'c'].

]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstComplex4 [
	| p first root |

	p := 'a' asParser / nil asParser / 'b' asParser.
	root := (p, 'c' asParser not) wrapped.
	
	first := (self first: root).
	
	self assert: first anySatisfy: [:e | e matches: 'a'].
	self assert: first anySatisfy: [:e | e matches: 'b'].
	self assert: first anySatisfy: [:e | e matches: ''].
	self assert: first noneSatisfy: [:e | e end matches: 'c'].

]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstNegate1 [
	| p first |
	p := 'a' asParser negate, 'b' asParser.
	
	self assert: (p parse: 'bb') isPetitFailure not.
	self assert: (p parse: 'cb') isPetitFailure not.
	
	self assert: (self first: p) noneSatisfy: [:each | each matches: 'a' ].
	self assert: (self first: p) anySatisfy:  [:each | each matches: 'b' ].
	self assert: (self first: p) anySatisfy: [:each | each matches: 'c' ].

]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstNot [
	| p |
	p := 'a' asParser not, 'b' asParser.
	
	self assert: (p parse: 'b') isPetitFailure not.
	
	self assert: (self first: p) size: 1.
	self assert: (self first: p) noneSatisfy: [:each | each matches: 'a' ].
	self assert: (self first: p) anySatisfy:  [:each | each matches: 'b' ].
	self assert: (self first: p) anySatisfy: [:each | each matches: 'c' ].

]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstOptional [
	| p first result |
	p := 'a' asParser optional.
	
	result := (self first: p).
	
	self assert: result anySatisfy: [:e | e matches: '' ].
	self assert: result anySatisfy: [:e | e matches: 'a'].

]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstRepeat1 [
	| p first |
	p := ('a' asParser / nil asParser) plus.
	
	first := self first: p.

	self assert: first anyMatches: 'a'.
	self assert: first anyMatches: ''.	
]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstRepeat2 [
	| p first |
	p := 'a' asParser star, 'b' asParser.
	
	first := self first: p.

	self assert: first anyMatches: 'a'.
	self assert: first anyMatches: 'b'.
	self assert: first noneMatches: ''	
]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstRepeat3 [
	| p first |
	p := 'a' asParser negate, 'a' asParser.
	
	first := self first: p.

	self assert: first noneMatches: 'a'.
]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstRepeat4 [
	| p first |
	p := 'a' asParser negate star, 'b' asParser.
	
	first := self first: p.

	self assert: first size: 2.
	self assert: first noneMatches: 'a'.
]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstSequence1 [
	| p first |
	p := 'a' asParser, 'b' asParser .
	
	first := self first: p.
	self assert: first size: 1.
	self assert: first allMatches: 'a'.
	self assert: first noneMatches: 'b'.	
]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstSequence2 [
	| p first |
	p := nil asParser, 'a' asParser, 'b' asParser .
	
	first := self first: p.
	self assert: first size: 1.
	self assert: first allMatches: 'a'.
	self assert: first noneMatches: 'b'.	
	self assert: first noneMatches: ''.		
]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstSequence3 [
	| p first |
	p := nil asParser, nil asParser.
	
	self assert: (self first: p) anySatisfy: [:e | e end matches: ''].

]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstSequence4 [
	| p first |
	p := ((nil asParser / 'a' asParser) plus), 'b' asParser.
	
	first := self first: p.
	self assert: first anyMatches: 'b'.
	self assert: first anyMatches: 'a'.
	self assert: first noneMatches: ''.
]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstSequence5 [
	| p first |
	p := ((nil asParser / 'a' asParser) star), 'b' asParser.
	
	first := self first: p.
	self assert: first anyMatches: 'b'.
	self assert: first anyMatches: 'a'.
	self assert: first noneMatches: ''.
]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstTerminal2 [
	| p |
	p := 'a' asParser not.
	
	self assert: (self first: p) noneMatches: 'a'.
]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstTerminal3 [
	| p |
	p := 'a' asParser and.
	
	self assert: (self first: p) anyMatches: 'a'
]

{ #category : #'test first' }
FirstFollowNextTests >> testFirstTerminal4 [
	| p |
	p := nil asParser.
	
	self assert: (self first: p) anySatisfy: [:e | e end matches: ''].
]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowNot1 [
	| p followSet terminal |

	terminal := 'a' asParser.
	p := terminal, 'b' asParser not.
	followSet := self follow: terminal in: p.
	
	self assert: followSet anySatisfy: [:e | e matches: 'c' ].
	self assert: followSet anySatisfy: [:e | (e matches: 'b') not ].
]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet1 [
	| result p root followSet |


	p := 'a' asParser.
	root := (p star, 'b' asParser).
	
	followSet := self follow: p in: root.
	
	self assert: followSet anySatisfy: [:e | e literal = 'a'].
	self assert: followSet anySatisfy: [:e | e literal = 'b'].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet10 [
	|  island1 followSet p root island2 block |

	island1 := ('class' asParser, self identifier) sea.
	island2 := ('extends' asParser, self identifier) sea.
	block := '{}' asParser sea.	

	root := (island1, island2 optional, block) star.
	
	followSet := self follow: block in: root.

	self assert: followSet anySatisfy: [:e | e end matches: 'class'].
	self assert: followSet anySatisfy: [:e | e end matches: ''].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet11 [
	|  island1 followSet p root island2 block |

	island1 := ('class' asParser, self identifier) sea.
	island2 := ('extends' asParser, self identifier) sea.
	block := '{}' asParser sea.	

	root := (island1, island2 optional, block) plus.
	
	followSet := self follow: block in: root.

	self assert: followSet anySatisfy: [:e | e end matches: 'class'].
	self assert: followSet anySatisfy: [:e | e end matches: ''].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet12 [
	| parser followSet |
	
	

	parser := 'a' asParser.
	followSet := self follow: parser in: parser.

	self assert: followSet anySatisfy: [:e | e end matches: '' ].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet13 [
	| parser followSet a b c |
	
	a := 'a' asParser.
	b := 'b' asParser optional.
	c := 'c' asParser.
	
	
	parser := a, b, c.
	followSet := self follow: c in: parser.
	self assert: followSet anySatisfy: [:e | e end matches: '' ].
	
	followSet := self follow: b in: parser.
	self assert: followSet anySatisfy: [:e | e end matches: 'c' ].

	followSet := self follow: a in: parser.
	self assert: followSet anySatisfy: [:e | e end matches: 'b' ].
	self assert: followSet anySatisfy: [:e | e end matches: 'c' ].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet14 [
	| parser followSet a b c |
	
	a := 'a' asParser.
	b := 'b' asParser optional.
	c := 'c' asParser.
	
	
	parser := a plus, b, c.

	followSet := self follow: a in: parser.
	self assert: followSet anySatisfy: [:e | e end matches: 'a' ].	
	self assert: followSet anySatisfy: [:e | e end matches: 'b' ].
	self assert: followSet anySatisfy: [:e | e end matches: 'c' ].
	self assert: followSet noneSatisfy: [:e | e end matches: '' ].
]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet2 [
	| result p follow root followSets followSet |

	p := 'a' asParser.
	follow := 'b' asParser, 'c' asParser.
	
	root := (p, follow).

	followSet := self follow: p in: root.

	self assert: followSet size: 1.
	self assert: followSet anySatisfy: [:e | e  end matches: 'b'].
	self assert: followSet noneSatisfy: [:e | e matches: 'c'].	
]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet3 [
	| result p follow root followSets followSet |

	p := 'a' asParser.
	follow := ('b' asParser, 'c' asParser) / ('d' asParser).
	
	
	root := (p, follow).

	followSet := self follow: p in: root.

	self assert: followSet anySatisfy: [:e | e end matches: 'b' ].
	self assert: followSet anySatisfy: [:e | e end matches: 'd' ].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet4 [
	| result p follow root followSets followSet |

	p := 'a' asParser.
	follow := ('b' asParser, 'c' asParser).
	
	
	root := (p star, follow).

	followSet := self follow: p in: root.

	self assert: followSet anySatisfy: [:e | e end matches: 'b' ].
	self assert: followSet anySatisfy: [:e | e end matches: 'a' ].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet5 [
	| result p root followSets followSet follow1 follow2 |

	p := 'a' asParser.
	follow1 := ('b' asParser, 'c' asParser) / nil asParser.
	follow2 := 'd' asParser.
	
	
	root := (p, follow1, follow2).

	followSet := self follow: p in: root.

	self assert: followSet anySatisfy: [:e | e end matches: 'b' ].
	self assert: followSet anySatisfy: [:e | e end matches: 'd' ].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet6 [
	| result p root followSets followSet follow follow1 follow2 |

	p := 'a' asParser.
	follow1 := ('b' asParser, 'c' asParser) / nil asParser.
	follow2 := 'd' asParser.
	
	follow := (follow1, follow2).
	
	root  := (p, follow).

	followSet := self follow: p in: root.

	self assert: followSet anySatisfy: [:e | e end matches: 'b' ].
	self assert: followSet anySatisfy: [:e | e end matches: 'd' ].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet7 [
	| result p root followSets followSet r1 r2 follow1 follow2 |

	p := 'a' asParser.
	follow1 := ('b' asParser, 'c' asParser) / nil asParser.
	follow2 := 'd' asParser / nil asParser .
	
	r1 := (p, follow1).
	r2 := (r1, follow2).
	
	root  := r2.

	followSet := self follow: p in: root.

	self assert: followSet anySatisfy: [:e | e end matches: 'b' ].
	self assert: followSet anySatisfy: [:e | e end matches: 'd' ].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet8 [
	| result p root followSets followSet follow |

	p := 'a' asParser.
	follow := PPEndOfFileParser new.
	
	root := p, follow.

	followSet := self follow: p in: root.

	self assert: followSet anySatisfy: [:e | e end matches: ''].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSet9 [
	|  island1 followSet p root island2 block |

	island1 := ('class' asParser, self identifier) sea.
	island2 := (':' asParser, self identifier) sea.
	block := '{' asParser, '}' asParser sea.	

	root := (island1, island2 optional, block) sea.
	
	followSet := self follow: island1 in: root.

	self assert: followSet anySatisfy: [:e | e end matches: '{'].
	self assert: followSet anySatisfy: [:e | e end matches: ':'].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSetChoice1 [
	| result p root followSets followSet follow |

	p := 'a' asParser.
	follow := 'b' asParser / 'c' asParser .
	
	root := p, follow.

	followSet := self follow: p in: root.
	
	self assert: followSet anySatisfy: [:e | (e parse: 'b') isPetitFailure not].
	self assert: followSet anySatisfy: [:e | (e parse: 'c') isPetitFailure not].
	self assert: followSet noneSatisfy: [:e | (e parse: 'a') isPetitFailure not].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSetChoice2 [
	| result p root followSet follow b c |

	follow := 'a' asParser / 'd' asParser.
	b := 'b' asParser.
	c := 'c' asParser.
	p := b / c.
	
	root := p, follow.

	followSet := self follow: p in: root.

	self assert: followSet anySatisfy: [:e | (e parse: 'a') isPetitFailure not].
	self assert: followSet anySatisfy: [:e | (e parse: 'd') isPetitFailure not].

	followSet := self follow: p in: root.
	
	self assert: followSet anySatisfy: [:e | (e parse: 'a') isPetitFailure not].
	self assert: followSet noneSatisfy: [:e | (e parse: 'c') isPetitFailure not].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSetOptional1 [
	| result p root followSets followSet follow follow1 follow2 |

	p := 'a' asParser.
	follow1 := 'b' asParser optional.
	follow2 := 'c' asParser.
	
	root := p, follow1, follow2.

	followSet := self follow: p in: root.

	self assert: followSet anySatisfy: [:e | e end matches: 'b'].
	self assert: followSet anySatisfy: [:e | e end matches: 'c'].
	self assert: followSet noneSatisfy: [:e | e end matches: ''].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSetRepeat1 [
	| p followSet terminal |

	terminal := 'a' asParser.
	p := terminal plus.
	
	followSet := self follow: terminal in: p.
	self assert: followSet anySatisfy: [:e | e end matches: 'a' ].
	self assert: followSet anySatisfy: [:e | e end matches: '' ].

	followSet := self follow: p in: p.
	self assert: followSet anySatisfy: [:e | e end matches: '' ].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSetStar1 [
	| a b p followSet |

	a := 'a' asParser star.
	b := 'b' asParser.
	p := a, b.
	followSet := self follow: a in: p.
	
	self assert: followSet size: 1.
	self assert: followSet anySatisfy: [:e | e end matches: 'b'].
	self assert: followSet noneSatisfy: [:e | e end matches: ''].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSetStar3 [
	| a b p followSet n |

	a := 'a' asParser star.
	p := a.
	followSet := self follow: a in: p.
	
	self assert: followSet noneSatisfy: [:e | e end matches: 'a'].
	self assert: followSet anySatisfy: [:e | e end matches: ''].
]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSetStar4 [
	| a b p followSet |

	a := 'a' asParser.
	b := 'b' asParser.
	p := a star, b.
	followSet := self follow: a in: p.
	
	self assert: followSet size: 2.
	self assert: followSet anySatisfy: [:e | e end matches: 'a'].
	self assert: followSet anySatisfy: [:e | e end matches: 'b'].
	self assert: followSet noneSatisfy: [:e | e end matches: ''].

]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSetStar5 [
	| a b p followSet n |

	a := 'a' asParser.
	b := 'b' asParser.
	n := nil asParser.
	p := a star, (b / n).
	followSet := self follow: a in: p.
	

	self assert: followSet anySatisfy: [:e | e end matches: 'a'].
	self assert: followSet anySatisfy: [:e | e end matches: 'b'].
	self assert: followSet anySatisfy: [:e | e end matches: ''].
]

{ #category : #'test follow' }
FirstFollowNextTests >> testFollowSetStar6 [
	| a b p followSet n |

	a := 'a' asParser.
	p := a star.
	followSet := self follow: a in: p.
	

	self assert: followSet anySatisfy: [:e | e end matches: 'a'].
	self assert: followSet anySatisfy: [:e | e end matches: ''].
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullable01 [
	self assert:	'a' asParser acceptsEpsilon not.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullable02 [
	self assert:	'a' asParser wrapped acceptsEpsilon not.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullable03 [
	self assert:	nil asParser acceptsEpsilon.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullable04 [
	self assert:	nil asParser wrapped acceptsEpsilon.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullable05 [
	self assert:	 'a' asParser not acceptsEpsilon not.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullable06 [
	self assert:	 'a' asParser and acceptsEpsilon not.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullable07 [
	self assert:	 'a' asParser wrapped not acceptsEpsilon not.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullable08 [
	self assert:	 'a' asParser wrapped and acceptsEpsilon not.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullable09 [
	self assert:	 'a' asParser optional acceptsEpsilon.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullable10 [
	self assert:	 'a' asParser wrapped optional acceptsEpsilon.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullable11 [
	self assert:	 'a' asParser wrapped not optional acceptsEpsilon.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullable12 [
	self assert:	 'a' asParser optional wrapped acceptsEpsilon.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullableChoice1 [
	| a b c p |
	a := 'a' asParser.
	b := 'b' asParser.
	c := 'c' asParser.
	
	p := a / b / c.
	
	self assert: p acceptsEpsilon not.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullableChoice2 [
	| a b c p |
	a := 'a' asParser.
	b := 'b' asParser optional.
	c := 'c' asParser.
	
	p := a / b / c.
	
	self assert: p acceptsEpsilon.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullableChoice3 [
	| a b c p |
	a := 'a' asParser optional.
	b := 'b' asParser optional.
	c := 'c' asParser optional.
	
	p := a / b / c.
	
	self assert: p acceptsEpsilon.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullableChoice4 [
	| a b c p |
	a := 'a' asParser optional wrapped.
	b := 'b' asParser optional wrapped.
	c := 'c' asParser optional wrapped.
	
	p := a / b / c.
	
	self assert: p acceptsEpsilon.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullableCycle1 [
	| a p |
	a := 'a' asParser.
	p := PPDelegateParser new.
	
	p setParser: a / p.
	self assert: p acceptsEpsilon not.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullableCycle2 [
	| a p e |
	a := 'a' asParser.
	e := nil asParser.
	p := PPDelegateParser new.
	
	p setParser: (a, p) / e.
	
	self assert: p acceptsEpsilon.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullableCycle3 [
	| a p e |
	a := 'a' asParser.
	e := nil asParser.
	p := PPDelegateParser new.
	
	p setParser: (a, p), e.
	
	self assert: p acceptsEpsilon not.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullableEOF [
	| a |
	a := #eof asParser.
	self assert: a acceptsEpsilon not.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullableSeq1 [
	| a b c p |
	a := 'a' asParser.
	b := 'b' asParser.
	c := 'c' asParser.
	
	p := a, b, c.
	
	self assert: p acceptsEpsilon not.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullableSeq2 [
	| a b c p |
	a := 'a' asParser.
	b := 'b' asParser optional.
	c := 'c' asParser.
	
	p := a, b, c.
	
	self assert: p acceptsEpsilon not.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullableSeq3 [
	| a b c p |
	a := 'a' asParser optional.
	b := 'b' asParser optional.
	c := 'c' asParser optional.
	
	p := a, b, c.
	
	self assert: p acceptsEpsilon.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullableSeq4 [
	| a b c p |
	a := 'a' asParser optional wrapped.
	b := 'b' asParser optional wrapped.
	c := 'c' asParser wrapped optional.
	
	p := a, b, c.
	
	self assert: p acceptsEpsilon.
]

{ #category : #'test isNullable' }
FirstFollowNextTests >> testIsNullableStartOfLine [
	| a |
	a := #startOfLine asParser.
	self assert: a acceptsEpsilon not.
]

{ #category : #'test next' }
FirstFollowNextTests >> testNext1 [
	| p nextSet |
	p := 'a' asParser.
	
	nextSet := (self next: p in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: ''].
]

{ #category : #'test next' }
FirstFollowNextTests >> testNext2 [
	| p nextSet a b |
	a := 'a' asParser.
	b := 'b' asParser.
	
	p := a, b.
	
	nextSet := (self next: a in: p).
	self assert: nextSet size: 1.
	self assert: nextSet anySatisfy: [:e | e end matches: 'b'].
	
	nextSet := (self next: b in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: ''].
	
	nextSet := (self next: p in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: ''].
]

{ #category : #'test next' }
FirstFollowNextTests >> testNext3 [
	| p nextSet a b |
	a := 'a' asParser.
	b := 'b' asParser.
	
	p := a / b.
	
	nextSet := (self next: a in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: ''].
	
	nextSet := (self next: b in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: ''].
	
	nextSet := (self next: p in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: ''].

]

{ #category : #'test next' }
FirstFollowNextTests >> testNext4 [
	| p nextSet a b n |
	a := 'a' asParser.
	b := 'b' asParser.
	n := nil asParser.
	
	p := a, n, b.
	
	nextSet := (self next: a in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: 'b'].
	
	nextSet := (self next: n in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: 'b'].
	
	nextSet := (self next: b in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: ''].

]

{ #category : #'test next' }
FirstFollowNextTests >> testNext5 [
	| p nextSet a b n a1 a2 |
	a1 := 'a1' asParser wrapped.
	a2 := 'a2' asParser wrapped.
	a := (a1 asParser, a2 asParser) wrapped.
	b := 'b' asParser.
	n := 'n' asParser optional.
	
	p := a, n, b.
	
	nextSet := (self next: a1 in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: 'a2'].

	nextSet := (self next: a2 in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: 'b'].
	self assert: nextSet anySatisfy: [:e | e end matches: 'nb'].



	nextSet := (self next: a in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: 'b'].
	self assert: nextSet anySatisfy: [:e | e end matches: 'nb'].
	
	nextSet := (self next: n in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: 'b'].
	
	nextSet := (self next: b in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: ''].
	self assert: nextSet noneSatisfy: [:e | e end matches: 'b'].	
]

{ #category : #'test next' }
FirstFollowNextTests >> testNext6 [
	| p nextSet a b n a1 a2 |
	a1 := 'a1' asParser wrapped.
	a2 := 'a2' asParser wrapped / nil asParser.
	a := (a1 asParser, a2 asParser) wrapped.
	b := 'b' asParser.
	n := 'nil' asParser optional.
	
	p := a, n, b.
	
	nextSet := (self next: a1 in: p).
	self assert: nextSet anySatisfy: [:e | e matches: 'a2'].
	self assert: nextSet anySatisfy: [:e | e matches: 'nilb'].
	self assert: nextSet anySatisfy: [:e | e matches: 'b'].

	nextSet := (self next: a2 in: p).
	self assert: nextSet anySatisfy: [:e | e matches: 'nilb'].
	self assert: nextSet anySatisfy: [:e | e matches: 'b'].


	nextSet := (self next: a in: p).
	self assert: nextSet anySatisfy: [:e | e matches: 'nilb'].
	self assert: nextSet anySatisfy: [:e | e matches: 'b'].
	
	nextSet := (self next: n in: p).
	self assert: nextSet anySatisfy: [:e | e matches: 'b'].
	
	nextSet := (self next: b in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: ''].

]

{ #category : #'test next' }
FirstFollowNextTests >> testNext7 [
	| p nextSet a b n  c |
	a := 'a' asParser.
	b := 'b' asParser.
	c := 'c' asParser.
	n := nil asParser.
	
	p := a, b, a, n, c.
	
	nextSet := (self next: a in: p).

	self assert: nextSet anySatisfy: [:e | e matches: 'bac'].
	self assert: nextSet anySatisfy: [:e | e matches: 'c'].


]

{ #category : #'test next' }
FirstFollowNextTests >> testNext8 [
	| p nextSet a b n  c |
	a := 'a' asParser.
	b := 'b' asParser.
	c := 'c' asParser.
	n := nil asParser.
	
	p := a, n, a, b, c.
	
	nextSet := (self next: a in: p).
	self assert: nextSet anySatisfy: [:e | e matches: 'abc'].
	self assert: nextSet anySatisfy: [:e | e matches: 'bc'].


]

{ #category : #'test next' }
FirstFollowNextTests >> testNextDelegate1 [

	| a nextSet b c p |
	a := 'a' asParser optional wrapped.
	b := 'b' asParser optional wrapped.
	c := 'c' asParser optional wrapped.
	p := a, b, c.

	nextSet := (self next: a in: p).
	self assert: nextSet anySatisfy: [:e | e end matches: 'b'].
	self assert: nextSet anySatisfy: [:e | e end matches: 'c'].



]

{ #category : #'test next' }
FirstFollowNextTests >> testNextRepeat1 [
	| p nextSet a b n  c |
	a := 'a' asParser star.
	
	nextSet := (self next: a in: a).
	self assert: nextSet size: 1.
	self assert: nextSet anySatisfy: [:e | e end matches: '']

]

{ #category : #'test next' }
FirstFollowNextTests >> testNextRepeat2 [
	| p nextSet a b astar |
	a := 'a' asParser.
	b := 'b' asParser.
	astar := a star.
	
	p := astar, b.
	
	nextSet := (self next: astar in: p).

	self assert: nextSet size: 1.
	self assert: nextSet anySatisfy: [:e | e end matches: 'b'].



]

{ #category : #'test next' }
FirstFollowNextTests >> testNextRepeat3 [
	| p nextSet a b astar |
	a := 'a' asParser.
	b := 'b' asParser.
	
	p := a star, b.
	
	nextSet := (self next: a in: p).

	self assert: nextSet size: 2.
	self assert: nextSet anySatisfy: [:e | e end matches: 'b'].
	self assert: nextSet anySatisfy: [:e | e end matches: 'a'].

]

{ #category : #'test next' }
FirstFollowNextTests >> testNextRepeat4 [
	| a nextSet b p root |
	a := 'a' asParser.
	b := 'b' asParser optional.
	
	p := a, b.
	root := p plus.
	
	nextSet := (self next: a in: root).
	self assert: nextSet size = 3.
	self assert: nextSet anySatisfy: [ :e | e matches: 'a'].
	self assert: nextSet anySatisfy: [ :e | e matches: 'ab'].
	self assert: nextSet anySatisfy: [ :e | e acceptsEpsilon ].


]

{ #category : #'test next' }
FirstFollowNextTests >> testNextSequence [
	| a p nextSet b c |
	a := 'a' asParser.
	b := 'b' asParser.
	c := 'c' asParser.
	
	p := a, b, c.
	
	nextSet := (self next: a in: p).
	self assert: nextSet noneSatisfy: [:e | e matches: 'b' ].
	self assert: nextSet noneSatisfy: [:e | e matches: 'c' ].
	self assert: nextSet anySatisfy: [:e | e matches: 'bc' ].



]

{ #category : #'test next' }
FirstFollowNextTests >> testNextSequence2 [
	| a p nextSet b c |
	a := 'a' asParser.
	b := 'b' asParser.
	c := 'c' asParser.
	
	p := (a, b) wrapped, c.
	
	nextSet := (self next: a in: p).
	self assert: nextSet anySatisfy: [:e | e matches: 'b' ].
	self assert: nextSet noneSatisfy: [:e | e matches: 'c' ].
	self assert: nextSet anySatisfy: [:e | e matches: 'bc' ].



]

{ #category : #'test next' }
FirstFollowNextTests >> testNextSequence3 [
	| a p nextSet b c |
	a := 'a' asParser.
	b := 'b' asParser.
	c := 'c' asParser.
	
	p := (a, b sea) wrapped, c.
	
	nextSet := (self next: a in: p).
	self assert: nextSet size = 2.
	
	self assert: nextSet anySatisfy: [:e | e matches: 'b' ].
	self assert: nextSet anySatisfy: [:e | e matches: 'c' ].


]

{ #category : #'test next' }
FirstFollowNextTests >> testNextSequence4 [
	| a p nextSet b c d |
	a := 'a' asParser.
	b := 'b' asParser.
	c := 'c' asParser.
	d := 'd' asParser.
	
	p := (a, b sea, c sea) wrapped, d.
	
	nextSet := (self next: a in: p).
	self assert: nextSet size = 2.
	
	self assert: nextSet anySatisfy: [:e | e matches: 'bc' ].
	self assert: nextSet anySatisfy: [:e | e matches: 'd' ].


]
