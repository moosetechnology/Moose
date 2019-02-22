"
RTMapExample new installTitle: 'ColoredAfrica03' 
		code:
		'
		
			b := RTMapBuilder new.	
		
	countries := RTMapBuilder africanPopulation.
	countriesName := countries collect: #first.
	max := (countries collect: [ :c | c at: 2 ]) max.
	
	cn := RTMultiLinearColor new
		colors: (ColorPalette sequential colors: 8 scheme: ''GnBu'');
		command: [ :aCountry | (countries detect: [ :c | c first = aCountry ]) second / max ].
	
	b countries: countriesName.
	b color: cn.
	b scale: 2.
	b build.
	^ b view'
	
"
Class {
	#name : #RTMapExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-Map'
}

{ #category : #sources }
RTMapExample >> exampleAfricanPopulation [

	| b countries cn sum|
	b := RTMapBuilder new.	
		
	countries := RTMapBuilder countriesPopulation select: [ :c | RTSVGPath africa includes: (c at: 1) ].
	sum := (countries collect: [ :c | c at: 2 ])inject: 0 into: [ :acc :n | acc + n ].
	
	cn := RTNColorLinearNormalizer
		inContext: (countries collect: [:c | c at: 2])
		lowColor: (Color r:0.8 g:0.8 b:1)
		highColor: (Color r:0 g:0 b:0.3).
	
	b countries: countries named: [ :c | c at: 1 ].
	b color: [ :c | cn rtValue: (c at: 2) ].
	b withPopup: [ :c |
		(c at: 1) asString, ': ',
		(((c at: 2) / sum * 100 asFloat roundTo: 0.01) printString), '%'].
	b scale: 2.
	b build.
	^ b view
]

{ #category : #icons }
RTMapExample >> exampleAfricanPopulationIcon [
	^ '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
RU5ErkJggg=='
]

{ #category : #sources }
RTMapExample >> exampleCity01 [

	| b |
	b := RTMapBuilder new.
	
	b countries: RTMapBuilder southAmerica.
	b cities: #( " (name, population) pairs "
		#('Santiago' 6027000)
		#('Bogota' 6763000)
		#('Buenos Aires' 12801365)
		#('Brasilia' 2481000)
		#('Montevideo' 1338000)
		#('Lima' 8473000)
		#('La Paz' 789585)
		#('Quito' 1608000)
		#('Sao Paulo' 19889559)
		#('Caracas' 2104000))
		named: [ :c | c at: 1 ].
	
	" Cities' pop-ups show their population "
	b cities
		withPopup: [ :c | (c at: 1), ': ', (((c at: 2) / 1000000 roundTo: 0.01) asString), 'M'].
	
	" Cities' size and color depend on the population "
	b cities shape
		size: [ :c | (c at: 2)/300000 + 10 ];
		if: [ :c | (c at: 2) < 1000000 ] fillColor: (Color green alpha: 0.5);
		if: [ :c | (c at: 2) >= 1000000 and: (c at: 2) < 5000000 ] fillColor: (Color yellow alpha: 0.5);
		if: [ :c | (c at: 2) >= 5000000 ] fillColor: (Color red alpha: 0.5).
	
	" We define some routes and color them, then we set the pop-ups to show each route's length "
	b routes
		from: 'Santiago' toAll: #('Buenos Aires' 'Lima' 'Sao Paulo');
		from: 'Bogota' toAll: #('Sao Paulo' 'Brasilia' 'Quito');
		ifRoute: [ :r | r fromCityName = 'Bogota' ] lineColor: (Color brown);
		ifRoute: [ :r | r fromCityName = 'Santiago' ] lineColor: (Color blue);
		withPopup: #lengthString.
	
	" We set the countries' colors, scale, and pop-up "
	b color: Color veryVeryLightGray.
	b scale: 3.
	b withPopup.
	b build.
	^ b view
]

{ #category : #icons }
RTMapExample >> exampleCity01Icon [
	^ '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
AAAASUVORK5CYII='
]

{ #category : #sources }
RTMapExample >> exampleCity01WithNames [

	
	| b |
	b := RTMapBuilder new.
	
	b countries: RTMapBuilder southAmerica.
	b cities: #( " (name, population) pairs "
		#('Santiago' 6027000)
		#('Bogota' 6763000)
		#('Buenos Aires' 12801365)
		#('Brasilia' 2481000)
		#('Montevideo' 1338000)
		#('Lima' 8473000)
		#('La Paz' 789585)
		#('Quito' 1608000)
		#('Sao Paulo' 19889559)
		#('Caracas' 2104000))
		named: [ :c | c at: 1 ].
	
	" Cities' pop-ups show their population "
	b cities
		withPopup: [ :c | (c at: 1), ': ', (((c at: 2) / 1000000 roundTo: 0.01) asString), 'M'].
	
	" Cities' size and color depend on the population "
	b cities shape
		size: [ :c | (c at: 2)/300000 + 10 ];
		if: [ :c | (c at: 2) < 1000000 ] fillColor: (Color green alpha: 0.5);
		if: [ :c | (c at: 2) >= 1000000 and: (c at: 2) < 5000000 ] fillColor: (Color yellow alpha: 0.5);
		if: [ :c | (c at: 2) >= 5000000 ] fillColor: (Color red alpha: 0.5);
		withTextAbove: #first.
	
	" We define some routes and color them, then we set the pop-ups to show each route's length "
	b routes
		from: 'Santiago' toAll: #('Buenos Aires' 'Lima' 'Sao Paulo');
		from: 'Bogota' toAll: #('Sao Paulo' 'Brasilia' 'Quito');
		ifRoute: [ :r | r fromCityName = 'Bogota' ] lineColor: (Color brown);
		ifRoute: [ :r | r fromCityName = 'Santiago' ] lineColor: (Color blue);
		withPopup: #lengthString.
	
	" We set the countries' colors, scale, and pop-up "
	b color: Color veryVeryLightGray.
	b scale: 3.
	b withPopup.
	b build.
	^ b view
]

{ #category : #icons }
RTMapExample >> exampleCity01WithNamesIcon [
	^ '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
EoX1ox+KifZ/ZFKa/WzLbnsAAAAASUVORK5CYII='
]

{ #category : #sources }
RTMapExample >> exampleColoredAfrica [

	| b countries countriesName max cn |	
	b := RTMapBuilder new.	
		
	countries := RTMapBuilder africanPopulation.
	countriesName := countries collect: #first.
	max := (countries collect: [ :c | c at: 2 ]) max.
	
	cn := RTMultiLinearColor new
		colors: (RTColorPalette sequential colors: 8 scheme: 'Reds');
		command: [ :aCountry | (countries detect: [ :c | c first = aCountry ]) second / max ].
	
	b countries: countriesName.
	b color: cn.
	b scale: 2.
	b build.
	^ b view
]

{ #category : #sources }
RTMapExample >> exampleColoredAfrica02 [

	|b countries countriesName max cn|	
			b := RTMapBuilder new.	
		
	countries := RTMapBuilder africanPopulation.
	countriesName := countries collect: #first.
	max := (countries collect: [ :c | c at: 2 ]) max.
	
	cn := RTMultiLinearColor new
		colors: (RTColorPalette sequential colors: 8 scheme: 'Purples');
		command: [ :aCountry | (countries detect: [ :c | c first = aCountry ]) second / max ].
	
	b countries: countriesName.
	b color: cn.
	b scale: 2.
	b build.
	^ b view
]

{ #category : #icons }
RTMapExample >> exampleColoredAfrica02Icon [
	^ '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'
]

{ #category : #sources }
RTMapExample >> exampleColoredAfrica03 [

	|b countries countriesName max cn|	
			b := RTMapBuilder new.	
		
	countries := RTMapBuilder africanPopulation.
	countriesName := countries collect: #first.
	max := (countries collect: [ :c | c at: 2 ]) max.
	
	cn := RTMultiLinearColor new
		colors: (RTColorPalette sequential colors: 8 scheme: 'GnBu');
		command: [ :aCountry | (countries detect: [ :c | c first = aCountry ]) second / max ].
	
	b countries: countriesName.
	b color: cn.
	b scale: 2.
	b build.
	^ b view
]

{ #category : #icons }
RTMapExample >> exampleColoredAfrica03Icon [
	^ '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'
]

{ #category : #icons }
RTMapExample >> exampleColoredAfricaIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAREklEQVR4XuXdaUwbaZoH8Oxo
58tsz6f5MNJ+Xq20Gu2nXal3NTu7rW1tZ7Stibo3nXQm6el0ksl9AYFAOMJlDoPNZZv7MDYG
bHP5AGwgmMMc4b6PhCOBHJA7IXfgebbe6lTJxlfhJMSkHukvQkK6Sf143vetqtflbYj8L1+q
bfw/BPwH4X/xH4T/IPwv/oPwH4T/xX8Q/oPwv/gPwn8Q/hf/QVzXysoK3L9/Hyq1Whhrb0KN
Wg2V6nKQZ2aA2WwG/oN84KqU58JQqQzWemrRVfDeIp2+tmb+g7yPMpcXw1JLDd4a6oIbVGQZ
6dCSn+IWwTYLw5dpkJleK/+HrHetvr5egNFWXB9LjpATSHZMCDAd0tbawv8O8bbm5uagXpHj
FIOkLOECJ5D4C+dYkNk+Kw4PDwP/QbyojpJMlxgkh7/7E+chK/5CAIvSUKWG62MDONh+Cfo6
WsFkMjkAvX79GnSaMmg3GSAlPhaePn3KGbG7uxs+ORCDTucSIyfcD7lC2OblzVms06gAHy2j
bRYnhoB0o+3/f3yw3+HrCOKEtgjmdCpUKhTs19dXVUBvWQFa29vo33vw4MGnB1Kc5zhU3Wyu
wtZ8Mbzo0HkF8u3Xf3Q4yLa5PT2KreY66O/vB22JwuFr4eESrgr+yuZ17CFU7/kSmM+fRR3A
59EH8FbIPtQo5PBJgZTlZ7Eg0jA/mKwuwktZCV5BMDHlp7oF8ZQOkx5sQZxl3G8X/TWaU/s+
HZCqPAmN0VEig/Z8EbwLgm1S/I+8EwiJJ5AT//47GkQlTd36ILrCTOhV57GdkRp8+r1hkMgF
Fz44yHTA9yA9dRDW1ta2NkhhWjINMWUsgfnORtRKhHhg3x7IjAl9bygjxjL80CAkdTLx1p7U
FRnJbFecP3EY8mTpkCESwvc7vwV8cg/b6g1AzR/vDJMrToTNALl+/s/w/Pnzrdsh9zuMNEZd
djIUZUlohPWRiYWw93+/fCeUUXXWpoCQVIee3Jogmuw0ujta5BKYHu6HjOQEpyC5onjApTm0
6jVglsZ5DdMoi4fYgBNOYZ7fvv7eQEg6K0phS4HoteXsUPXq4R2sKS/BzqZ6pyCShGgahIlS
LPD6fKQqIw7KstMxPVFAw1SVFIEoJgKe3px/ryDmnLStBXKpNJ8GMWYKAZ89QmcQTG6ND6At
CMlwcx3UpMVw7ha1MBysunLAW1eRiVIiQoWMWqLevY6r1H+zpqQQFsYHXQ5tVwJ2byiRR36C
LQGiUBRDXXE2lkpFmJ0mhrHeTlyamXQJYihXwnoQJkZquTxTXeASprMwBaoLZHYQtokMPEuD
2MZQKsfx7jYHmLU+04az2RO81x3SZWkCd11hm4SoCJcgJE9mRrA5K9EBRSm8CHDzCrrCIFm5
Oox9TUYHFJKakgLotTTAu4BsmSHr/u2bnEFa6w3oDoRJA3V5hEBIgk+BSZUP7iDs4gTDNuqC
TPAGg2Szbxt7DZIpk3EGocMBhCQ1Jpw7BBWVLAU8gZB4C9KukW8NEElGhk+AZCbGeARZW573
GuSaUYkXzvmDz4MUZMmgzWSE6tJiTjADjQbgAqLKTN0QiFIq9tgdN0Yue4Vhksaz88/U5CT4
NIiBmjCR+skjKc+xP0OHx3fR2lBrF+bk0F0eXx3B1cVpzhipsREeu+P+lWE8efBHr+YQfVYy
C6Kjzrt8FiQ5LobFYGKpUYM6TwZdtZWcOqG6KBuE4edhos2MXQbthrqC5N54L3KZO7Tp8V5P
6MKocHi8OIPN+kpoNlRhF3XiOz4+Dj4HMjY2Bmu3Z1FPnYgNNBlZlMfU8tUTxKuFadQX5wLe
nkESU2mhHcbScBcmhARAs1bpFunltXEcoTA9gdRJBF7PHwn/+c+g3vFvsBrwf0hy69jXWCiI
gJ6eHvC5IaultgZaqstBniFiu0UUGeq2O0xlcrhLfrLfYjA59uOf2YOf9PnvIWfbr5Ek6B/+
Cb775WeQ53capX6n6V//8ItfQcLnv0f/v/01nDn0o9sh69ZYL77uqfMK4yl1aeeV37fIYNhG
FBEC1vZ28CkQazN1wvX0AXY1N2Bc6Hlo0WlAW5gNOaIEVEhTQBwdbofTWlOOj6YHHTCY6BW5
mJUkYDG4ZM9vfgs1yny3HSIKOObVkNWy5wtwhkGiEoRC7MUwtyBtbW0wNDQEmwZC7qqpS1Uw
bqXO2O8u4Po8nhu36w6DMo8epqasjSiOCoXooLNYnJ4MscH+qCArq/s3kESy7TNOGNlUWkoL
IMXDxL535zcbBlGHHHOJQZIQHQGxYSFAthsxx2N+fh4mhvohPjwErvRQ3XPvBo6OjsKm3w9J
E8azIPHhwXB3ephFiQnygyrqWlVaTBikRofSnfDy2gTC3BCbBq0S22urWJBMjt2R9qcdMNVS
C/RGOlfzh7YMkFrxdZXlcka5YSpFdxhMLlWowKLTYlleJn3wmaxcn6Y/Lk0MfrxbuOQOobmy
nF4imsh9hLcgRgU1ed+gLjq+zZ3hDvrjFYuBBZlqN2NZQRYNcvQ//sB5yBoyV0NSRLADxmh7
A4VcguWFOTQGiT5LxBkk5thfOIFMHvgKckUJdhgk1A8X/VFXXgIfDWR1dZVdr5ur1FinLqFR
kqhlrS0IE3F4IDAgutw0uDc/SXeHlONwdeaL/wLqOjuSmMvlLEr/pVogS1MGgsnS1QmolArB
80SuR+PR74ALCJOrh7aD6cJx6DEbYHGkF+cHu2kQZzsqN3XXSYrw53verfV66iTxLvofPwJL
Q1YHjNfzo/j6aj/bIXFBp8GgVtIgXDDit/0drl0fQwZEk5MBHdTBSKNuWK0+WMb1GLZJCznj
FqWvRIqJu7dvCITJ49M7sE1fQWPQP5C+sC/r8uVuuGwx0yDPlhcQFiccQDJiw8B2Dpm6pIMH
16bx5e05jKQOdsi2XzmH2LUTlgfboaNGxXbHylQvjnS1gTuE9WnIS/XYKUX7d2wI5YXfN9hp
rGSHr9Z32KX/3jfKkeFLo1LQKMOdLQ5D1sp0Pz4Z66QxRs2V1BBjgjt37tj9A85v/9puLgn5
x9+xCLYRBJ3dEAbJzFAvXKnXuAWZrMzHzr1fcEJ5Q6XHWMFiXNJXgU/tXGSq0VwPorho0OZK
QFdVCW/evKG/0WvXroFKIQelvAjcLamDf/EZxPzNZ3DyN38PMYGnnYLUFmc7gJQlRUHRib3Q
bKymP5+yNqE++SIY/X+AWeFZWC2IxBsp53BYnQ0G6hbyjE5u1zFPrTpsk8VCQ0oEFHzzB5cQ
Fuo8RRIfDd1mAzuhz/Z3wsOHD30T5H0W2UB92ahxilKWK6MPvEGtgnRqCf46/yKSg85kKuE0
2H6+Ppbgn6A4JggTTh2E5SYNCk7+BGvtWmTSKY0C+R//FfK++hdoz4yFyP07gTrwuH51BXcX
sauzE3xi5+JmVL2+2ikIyckjh+ghcuxyu9uD7yoxJ/bDWr8ZmWQFHbVDsU1q7EVwhjE5NgI+
sVFus0pNzUsPbs6jOEEAek0p5ElToUJZiOK4KMxOTaZB+ovSvAIpDDxsB5Jx/oRLkKzkeLA/
76gGq9UKPrNzcbPq1NHDFEI6Wur1SK6hPb1zA5V5WTQEE8F3/7NhkJIgewySviIRugLJpy73
MBiZae9/H/CWAVlZXqQhbDPZ12kHUnxk54ZBYo7vt8OoTY9x2R0kJdkSGsNsNPjW1d7NrNyc
bFiPQdLeUMeCmLUlXg1X0pBTKA44AumBx6EiMRQER/e5BclPTYIcSbrv3Q/ZzCLnNsvz0yxE
i8lAf+xtu0SDNFJnyN5gxO/+Cp7MT2Dsod2w2qRAJt2yaKiKC3IKI0+I+KCvH9kyQ9ZAfx/d
JQVZEpge6IbBDgs+uTVPd0fNxTNedUcitbqqVuTjZHGyHQiT6lh/aEqPZDEWmirBZzc5fIwa
pFBSyCZrm3mDxHjuR69A4nZ9BYMtZhgpSHAKQhL3191sp0xPT/MfZH2Vq5SQJoiEijwp1Cnz
sDPWu+4gEVIXEvVxAegKg0mzOBQTQ/x9exvQxyzRyf1wTxKMt9MC0VsMkpvUJRRPGEw28vAB
3oHkpFHnAuRK8ttQV4G9AnlDXWa5ockATxivG+Q4NDjAfxC3ZQNCkuN3kB66ltODsDxTDOkR
gWiIOusRRX18F6cO6a4o5j+IuypOS4T1KBaNHJ5M9rKfJ4UFup1fik7tgwcmFZZEnPbYJS01
av6DuKtXc8MOXbI+yWHnXILcSg2023l5c6SbPKEIs/wPOAWpSzzPfxB31UA2VXgAIXHXIeu3
w5Lcn+zDJ7X5TlEqSpX8X/a6O3vnAlInjUfqBhee/PJzGIg+xnZMfcAPDvuTV+bGEJdmUHhs
LzuETRYngeDQLtDJEkEuFvAfxFXV1ho5gbAhw9JwN6pEsVAhjgHxnu2gJi/2sQGZ7WmlQVrV
hQDzQ3jzciOSj0xyEyM9ggBV73I5fkuCLC8vw6CpyiPI2CU9LPS14ZMrgw5D063RHmy/cBCe
zo+zv6fNl+Ij6mvLJEKwhWAyVK/1vNiQy6FFW8wvkD6ys4VDV5SR55Y4mSdcZfeOr+HxzBA2
qIuhu1rpgLLY3eD2+9LpdNCpK6XubI55fSK5JUF6qfvrXEDyRQKPIOSJqbLYUPbgr84OYHzo
Oeirr0RnXeJy1ffqFUx1NtEYJDVVlfwAmZmZ4Tx3ZMSEuQVp0Cjh5MG/gDDEDwgEc9CXxy5j
anSoQ4eU58mcHmRtacnb/WI/Y0hiw6BeV8UPEIFAAI+pk787Qx2cUMjzVZxh5IoTYKanlf2z
3gY9zFpNNEKLpsgBoyTL8VEbL168YBFs06wu4s8cQsZpXKFuVFERRIRBfFQEJMVGgSiOWjnF
x0JhSjy0VShgibq+RYa20sxUSIyJhO1f/jcEnjgCluoyuxcZ2Z2DUJ2xHkKRmQ7k8efOvper
w33oDKSnrZlfy95e8sjxtyiuQnbkd7c00ncWr0+O0De3Gg1VbocwsqxlINbmBrFQ5v5WbZmy
2GmHmM0mfq2yyGscPYEo8pzfh48LD3GJknTBnwZZ6mvG/t4eTucc6zEmmg3AyxNDnbrULUql
qtgpCEmNSu4UxFKWT4P0NdVyOqhdHVYHkJ6WRn6CtLa2ugWpr9a6BCEJPn0cgLzc7i1GVYHM
brjydB7x8uVLGKW6YT3ImBcvY/skQEg11dc6RRmwtqA7DBJYuY8Cv6NgksRBaVKkw6oqPzfH
7YE1GhwxrrbXA2+vZZEqKixwCjLU1eYWo9VshJ6McFity0Mmz6fsV1galecruy9nB+1A+prr
+A2SnZW1YRDSGQOySDsMEoM0wa5L2poaPB5ceWqCXZfUVFfzG+TZs2dOQQrTk+kDzyDMjw/R
88mbx3fxuiIJ12OQmHOSYWWiC1sNlUBfDeBQ169MwmyHGRZ7moF+gh2fL7+z84ih2gFFX5j5
84t5KATy7HlywIWHv4f2lAvgDEMUdAqMyjwQJiZ+9Pcm2fIgV8jrMpyAzKhl2CgOdwqwPvqi
bJCnClGZK+M/yLvW7OwsrNxexNyMVLAF4QKxPr29PfwHeR9lsVigMTEQJKJEqFIpwJLiuTMu
HvsJLEnn2c+7pVE+8VZKn8wbS1L3zoFrJ0guBtHzS050MP13yKNofeXf8cmALCwswGtjDicQ
S/J56CwQ07+eKUqER48e8R/kQ5SpXAEbmTNul6V8sOde8R+EKvIAHK4Y1tRQ6O7u8rm34Puk
QMhL3zxB6KLPQJeu3GffC/GTAiG3VAsifj4RVF70A5NayT5kbHJykn2ahC8X/9++m/8g/C/+
g/AfhP/FfxD+g/C/+A/CfxD+F/9B+A/C/+I/CP/LZf0/s7zN1BIhG9gAAAAASUVORK5CYII='
]

{ #category : #sources }
RTMapExample >> exampleSouthAmericaPopulation [

	| b countries cn sum|
	b := RTMapBuilder new.	
		
	countries := RTMapBuilder countriesPopulation select: [ :c | RTSVGPath southAmerica includes: (c at: 1) ].
	sum := (countries collect: [ :c | c at: 2 ])inject: 0 into: [ :acc :n | acc + n ].
	
	cn := RTNColorLinearNormalizer
		inContext: (countries collect: [:c | c at: 2])
		lowColor: (Color r:0.8 g:0.8 b:1)
		highColor: (Color r:0 g:0 b:0.3).
	
	b countries: countries named: [ :c | c at: 1 ].
	b color: [ :c | cn rtValue: (c at: 2) ].
	b withPopup: [ :c |
		(c at: 1) asString, ': ',
		(((c at: 2) / sum * 100 asFloat roundTo: 0.01) printString), '%'].
	b scale: 2.
	b build.
	^ b view
]

{ #category : #icons }
RTMapExample >> exampleSouthAmericaPopulationIcon [
	^ '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
iAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTMapExample >> exampleWorldPopulation [

	| b countries cn |
	b := RTMapBuilder new.	
		
	countries := RTMapBuilder countriesPopulation select: [ :c | RTSVGPath countries includes: (c at: 1) ].
	
	cn := RTNColorLinearNormalizer
		inContext: (countries collect: [:c | c at: 2])
		lowColor: (Color r:0.8 g:0.8 b:1)
		highColor: (Color r:0 g:0 b:0.3).
	
	b countries: countries named: [ :c | c at: 1 ].
	b color: [ :dic | cn rtValue: (dic at: 2) ].
	b withPopup: [ :c | (c at: 1) asString, ': ',(((c at: 2) / 1000000 asFloat roundTo: 0.001) asString, ' Million') ].
	b build.
	^ b view
]

{ #category : #icons }
RTMapExample >> exampleWorldPopulationIcon [
	^ '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
TkSuQmCC'
]

{ #category : #accessing }
RTMapExample >> label [
	^ 'Geographical maps'
]
