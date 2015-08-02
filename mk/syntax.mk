# Rules for converting code to syntax-highlighted HTML.

%.html: %.sh
	pygmentize -F raiseonerror -f html -l sh -o $@ $<
