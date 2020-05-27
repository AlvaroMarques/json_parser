
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%

\{ {
	return START_JSON;
}

\} {
	return STOP_JSON;
}

: {
	return TWO_DOTS;
}

, {
	return COMMA;
}

[\[] {
	return START_LIST;
}

\] {
	return END_LIST;
}

[0-9]+ {
	return NUM;
}
\"[A-Za-z0-9]+\" {
	return TEXT;
}
 
%%

int yywrap() {
  return 1;
}
