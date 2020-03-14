all:
	make template
	#make compilehy

template:
	python3 tools/parse_pygrammarspecs.py > tools/template.hy

# compilehy:
# 	for f in src/py2hy/*.hy; do g=`echo $$f | sed -e 's/.hy$$/.py/' | sed -e 's/^src\///'`;\
# 		hy2py3 $$f > $$g; done
# 	python3 -m compileall .
