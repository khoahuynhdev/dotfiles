let c = 0

" for loop with array
for i in [1,2,3,4]
  let c+=i
endfor
echom c

" range
for i in range(1,10)
  let c+=i
endfor
echom c

" while loop
let b = 0
while b <= 100
  let b+=1
endwhile
echom b

" dictionary
echo { 'a': 1, 'b': [1,2,3] }['b']

let foo = { 'a': 1 }
let foo.a = 1000
let foo.b = 2000
echo foo

" remove the entry with the given keys and return the removed value
let removed = remove(foo, 'a')
" just remove the entry
unlet foo.b

echo foo
echo removed
echom get({'a': 100}, 'a', 'default')
echom get({'a': 100}, 'b', 'default')
echom has_key({'a': 100}, 'a')
echom has_key({'a': 100}, 'b')
