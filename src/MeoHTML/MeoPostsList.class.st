"
Meo Posts list component
"
Class {
	#name : #MeoPostsList,
	#superclass : #WAComponent,
	#category : #'MeoHTML-Components'
}

{ #category : #accessing }
MeoPostsList >> blog [
	^ MeoBlog current
]

{ #category : #rendering }
MeoPostsList >> renderContentOn: html [
	(self blog allVisibleBlogPosts) do: [ :p |
		html heading 
			level1;
			with: p title.
		html div: p text
	]
]
